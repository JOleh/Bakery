<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>History</title>
    <style>
        td{
            border: solid black 1px;
        }
        thead{
            border: solid black 2px;
            font-weight: bold;
        }
    </style>
</head>
<body style="padding: 20px; min-width: 1200px">

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

<div  style="width: 50%; border: solid black 2px; padding: 20px; box-sizing: border-box; margin: 0 auto ">
    <div>
        <div style="text-align: right">
            <form action="BackToConsumer">
                <input type="submit" value="Назад" id="back">
            </form>
        </div>
        <br>
        <%
            for (int i = 0; i <4 ; i++) {
                %>
        <div style="border: solid black 1px; box-sizing: border-box; padding: 10px">
                    Дата : <%="21.10.2017"%>
                <table style="border-collapse: collapse; width: 100%; margin: 0 auto">
                    <thead>
                        <td style="width: 60%">Продукт</td>
                        <td style="width: 20%">Кількість</td>
                        <td style="width: 20%">Ціна</td>
                    </thead>
                <%
                 for (int j = 0; j < 6; j++) {
                     %>
                    <tr>
                        <td><%="Булка"%></td>
                        <td><%="20"%> шт.</td>
                        <td><%="300"%> грн.</td>
                    </tr>
                    <%
                 }
                 %></table><br>
                <div style="text-align: right">Загальна ціна : <%="2999"%> грн.</div>
                <br>
                <input type="button" value="Редагувати" id="edit"> <input type="button" value="Відмінити замовлення">
                (Якщо минуло менше години часу)<br>
        </div>
        <br><br>
                <%
            }
        %>
    </div>
</div>
</body>
</html>
