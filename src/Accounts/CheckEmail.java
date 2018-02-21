package Accounts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "CheckEmail")
public class CheckEmail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        if(Database.DatabaseManager.isEmailUsed((Connection)request.getSession()
                .getAttribute("connection"), email)){
            response.setContentType("text/plain");
            response.getWriter().write("Email is already in use");
        }else{
            response.setContentType("text/plain");
            response.getWriter().write("");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
