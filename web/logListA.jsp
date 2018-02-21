<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Logs</title>
        <link rel="stylesheet" href="CSS/LogListAStylesheet.css">
    </head>
    <body>
        <%
            if(session.getAttribute("level")==null) response.sendRedirect("index.jsp");
            switch((int)session.getAttribute("level")){
                case 1: response.sendRedirect("productList.jsp");break;
                case 2: response.sendRedirect("resourcesStartPageForWorker.jsp");break;
                case 3: response.sendRedirect("orderingStartPageForCourier.jsp");break;
                case 4: response.sendRedirect("productListStartPageForManager.jsp");break;
                case 5: break;
                default: response.sendRedirect("index.jsp");
            }
        %>

        <div>
            <div>
                <form action="BackToAdmin">
                    <input type="submit" value="Назад" id="back">
                </form>
            </div>
            <br>
            <table>
                <thead>
                    <td class="usertd">
                        User
                    </td>
                    <td class="actiontd">
                        Action
                    </td>
                    <td class="datetd">
                        Date
                    </td>
                </thead>
                    <%
                    try {
                        ResultSet resultSet = DatabaseManager.getLogs((Connection)session.getAttribute("connection"));
                        while(resultSet.next()){
                    %>
                        <tr>
                            <td>
                                id=<%=resultSet.getInt("log.id_user")%>
                                <%=resultSet.getString("users.name")%>
                                <%=resultSet.getString("users.surname")%>
                            </td>
                            <td>
                                <%=resultSet.getString("log.action")%>
                            </td>
                            <td class="datetd2">
                                <%=resultSet.getTimestamp("log.data")%>
                            </td>
                        </tr>
                    <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
            </table>
        </div>
    </body>
</html>
