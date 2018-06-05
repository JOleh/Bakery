<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Resources</title>
    <link rel="stylesheet" href="CSS/resourceAMStylesheet.css">
    <link rel="stylesheet" href="CSS/BODY.css">
    <link rel="stylesheet" href="CSS/EXIT.css">
</head>
<body>
<%
    if (session.getAttribute("level") == null) {
        response.sendRedirect("index.jsp");
    }
    switch ((int) session.getAttribute("level")) {
        case 1:
            response.sendRedirect("productList.jsp");
            break;
        case 2:
            response.sendRedirect("resourcesStartPageForWorker.jsp");
            break;
        case 3:
            response.sendRedirect("orderingStartPageForCourier.jsp");
            break;
        case 4:
            break;
        case 5:
            break;
        default:
            response.sendRedirect("index.jsp");
    }
%>

<div class="maindiv">
    <div class="exitdiv">
        <form action="BackToManager">
            <input type="submit" value="Назад" name="back" id="back">
        </form>
    </div>
    <br>
    <table>
        <thead>
        <td class="ingredienttd">
            Інгрідієнт
        </td>
        <td class="numbertd">
            Кількість
        </td>
        </thead>
        <%
            try {
                ResultSet resultSet =
                        DatabaseManager
                                .getResources((Connection) session.getAttribute("connection"));
                while (resultSet.next()) {
        %>
        <tr>
            <td>
                <%=resultSet.getString("name")%>
            </td>
            <td>
                <%=resultSet.getDouble("count")%>
                <%=resultSet.getString("value")%>
            </td>
        </tr>
        <%
                }
                resultSet.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</div>
</body>
</html>
