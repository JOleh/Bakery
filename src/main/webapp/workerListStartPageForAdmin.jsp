<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><%=session.getAttribute("nameP")%>
    </title>
    <link rel="stylesheet" href="CSS/startAdmin.css">
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
            response.sendRedirect("productListStartPageForManager.jsp");
            break;
        case 5:
            break;
        default:
            response.sendRedirect("index.jsp");
    }
%>
<form action="ExitAdminAccount">
    <div class="headerTitle">
        <input type="text" name="companyTitle" id="companyTitle" placeholder="Введіть назву пекарні"
               value="<%=session.getAttribute("nameP")%>">
    </div>
    <div class="contactInfo">
        <div class="exit">
            <input type="submit" value="Вихід" id="exit">
        </div>
        <div class="info">
            Телефон : <br>
            <input type="tel" name="companyPhone" value="<%=session.getAttribute("phoneP")%>">
            <br>
            Email : <br>
            <input type="email" name="companyEmail" value="<%=session.getAttribute("emailP")%>">
        </div>
    </div>
</form>
<div class="products">
    <%
        ResultSet resultSet =
                DatabaseManager.getUsersInfo((Connection) session.getAttribute("connection"));
        try {
            while (resultSet.next()) {
                if (resultSet.getBoolean("active")) {
                    String position = " ";
                    switch (resultSet.getInt("level")) {
                        case 1:
                            position = "Client";
                            break;
                        case 2:
                            position = "Worker";
                            break;
                        case 3:
                            position = "Courier";
                            break;
                        case 4:
                            position = "Manager";
                            break;
                        case 5:
                            position = "Admin";
                            break;
                    }
    %>
    <div class="tablediv">
        <table>
            <thead>
            <td>Ім'я</td>
            <td>Прізвище</td>
            <td>Номер</td>
            <td>Email</td>
            <td>Посада</td>
            <td>Пароль</td>
            </thead>
            <tr>
                <td>
                    <input type="text" name="name" value="<%=resultSet.getString("name")%>">
                </td>
                <td>
                    <input type="text" name="surname" value="<%=resultSet.getString("surname")%>">
                </td>
                <td>
                    <input type="tel" name="phonenumber"
                           value="<%=resultSet.getString("phonenumber")%>">
                </td>
                <td>
                    <input type="email" name="email" value="<%=resultSet.getString("email")%>">
                </td>
                <td>
                    <input type="text" name="position" value="<%=position%>">
                </td>
                <td>
                    <input type="text" name="password" value="<%=resultSet.getString("password")%>">
                </td>
            </tr>
        </table>
        <br>
        <div class="okcanceldiv">
            <input type="submit" value="OK" name="ok">
            <input type="submit" value="Cancel" name="cancel">
        </div>
        <div class="deletediv">
            <form action="DeleteUser">
                <input type="submit" name="<%=resultSet.getInt("id")%>"
                       value="Видалити користувача">
            </form>
        </div>
        <br>
    </div>
    <br>
    <%
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    %>
    <input type="submit" id="add" value="Додати користувача">
</div>
<div class="navigation">
    <%=session.getAttribute("name")%> <%=session.getAttribute("surname")%><br><br>
    <form action="EnterFromAdmin">
        <input type="submit" name="saleRegime" value="Режим покупця">
        <br>
        <input type="submit" name="resources" value="Ресурси">
        <br>
        <input type="submit" name="products" value="Продукти">
        <br>
        <input type="submit" name="supplyResources" value="Поставки ресурсів">
        <br>
        <input type="submit" name="Ordering" value="Замовлення">
        <br>
        <input type="submit" name="budget" value="Б'юджет">
        <br>
        <input type="submit" name="logs" value="Логи">
        <br>
    </form>
</div>
</body>
</html>
