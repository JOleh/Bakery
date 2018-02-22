package backManager;

import database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

//@WebServlet(name = "ExitFromAdministrationAccount")
public class ExitFromAdministrationAccount extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("level")!=null){
            switch((Integer)session.getAttribute("level")){
                case 3:
                case 4:session.removeAttribute("name");
                    session.removeAttribute("surname");
                    session.removeAttribute("level");
                    session.removeAttribute("phonenumber");
                    session.removeAttribute("email");
                    session.removeAttribute("password");
                    session.removeAttribute("id");
                    response.sendRedirect("index.jsp");break;
                case 5: session.removeAttribute("name");
                    session.removeAttribute("surname");
                    session.removeAttribute("level");
                    session.removeAttribute("phonenumber");
                    session.removeAttribute("email");
                    session.removeAttribute("password");
                    session.removeAttribute("id");
                    DatabaseManager.setProjectInfo((Connection)session
                                    .getAttribute("connection"), request.getParameter("companyTitle"),
                            request.getParameter("companyPhone"),request.getParameter("companyEmail"));
                    response.sendRedirect("index.jsp");break;
                default: response.sendRedirect("index.jsp");
            }
        }else{
            response.sendRedirect("index.jsp");
        }


    }
}
