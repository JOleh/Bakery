package orderManager;

import database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.Map;

/*@WebServlet(name = "SaveOrderProduction")*/
public class SaveOrderProduction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<Integer,Integer> map = (Map<Integer,Integer>)session.getAttribute("order");
        if(map.size()==0){
            response.sendRedirect("basket.jsp");
            return;
        }
        String address = "";
        boolean courier = request.getParameter("checkCourier")!=null;
        if(courier){
            address = request.getParameter("address");
        }
        double allprice = (Double)session.getAttribute("allorderingprice");


        DatabaseManager.saveOrderingProduction((Connection)session.getAttribute("connection") ,
                map, (Integer)session.getAttribute("id"), new Timestamp(System.currentTimeMillis()),allprice, address );
        response.sendRedirect("productList.jsp");
    }
}
