<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Supply</title>
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

<body style="padding: 20px;; min-width: 1200px">
<%
    ResultSet resultSet = DatabaseManager.getResources((Connection)session.getAttribute("connection"));


%>
<div style="width: 50%; margin: 0 auto; box-sizing: border-box; border: solid black 2px; padding: 20px">
    <div style="text-align: right">
        <form action="BackToWorker">
        <input type="submit" value="Назад" id="back">
        </form>
    </div><br>
    <form action="OrderResource">
    <table style="width: 100%; border-collapse: collapse; margin: 0 auto;">
        <thead>
            <td style="width: 60%">Інгрідієнт</td>
            <td style="width: 15%; text-align: center">Кількість</td>
            <td style="width: 25%; text-align: center">Ціна за одиницю<br>продукції</td>
        </thead>
        <%
            try {
            while(resultSet.next()) {
                %>
                    <tr>
                        <td><%=resultSet.getString("name")%></td>
                        <td style="text-align: center"><input type="number" name="<%=resultSet.getInt("id")%>"> <%=resultSet.getString("value")%></td>
                        <td style="text-align: center"><%=resultSet.getDouble("price")%> грн.</td>
                    </tr>
                <%
            }

                    } catch (Exception e) {
                    }
                %>
    </table><br>
    <%--<div style="text-align: right">Загальна ціна : <%="3000"%> грн.</div><br>--%>

    <div><input type="submit" id="order" value="Замовити"></div>
    </form>
</div>
</body>
</html>
