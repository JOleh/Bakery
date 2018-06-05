package accounts;

import database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

public class CheckPhone extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String phone = request.getParameter("phone");
    if (DatabaseManager.isPhoneUsed((Connection) request.getSession()
        .getAttribute("connection"), phone)) {
      response.setContentType("text/plain");
      response.getWriter().write("Phone is already in use");
    } else {
      response.setContentType("text/plain");
      response.getWriter().write("");
    }
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

  }
}
