package Accounts;

import Database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "Checker")
public class Checker extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = (String)request.getParameter("login");
        String password = (String)request.getParameter("password");
        System.out.println(login+"   "+password);
        HttpSession session = request.getSession();
        Connection connection = (Connection) session.getAttribute("connection");
        if((login!=null && password!=null)){
            System.out.println("PL not NULL");
            ResultSet resultSet = DatabaseManager.lodOnUser(connection, login, password);
            if(resultSet!=null) {
                System.out.println("RS not NULL");
                try {
                    while (resultSet.next()) {
                        System.out.println("In resultSet loop");
                        session.setAttribute("name", resultSet.getString("name"));
                        session.setAttribute("surname", resultSet.getString("surname"));
                        session.setAttribute("level", resultSet.getInt("level"));
                        session.setAttribute("password", resultSet.getString("password"));
                        session.setAttribute("email", resultSet.getString("email"));
                        session.setAttribute("phonenumber", resultSet.getString("phonenumber"));
                        session.setAttribute("id", resultSet.getInt("id"));
                        String way = "index.jsp";
                        switch (resultSet.getInt("level")) {
                            case 1:
                                way = "productList.jsp";
                                break;
                            case 2:
                                way = "resourcesStartPageForWorker.jsp";
                                break;
                            case 3:
                                way = "orderingStartPageForCourier.jsp";
                                break;
                            case 4:
                                way = "productListStartPageForManager.jsp";
                                break;
                            case 5:
                                way = "workerListStartPageForAdmin.jsp";
                                break;
                        }
                        response.sendRedirect(way);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            else{
                System.out.println("NO");
            }
        }else{
            System.out.println("not Enter");
        }
    }
}
