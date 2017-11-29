<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Basket</title>
    <style>
        td{
            border: solid black 1px;
        }
        thead{
            font-weight: bold;
        }
    </style>
</head>
<body style="padding: 40px; min-width: 1200px">

<%
    if(session.getAttribute("level")==null) response.sendRedirect("index.jsp");
    switch((int)session.getAttribute("level")){
        case 1: break;
        case 2: response.sendRedirect("resourcesStartPageForWorker.jsp");break;
        case 3: break;
        case 4: break;
        case 5: break;
        default: response.sendRedirect("index.jsp");
    }
%>

    <div style="width: 50%; border: solid black 2px; box-sizing: border-box; padding: 30px; margin: 0 auto">
    <div style="font-size: 64px; text-align: center ; border-bottom: solid black 1px">К о р з и н а</div>
    <br><br>
    <div >
        <table style="width: 100%; border-collapse: collapse; text-align: center ;margin: 0 auto">
            <thead>
                <td>Продукт</td>
                <td>Кількість</td>
                <td>Ціна</td>
            </thead>
            <%
                for (int i = 0; i <8 ; i++) {
                    %><tr>
                        <td style="width: 60%"><%="Булка"%></td>
                        <td style="width: 20%"><%="300"%></td>
                        <td style="width: 20%"><%="1500"%> грн.</td>
                    </tr>
                    <%
                }%>
        </table>
        <br>
        <div style="text-align: right">
            Загальна ціна : <%="10000"%> грн.
        </div>
        <br>
        <div>
            Кур'єр
            <input type="checkbox" id="checkCourier">
            <input type="text" id="address" placeholder="Введіть адресу доставки">
        </div>
        <br>
        <div style="text-align: left; float:left;">
            <input type="button" value="Замовити" id="order">
        </div>
        <div style="text-align: right; float: right">
            <form action="BackToConsumer">
                <input type="submit" value="Назад" name="back">
            </form>
        </div>
    </div>
    </div>
</body>
</html>
