<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Supply</title>
    <link rel="stylesheet" href="CSS/supplyWStylesheet.css">
    <link rel="stylesheet" href="CSS/BODY.css">
    <link rel="stylesheet" href="CSS/EXIT.css">
</head>

<%
    if (session.getAttribute("level") == null) {
        response.sendRedirect("index.jsp");
    }
    switch ((int) session.getAttribute("level")) {
        case 1:
            response.sendRedirect("productList.jsp");
            break;
        case 2:
            break;
        case 3:
            response.sendRedirect("orderingStartPageForCourier.jsp");
            break;
        case 4:
            response.sendRedirect("productListStartPageForManager.jsp");
            break;
        case 5:
            response.sendRedirect("workerListStartPageForAdmin");
            break;
        default:
            response.sendRedirect("index.jsp");
    }
%>
<body>
<%
    ResultSet resultSet = DatabaseManager
            .getResources((Connection) session.getAttribute("connection"));
%>
<div class="maindiv">
    <div class="exitdiv">
        <form action="BackToWorker">
            <input type="submit" value="Назад" id="back">
        </form>
    </div>
    <br>
    <form action="OrderResource">
        <table>
            <thead>
            <td class="ingredienttd">
                Інгрідієнт
            </td>
            <td class="numbertd">
                Кількість
            </td>
            <td class="pricetd">
                Ціна за одиницю<br>продукції
            </td>
            </thead>
            <%
                try {
                    while (resultSet.next()) {
                        if (resultSet.getBoolean("active")) {
            %>
            <tr>
                <td>
                    <%=resultSet.getString("name")%>
                </td>
                <td>
                    <input type="number" name="<%=resultSet.getInt("id")%>" id="field">
                    <%=resultSet.getString("value")%>
                </td>
                <td>
                    <%=resultSet.getDouble("price")%>
                    грн.
                </td>
            </tr>
            <%
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
        <br>

        <div>
            <input type="submit" id="order" value="Замовити">
        </div>
    </form>
</div>
</body>
</html>
