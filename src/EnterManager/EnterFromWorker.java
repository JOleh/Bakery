package EnterManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EnterFromWorker")
public class EnterFromWorker extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("supplyList")!=null){
            response.sendRedirect("supplyListW.jsp");
        } else if(request.getParameter("orderList")!=null){
            response.sendRedirect("orderingAM.jsp");
        } else if(request.getParameter("order")!=null){
            response.sendRedirect("supplyW.jsp");
        }

    }
}
