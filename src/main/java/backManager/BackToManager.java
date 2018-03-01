package backManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class BackToManager extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("level")!=null){
            int lvl = (Integer) session.getAttribute("level");
            if(lvl==2){
                response.sendRedirect("resourcesStartPageForWorker.jsp");
            }else
            if(lvl==4){
                response.sendRedirect("productListStartPageForManager.jsp");
            }else
            if(lvl==5){
                response.sendRedirect("workerListStartPageForAdmin.jsp");
            }
        }
    }
}
