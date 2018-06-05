<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>History</title>
    <link rel="stylesheet" href="CSS/BODY.css">
    <link rel="stylesheet" href="CSS/EXIT.css">
    <link rel="stylesheet" href="CSS/orderingHistoryStylesheet.css">
</head>
<body>
<%
    if (session.getAttribute("level") == null) {
        response.sendRedirect("index.jsp");
    }
    switch ((int) session.getAttribute("level")) {
        case 1:
            break;
        case 2:
            response.sendRedirect("resourcesStartPageForWorker.jsp");
            break;
        case 3:
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
    <div>
        <div class="exitdiv">
            <form action="BackToConsumer">
                <input type="submit" value="Назад" id="back">
            </form>
        </div>
        <br>
        <%
            try {
                ResultSet resultSet =
                        DatabaseManager
                                .getProductOrderingList(
                                        (Connection) session.getAttribute("connection"),
                                        (int) session.getAttribute("id"));
                while (resultSet.next()) {
        %>
        <div class="tablediv">
            <div>
                Дата :
                <%=resultSet.getTimestamp("date")%>
            </div>
            <table>
                <thead>
                <td class="nametd">
                    Продукт
                </td>
                <td class="numbertd">
                    Кількість
                </td>
                <td class="pricetd">
                    Ціна
                </td>
                </thead>
                <%
                    ResultSet resultSet2 =
                            DatabaseManager
                                    .getLocalOrderProductionList(
                                            (Connection) session.getAttribute("connection"),
                                            resultSet.getInt("id"));
                    while (resultSet2.next()) {
                %>
                <tr>
                    <td class="nametd">
                        <%=resultSet2.getString("name")%>
                    </td>
                    <td class="numbertd">
                        <%=resultSet2.getInt("count")%> шт.
                    </td>
                    <td class="pricetd">
                        <%=resultSet2.getInt("count") * resultSet2.getDouble("price")%> грн.
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <br>
            <div class="allpricediv">
                Загальна ціна :
                <%=resultSet.getDouble("price")%>
                грн.
            </div>
            <br>
            <%
                if (resultSet.getBoolean("isrefused")) {
            %>
            Відмовлено
            <%
            } else if (resultSet.getBoolean("isdelevered")) {
            %>
            Доставлено
            <%
            } else if (resultSet.getBoolean("isdone")) {
            %>
            Очікує доставки
            <%
            } else if ((System.currentTimeMillis() - resultSet.getTimestamp("date").getTime())
                    < 1000 * 60 * 60) {
            %>
            <form action="EditOrder">
                <input type="submit" value="Редагувати" name="edit">
            </form>
            <form action="DeleteOrder">
                <input type="submit" value="Відмінити замовлення"
                       name="<%=resultSet.getInt("id")%>">
            </form>
            <%
                }
            %>
        </div>
        <br><br>
        <%
                }
                resultSet.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>
</body>
</html>
