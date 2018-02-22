package saveManager;

import database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

//@WebServlet(name = "SaveNewResource")
public class SaveNewResource extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection connection = (Connection)session.getAttribute("connection");

        String name = "";
        String value = "";
        double price  = 0;
        double count = 0;
        if(!request.getParameter("resourcename").equals("")){
            name = request.getParameter("resourcename");
        }else{
            response.sendRedirect("addResourcePage.jsp");
        }

        if(!request.getParameter("value").equals("")){
            value = request.getParameter("value");
        }else{
            response.sendRedirect("addResourcePage.jsp");
        }

        if(!request.getParameter("price").equals("")){
            price = Double.parseDouble(request.getParameter("price"));
        }else{
            response.sendRedirect("addResourcePage.jsp");
        }

        if(!request.getParameter("count").equals("")){
            count = Double.parseDouble(request.getParameter("count"));
        }else{
            response.sendRedirect("addResourcePage.jsp");
        }

        DatabaseManager.addResource(connection, name, value, price,count);
        response.sendRedirect("resourcesStartPageForWorker.jsp");
    }
}
