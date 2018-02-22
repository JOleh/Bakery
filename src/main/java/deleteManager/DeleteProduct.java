package deleteManager;

import database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.Enumeration;

/*@WebServlet(name = "DeleteProduct")*/
public class DeleteProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Database.DatabaseManager
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection connection = (Connection)session.getAttribute("connection");
        Enumeration<String> names = request.getParameterNames();
        while (names.hasMoreElements()){
            String name = names.nextElement();
            Integer id = Integer.parseInt(name.substring(name.lastIndexOf("e")+1, name.length()));
            DatabaseManager.removeProduct(connection, id);
        }
            if(((Integer)session.getAttribute("level")==5)){
            response.sendRedirect("productListA.jsp");
        }else if(((Integer)session.getAttribute("level")==4)){
            response.sendRedirect("productListStartPageForManager.jsp");
        }
    }
}
