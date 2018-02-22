package accounts;

import database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.Enumeration;

/*@WebServlet(name = "DeleteUser")*/
public class DeleteUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Enumeration<String> names = request.getParameterNames();
        while(names.hasMoreElements()){
            String current = names.nextElement();
            if(current!=null){
                Integer id = Integer.valueOf(current);
                System.out.println(id);
                    database.DatabaseManager.removeUser((Connection)request.getSession().getAttribute("connection"), id);
                response.sendRedirect("workerListStartPageForAdmin.jsp");
            }
        }
    }
}
