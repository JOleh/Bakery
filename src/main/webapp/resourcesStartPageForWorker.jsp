<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Resources</title>
    <link rel="stylesheet" href="CSS/startWorker.css">
    <link rel="stylesheet" href="CSS/startPageChanges.css">
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

<div class="headerTitle">
    <%=session.getAttribute("nameP")%>
</div>
<div class="contactInfo">
    <div class="exit">
        <form action="ExitConsumerAccount">
            <input type="submit" value="Вихід" id="exit">
        </form>
    </div>
    <div class="info">
        Телефон :
        <br>
        <%=session.getAttribute("phoneP")%>
        <br>
        Email : <br>
        <%=session.getAttribute("emailP")%>
    </div>
</div>
<div class="products">
    <table>
        <thead>
        <td class="thingredienttd">
            Інгредієнт
        </td>
        <td class="thnumbertd">
            Кількість
        </td>
        <td class="thpricetd">
            Ціна за шт./л./кг.
        </td>
        </thead>
        <%
            try {
                ResultSet resultSet =
                        DatabaseManager
                                .getResources((Connection) session.getAttribute("connection"));
                while (resultSet.next()) {
                    if (resultSet.getBoolean("active")) {
        %>
        <tr>
            <td class="nametd"><%=resultSet.getString("name")%>
            </td>
            <td class="numbertd">
                <input type="text" id="count" value="<%=resultSet.getString("count")%>">
                <input type="text" id="show" value="<%=resultSet.getString("value")%>">
            </td>
            <td class="pricetd">
                <input type="text" id="price" value="<%=resultSet.getString("price")%>"> грн.
            </td>
            <td class="deleteButton">
                <form action="DeleteResource">
                    <input type="submit" value="Видалити" name="delete<%=resultSet.getInt("id")%>">
                </form>
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
    <form action="addResourcePage.jsp">
        <input type="submit" id="add" value="Додати">
    </form>
</div>
<div class="navigation">
    <%=session.getAttribute("name")%>
    <%=session.getAttribute("surname")%>
    <br><br>
    <form action="EnterFromWorker">
        <input type="submit" name="supplyList" value="Список поставок">
        <br>
        <input type="submit" name="orderList" value="Список замовлень продукції">
        <br>
        <input type="submit" name="order" value="Замовити">
        <br>
    </form>
</div>
</body>
</html>
