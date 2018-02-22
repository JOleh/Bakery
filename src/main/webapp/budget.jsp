<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Budget</title>
        <link rel="stylesheet" href="CSS/budgetStylesheet.css">
        <link rel="stylesheet" href="CSS/BODY.css">
        <link rel="stylesheet" href="CSS/EXIT.css">
    </head>
    <body>

        <%
            if(session.getAttribute("level")==null) response.sendRedirect("index.jsp");
            switch((int)session.getAttribute("level")){
                case 1: response.sendRedirect("productList.jsp");break;
                case 2: response.sendRedirect("resourcesStartPageForWorker.jsp");break;
                case 3: response.sendRedirect("orderingStartPageForCourier.jsp");break;
                case 4: break;
                case 5: break;
                default: response.sendRedirect("index.jsp");
            }
        %>

        <div class="maindiv">
            <div class="exitdiv">
                <form action="BackToManager">
                <input type="submit" value="Назад" id="back">
                </form>
            </div>
            <%
                try{
                    ResultSet resultSet = DatabaseManager.getBudget((Connection)session.getAttribute("connection"));
                    resultSet.next();
            %>
            <br>
            <div>
                Бюджет :
                <%=resultSet.getDouble("budget")%>
                грн.
            </div>
            <br><br>
            <table>
                <thead>
                    <td>
                        Дата
                    </td>
                    <td>
                        Сума
                    </td>
                </thead>
                <%
                    do{
                %>
                <tr>
                    <td>
                        <%=resultSet.getTimestamp("recording_date")%>
                    </td>
                    <td>
                        <%=resultSet.getDouble("budget")%>
                        грн.
                    </td>
                </tr>
                <%
                    }while(resultSet.next());
                    resultSet.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </table>
        </div>
    </body>
</html>
