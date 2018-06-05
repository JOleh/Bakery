<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><%=session.getAttribute("nameP")%>
    </title>
    <link rel="stylesheet" href="CSS/startManager.css">
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
            response.sendRedirect("resourcesStartPageForWorker.jsp");
            break;
        case 3:
            response.sendRedirect("orderingStartPageForCourier.jsp");
            break;
        case 4:
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
        <form action="ExitAdminAccount">
            <input type="submit" value="Вихід" id="exit">
        </form>
    </div>
    <div class="info">
        Телефон : <br>
        <%=session.getAttribute("phoneP")%><br>
        Email : <br>
        <%=session.getAttribute("emailP")%>
    </div>
</div>
<div class="products">
    <table>
        <thead>
        <td class="theadproducttd">
            Продукт
        </td>
        <td class="theadpricetd">
            Ціна
        </td>
        </thead>
        <%
            try {
                ResultSet resultSet =
                        DatabaseManager
                                .getProductsOnScreenNoImage(
                                        (Connection) session.getAttribute("connection"));
                while (resultSet.next()) {
                    if (resultSet.getBoolean("active")) {
        %>
        <tr>
            <td class="nametd">
                <%=resultSet.getString("name")%>
            </td>
            <td class="pricetd">
                <%=resultSet.getDouble("price")%>
                грн.
            </td>
            <td class="editbutton">
                <form action="OpenProductFromAM">
                    <input type="submit" name="<%=resultSet.getInt("id")%>" value="Редагувати">
                </form>
            </td>
            <td class="deletebutton">
                <form action="DeleteProduct">
                    <input type="submit" name="delete<%=resultSet.getInt("id")%>" value="Видалити">
                </form>
            </td>
        </tr>
        <%
                    }
                }
                resultSet.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <br>
    <div>
        <form action="EnterFromManager">
            <input type="submit" name="add" value="Додати продукцію" id="addprod">
        </form>
    </div>
</div>
<div class="navigation">
    <%=session.getAttribute("name")%>
    <%=session.getAttribute("surname")%>
    <br><br>
    <form action="EnterFromManager">
        <input type="submit" name="saleRegime" value="Режим покупця">
        <br>
        <input type="submit" name="resources" value="Ресурси"
        ><br>
        <input type="submit" name="supplyResources" value="Поставки ресурсів">
        <br>
        <input type="submit" name="Ordering" value="Замовлення">
        <br>
        <input type="submit" name="budget" value="Б'юджет">
        <br>
    </form>
</div>
</body>
</html>
