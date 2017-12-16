package OrderManager;

import Database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "OrderResource")
public class OrderResource extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Enumeration<String> names = request.getParameterNames();
        HttpSession session = request.getSession();
        Connection connection = (Connection)session.getAttribute("connection");
        Map<Integer,Double> map = new HashMap<>();
        while(names.hasMoreElements()){
            String str = names.nextElement();
            if(!request.getParameter(str).equals("")){
                map.put(Integer.parseInt(str), Double.parseDouble(request.getParameter(str)));//System.out.println(names.nextElement());
            }
        }
        double allprice = 0;
        for ( Map.Entry<Integer,Double> mSet : map.entrySet()) {
            allprice+= DatabaseManager.getResourcePriceByID(connection, mSet.getKey())*mSet.getValue();
        }
        DatabaseManager.saveOrderResources(connection, map , new Timestamp(System.currentTimeMillis()), allprice);
        response.sendRedirect("supplyListW.jsp");
    }
}
