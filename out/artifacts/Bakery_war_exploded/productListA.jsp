<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
</head>
<body style="padding: 20px; min-width: 1200px">

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

    <div style="width: 50%; box-sizing: border-box; border: solid black 2px; margin: 0 auto; padding: 20px">
    <div style="text-align: right">
        <form action="BackToAdmin">
            <input type="submit" value="Назад" name="back">
        </form>
    </div>
    <br>
    <table style="width: 100%; margin: 0 auto; box-sizing: border-box; border-collapse: collapse">
        <thead>
            <td style="width: 65%; text-align: center">Продукт</td>
            <td style="width: 35%; text-align: center">Ціна</td>
        </thead>
        <%
            for (int i = 0; i <12 ; i++) {
        %>
        <tr>
            <td style="border: solid black 1px; width: 30%;"><%="Булка"%></td>
            <td style="border: solid black 1px; width: 20%; text-align: center"><%="200"%> грн.</td>
            <td style="width: 25%">
                <form action="EnterFromAdmin">
                <input type="submit" name="edit" value="Редагувати">
                </form>
            </td>
            <td style="width: 25%">
                <form action="EnterFromAdmin">
                <input type="submit" name="delete" value="Видалити">
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <br>
    <div>
        <form action="EnterFromAdmin">
        <input type="submit" name="add" value="Додати продукцію">
        </form>
    </div>
    </div>
</body>
</html>
