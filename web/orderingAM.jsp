<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ordering</title>
    <style>
        td{
            border: solid black 1px;
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
        case 4: break;
        case 5: break;
        default: response.sendRedirect("index.jsp");
    }
%>

<div style="width: 50%; box-sizing: border-box; border: solid black 2px; margin: 0 auto; padding: 20px">
    <div style="text-align: right">
        <form action="BackToManager">
        <input type="submit" value="Назад" name="back">
        </form>
    </div>
    <br>
        <%
            for (int i = 0; i <4 ; i++) {
                %>
    <div style="border: solid black 1px; box-sizing: border-box; padding: 10px; width: 100%; margin: 0 auto">
                    <div style="float:left; width: 50%">Замовник : <%="Consumer"%></div>
                    <div style="float:left; text-align: right; width: 50%">Дата : <%="21.10.2017"%></div>
                    <table style="border-collapse: collapse; width: 100%; margin: 0 auto">
                        <%
                            for (int j = 0; j <4 ; j++) {
                                %>
                                <tr>
                                    <td style="width: 50%"><%="Product"%></td>
                                    <td style="width: 25%"><%="200"%> шт.</td>
                                    <td style="width: 25%"><%="3000"%> грн.</td>
                                </tr>
                                <%
                            }
                        %>
                    </table>
                    <br>
                    <div style="text-align: right">Загальна ціна : <%="30000"%> грн.</div><br>
                    <div style="float: left; width: 25%">Доставлено <input type="checkbox" id="ifDone" disabled></div>
                    <div style="float: left; width: 25%">Відмовлено <input type="checkbox" id="ifRefused" disabled></div>
                    <div style="float: left; width: 25%">Кур'єр <input type="checkbox" id="courier" disabled> <%="name"%></div>
                    <div style="float:left; text-align: right; width: 25%"><input type="button" value="Відмовити" id="refuse"></div>
        <br>
    </div>
                    <br><br>
                <%
            }
        %>
</div>
</body>
</html>
