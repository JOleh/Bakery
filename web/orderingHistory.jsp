<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
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
            try {
                ResultSet resultSet = DatabaseManager.getProductOrderingList((Connection)session.getAttribute("connection"), (int)session.getAttribute("id"));
                int i = 0;
                while(resultSet.next()){
                %>
        <div style="border: solid black 1px; box-sizing: border-box; padding: 10px">
            <div >Дата : <%=resultSet.getTimestamp("date")%></div>
                <table style="border-collapse: collapse; width: 100%; margin: 0 auto">
                    <thead>
                        <td style="width: 40%">Продукт</td>
                        <td style="width: 25%">Кількість</td>
                        <td style="width: 35%">Ціна</td>
                    </thead>
                <%
                    ResultSet resultSet2 = DatabaseManager.getLocalOrderProductionList((Connection)session.getAttribute("connection"), resultSet.getInt("id"));
                    while(resultSet2.next()){
                     %>
                    <tr>
                        <td style="width: 40%"><%=resultSet2.getString("name")%></td>
                        <td style="width: 25%"><%=resultSet2.getInt("count")%> шт.</td>
                        <td style="width: 35%"><%=resultSet2.getInt("count")*resultSet2.getDouble("price")%> грн.</td>
                    </tr>
                    <%
                 }
                 %></table><br>
                <div style="text-align: right">Загальна ціна : <%=resultSet.getDouble("price")%> грн.</div>

            <%
                if((System.currentTimeMillis()-resultSet.getTimestamp("date").getTime())<1000*60*60){
                    %>
                    <br>
            <form action="EditOrder">
                    <input type="submit" value="Редагувати" name="edit">
            </form>
            <form action="DeleteOrder">
                    <input type="submit" value="Відмінити замовлення" name="<%=resultSet.getInt("id")%>">(Якщо минуло менше години часу)
            </form>
                    <%
                }
            %>

                <br>
        </div>
        <br><br>
                <%
                            i++;
                        }
                        resultSet.close();
                    } catch (Exception e) {
                    }
        %>
    </div>
</div>
</body>
</html>
