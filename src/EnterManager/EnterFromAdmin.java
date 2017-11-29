package EnterManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EnterFromAdmin")
public class EnterFromAdmin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("saleRegime")!=null){
            response.sendRedirect("productList.jsp");
        }else if(request.getParameter("resources")!=null){
            response.sendRedirect("resourcesAM.jsp");
        }else if(request.getParameter("products")!=null){
            response.sendRedirect("productListA.jsp");
        }else if(request.getParameter("supplyResources")!=null){
            response.sendRedirect("supplyListAM.jsp");
        }else if(request.getParameter("Ordering")!=null){
            response.sendRedirect("orderingAM.jsp");
        }else if(request.getParameter("budget")!=null){
            response.sendRedirect("budget.jsp");
        }else if(request.getParameter("logs")!=null){
            response.sendRedirect("logListA.jsp");
        }else if(request.getParameter("add")!=null){
            response.sendRedirect("singleProductAM.jsp");
        }else if(request.getParameter("edit")!=null){
            response.sendRedirect("singleProductAM.jsp");
        }else if(request.getParameter("delete")!=null){
            response.sendRedirect("productListA.jsp");
        }
    }
}
