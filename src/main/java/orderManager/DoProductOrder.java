package orderManager;

import database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.Enumeration;

public class DoProductOrder extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    Connection connection = (Connection) session.getAttribute("connection");
    Enumeration<String> names = request.getParameterNames();
    while (names.hasMoreElements()) {
      String name = names.nextElement();
      Integer id = Integer.parseInt(name.substring(name.lastIndexOf("o") + 1, name.length()));
      DatabaseManager.setProductOrderDone(connection, id);
      DatabaseManager.setResourcesFromProductOrder(connection, id);
    }
    response.sendRedirect("orderingAM.jsp");
  }
}
