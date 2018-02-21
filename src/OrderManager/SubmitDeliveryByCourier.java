package OrderManager;

import Database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Enumeration;

@WebServlet(name = "SubmitDeliveryByCourier")
public class SubmitDeliveryByCourier extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Enumeration<java.lang.String> enumeration = request.getParameterNames();
        HttpSession session = request.getSession();
        Connection connection = (Connection)session.getAttribute("connection");

        while (enumeration.hasMoreElements()){
            String str = enumeration.nextElement();
            if(str.startsWith("ifordergotten")){
                boolean ifget = request.getParameter(str)!=null;
                if(ifget){
                    int id = Integer.parseInt(str.substring(str.lastIndexOf("n")+1, str.length()));
                    DatabaseManager.setOrderingGotten(connection , id, (int)session.getAttribute("id"));
                }
            }
            else if (str.startsWith("iforderdelivered")){
                boolean ifdev = request.getParameter(str)!=null;
                if(ifdev){
                    int id = Integer.parseInt(str.substring(str.lastIndexOf("d")+1, str.length()));
                    DatabaseManager.setOrderingDelivered(connection , id);
                    DatabaseManager.setBudget(connection, DatabaseManager.getOrderPriceByID(connection, id));
                }
            }
        }
        response.sendRedirect("orderingStartPageForCourier.jsp");
    }
}
