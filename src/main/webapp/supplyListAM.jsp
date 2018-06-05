<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>List</title>
    <link rel="stylesheet" href="CSS/supplyListAMStylesheet.css">
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
            <input type="submit" value="Назад" id="back">
        </form>
    </div>
    <br>
    <%
        try {
            ResultSet resultSet =
                    DatabaseManager
                            .getGlobalSupplyList((Connection) session.getAttribute("connection"));
            while (resultSet.next()) {
    %>
    <div class="tablediv">
        Дата : <%=resultSet.getTimestamp("date")%>
        <table>
            <thead>
            <td class="ingredienttd">Інгрідієнт</td>
            <td class="numbertd">Кількість</td>
            <td class="pricetd">Ціна</td>
            </thead>
            <%
                ResultSet resultSet2 =
                        DatabaseManager
                                .getLocalSupplyList((Connection) session.getAttribute("connection"),
                                        resultSet.getInt("id"));
                while (resultSet2.next()) {
            %>
            <tr>
                <td>
                    <%=resultSet2.getString("name")%>
                </td>
                <td>
                    <%=resultSet2.getDouble("count")%>
                    <%=resultSet2.getString("value")%>
                </td>
                <td>
                    <%=resultSet2.getDouble("count") * resultSet2.getDouble("price")%>
                    грн.
                </td>
            </tr>
            <%
                }
                resultSet2.close();
            %>
        </table>
        <br>
        <div class="allpricediv">
            Загальна ціна :
            <%=resultSet.getDouble("allprice")%>
            грн.
        </div>
        <br>
        <%
            if (resultSet.getObject("isconfirmed") != null) {
                if (resultSet.getBoolean("isconfirmed")) {
        %>
        Підтверджено
        <%
        } else {
        %>
        Відхилено
        <%
            }
        } else {

        %>
        <form action="ConfirmRefuseResourceOrder">
            <input type="submit" value="Підтвердити" name="confirm<%=resultSet.getInt("id")%>">
            <input type="submit" value="Відмовити" name="refuse<%=resultSet.getInt("id")%>">
        </form>
        <%
            }
        %>

    </div>
    <br>
    <%
            }
            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</div>
</body>
</html>
