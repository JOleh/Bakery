package enterManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;

public class OpenProductFromAM extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Enumeration<String> names = request.getParameterNames();
        while(names.hasMoreElements()){
            String current = names.nextElement();
            if(current!=null){
                Integer id = Integer.valueOf(current);
                HttpSession session = request.getSession();
                session.setAttribute("chosen_product_id", id);
                response.sendRedirect("singleProductAM.jsp");
            }
        }
    }
}
