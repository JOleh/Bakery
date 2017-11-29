<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>
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
        case 1: response.sendRedirect("productList.jsp");break;
        case 2: break;
        case 3: response.sendRedirect("orderingStartPageForCourier.jsp");break;
        case 4: response.sendRedirect("productListStartPageForManager.jsp");break;
        case 5: response.sendRedirect("workerListStartPageForAdmin");break;
        default: response.sendRedirect("index.jsp");
    }
%>

    <div  style="width: 50%; box-sizing: border-box; border: solid black 2px; margin: 0 auto; padding: 20px">
        <div style="text-align: right">
            <form action="BackToWorker">
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
                    <td style="width: 60%">Інгрідієнт</td>
                    <td style="width: 20%; text-align: center">Кількість</td>
                    <td style="width: 20%; text-align: center">Ціна</td>
            </thead>
        <%
            for (int j = 0; j < 6; j++) {
        %>
            <tr>
                <td><%="Молоко"%></td>
                <td style="text-align: center"><%="20"%><%="л."%></td>
                <td style="text-align: center"><%="300"%> грн.</td>
            </tr>
        <%
            }
        %></table><br>
    <div style="text-align: right">Загальна ціна : <%="2999"%>грн.</div>
    <br>
    Підтверджено : <input type="checkbox" id="ifConfirmed" disabled>
    <br>
</div>
<br>
<%
    }
%>
</body>
</div>
</html>
