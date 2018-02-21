<%@ page import="java.sql.Connection" %>
<%@ page import="Database.ConnectionFactory" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="sun.misc.BASE64Encoder" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 01.11.2017
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
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
            }
        %>
    <title><%=session.getAttribute("nameP")%></title>
        <link rel="stylesheet" href="CSS/startPage.css">
        <link rel="stylesheet" href="CSS/startIndex.css">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script type="text/javascript" src="enterScript.js"></script>
    </head>
    <body>
        <div class="headerTitle">
            <%=session.getAttribute("nameP")%>
        </div>
        <div class="contactInfo">
            Телефон :
            <br>
            <%=session.getAttribute("phoneP")%>
            <br>
            Email :
            <br>
            <%=session.getAttribute("emailP")%>
        </div>
        <div class="products">
            <table>
                <%
                    try {
                        ResultSet resultSet =
                                DatabaseManager
                                        .getProductsOnScreen((Connection)session.getAttribute("connection"));
                        int temporary = 0;
                        int i = 0;
                        while(resultSet.next()){
                            if(i-temporary==3){
                %>
                </tr>
                <%
                            }
                            if(i%3==0){
                                temporary = i;
                %>
                <tr>
                    <%
                      }
                    %>
                    <td>
                        <%
                            byte [] image = resultSet.getBytes("image");
                            BASE64Encoder base64Encoder = new BASE64Encoder();
                        %>
                        <img src="data:image/png;base64, <%=base64Encoder.encode(image)%>" alt="image"><br><br>
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
                        resultSet.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                </tr>
            </table>
        </div>
        <div class="navigation">
           <%-- <form action="Checker" method="get">--%>
                Логін :
                <br>
                <input type="text" id="login" placeholder="Введіть логін">
                <br>
                Пароль :
                <br>
                <input type="password" id="password" placeholder="Введіть пароль">
                <br>
                <div id="message"></div>
                <input type="submit" id="enter" value="Вхід">
                <br>
                <a href="registrationPage.jsp">Зареєструватись</a>
          <%--  </form>--%>
        </div>
    </body>
</html>
