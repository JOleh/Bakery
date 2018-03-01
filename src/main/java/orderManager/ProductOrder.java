package orderManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class ProductOrder extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("history")!=null){
            response.sendRedirect("orderingHistory.jsp");
        }else {
            Enumeration<String> nam = request.getParameterNames();
            HttpSession session = request.getSession();
            Map<Integer, Integer> map = new HashMap<>();
            while (nam.hasMoreElements()) {
                String str = nam.nextElement();
                if (str.length() < 4 && !str.equals("") && !request.getParameter(str).equals("")) {
                    map.put(Integer.parseInt(str), Integer.parseInt(request.getParameter(str)));
                }

            }
            session.setAttribute("order", map);
            response.sendRedirect("basket.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
