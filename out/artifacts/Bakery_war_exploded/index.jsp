<%@ page import="java.sql.Connection" %>
<%@ page import="Database.ConnectionFactory" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 01.11.2017
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <%

          if(session.getAttribute("connection")==null){
              Connection connection = ConnectionFactory.getConnection();
              session.setAttribute("connection", connection);
              session.setMaxInactiveInterval(1800);
          }

        ResultSet resultSetPI = DatabaseManager.getProjectInfo((Connection)session.getAttribute("connection"));

          try {
              while(resultSetPI.next()){
                  session.setAttribute("nameP",  resultSetPI.getString("name"));
                  session.setAttribute("emailP",  resultSetPI.getString("email"));
                  session.setAttribute("phoneP",  resultSetPI.getString("phonenumber"));
              }
          } catch (SQLException e) {
              e.printStackTrace();
              System.out.println("Can`t get project info");
          }

      %>
    <title><%=session.getAttribute("nameP")%></title>
    <link rel="stylesheet" href="CSS/startPageStyleSheet.css">
  </head>
  <body>
    <div class="headerTitle"><%=session.getAttribute("nameP")%></div>
    <div class="contactInfo">Телефон : <br>
        <%=session.getAttribute("phoneP")
        %><br>
        Email : <br>
        <%=session.getAttribute("emailP")
        %></div>
    <div class="products">
      <table>
        <%

            try {
                      ResultSet resultSet = DatabaseManager.getProductsOnScreen((Connection)session.getAttribute("connection"));
                      int temporary = 0;
                      int i = 0;
                      while(resultSet.next()){
                          if(i-temporary==3){
        %>
          </tr> <%
          }
          if(i%3==0){
              temporary = i;
      %>
          <tr>
              <%
                  }
              %>
              <td style="box-sizing: border-box; text-align: center; padding: 20px 10px 10px;">
                  <img src="<% %>" alt="image" style="height: 300px; width: 280px; border: solid black 1px;"><br><br>
                  <div class="name">
                      <%=resultSet.getString("name")%>
                  </div>
                  <div class="price">
                      <%=resultSet.getDouble("price")%>грн.
                  </div>
                  <br>
              </td>
              <%
                          i++;
                      }
                  } catch (Exception e) {
                  }
              %></tr>
      </table>
    </div>
    <div class="logging">
      <form action="Checker" method="get">
            Логін : <br>
            <input type="text" name="login" placeholder="Введіть логін"><br>
            Пароль : <br>
            <input type="password" name="password" placeholder="Введіть пароль"><br>
            <input type="submit" value="Вхід"><br>
            <a href="registrationPage.jsp">Зареєструватись</a>
      </form>
    </div>
  </body>
</html>
