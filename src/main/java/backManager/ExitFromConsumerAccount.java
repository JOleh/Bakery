package backManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ExitFromConsumerAccount extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("level")!=null){

            int lvl = (Integer)session.getAttribute("level");

        switch(lvl){
            case 1:
            case 2:
                session.removeAttribute("name");
                session.removeAttribute("surname");
                session.removeAttribute("level");
                session.removeAttribute("phonenumber");
                session.removeAttribute("email");
                session.removeAttribute("password");
                session.removeAttribute("id");
                response.sendRedirect("index.jsp");break;
            case 3: response.sendRedirect("orderingStartPageForCourier.jsp");break;
            case 4: response.sendRedirect("productListStartPageForManager.jsp");break;
            case 5: response.sendRedirect("workerListStartPageForAdmin.jsp");break;
            default: response.sendRedirect("index.jsp");
        }
        }
    }
}
