package EnterManager;

import Database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.Enumeration;

@WebServlet(name = "OpenSingleProduct")
public class OpenSingleProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String str = request.getParameter("productlink");
        if (str!=null){
            int id = Integer.valueOf(str);
            HttpSession session = request.getSession();
            session.setAttribute("chosen_product_id", id);
            response.sendRedirect("singleProductForConsumer.jsp");
        }
    }
}
