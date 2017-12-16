<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 22:30
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
        case 2: response.sendRedirect("resourcesStartPageForWorker.jsp");break;
        case 3: response.sendRedirect("orderingStartPageForCourier.jsp");break;
        case 4: break;
        case 5: break;
        default: response.sendRedirect("index.jsp");
    }
%>

<div style="width: 50%; box-sizing: border-box; border: solid black 2px; margin: 0 auto; padding: 20px">
    <div style="text-align: right">
        <form action="BackToManager">
        <input type="submit" value="Назад" id="back">
        </form>
    </div>
    <br>
    <%
        try {
            ResultSet resultSet = DatabaseManager.getGlobalSupplyList((Connection)session.getAttribute("connection"));
            int i = 0;
            while(resultSet.next()){
    %>
    <div style="border: solid black 1px; box-sizing: border-box; padding: 10px">
        Дата : <%=resultSet.getTimestamp("date")%>
        <table style="border-collapse: collapse; width: 100%; margin: 0 auto">
            <thead>
            <td style="width: 60%">Інгрідієнт</td>
            <td style="width: 20%; text-align: center">Кількість</td>
            <td style="width: 20%; text-align: center">Ціна</td>
            </thead>
            <%
                ResultSet resultSet2 = DatabaseManager.getLocalSupplyList((Connection)session.getAttribute("connection"), resultSet.getInt("id"));
                while(resultSet2.next()){
            %>
            <tr>
                <td><%=resultSet2.getString("name")%></td>
                <td style="text-align: center"><%=resultSet2.getDouble("count")%><%=resultSet2.getString("value")%></td>
                <td style="text-align: center"><%=resultSet2.getDouble("count")*resultSet2.getDouble("price")%> грн.</td>
            </tr>
            <%
                }
                resultSet2.close();
            %></table><br>
        <div style="text-align: right">Загальна ціна : <%=resultSet.getDouble("allprice")%>грн.</div>
        <br>
        <%
            if(resultSet.getObject("isconfirmed")!=null){
                if(resultSet.getBoolean("isconfirmed")){
                %>
            Підтверджено
        <%
            }else {
                %>
            Відхилено
        <%
            }
            }else{

            %>
        <form action="ConfirmRefuseResourceOrder">
            <input type="submit" value="Підтвердити" name="confirm<%=resultSet.getInt("id")%>"> <input type="submit" value="Відмовити" name="refuse<%=resultSet.getInt("id")%>">
        </form>
             <br>
        <%
            }
        %>

    </div>
    <br>
    <%
                i++;
            }
            resultSet.close();
        } catch (Exception e) {
        }
    %>
</div>
</body>
</html>
