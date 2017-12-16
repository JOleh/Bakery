<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.xml.crypto.Data" %><%--
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
            try {
                ResultSet resultSet = DatabaseManager.getOrderProductionList((Connection)session.getAttribute("connection"));
                int i = 0;
                while(resultSet.next()){
                %>
    <div style="border: solid black 1px; box-sizing: border-box; padding: 10px; width: 100%; margin: 0 auto">
                    <div style="float:left; width: 50%">Замовник : <%=resultSet.getString("uname")%> <%=resultSet.getString("usurname")%></div>
                    <div style="float:left; text-align: right; width: 50%">Дата : <%=resultSet.getTimestamp("date")%></div>
                    <table style="border-collapse: collapse; width: 100%; margin: 0 auto">
                        <%
                            ResultSet resultSet2 = DatabaseManager.getLocalOrderProductionList((Connection)session.getAttribute("connection"), resultSet.getInt("oid"));
                            while(resultSet2.next()){
                                %>
                                <tr>
                                    <td style="width: 40%"><%=resultSet2.getString("name")%></td>
                                    <td style="width: 25%"><%=resultSet2.getInt("count")%> шт.</td>
                                    <td style="width: 35%"><%=resultSet2.getInt("count")*resultSet2.getDouble("price")%> грн.</td>
                                </tr>
                                <%
                            }
                            resultSet2.close();
                        %>
                    </table>
                    <br>
                    <div style="text-align: right">Загальна ціна : <%=resultSet.getDouble("price")%> грн.</div><br>
                    <div style="float: left; width: 25%">Доставлено <input type="checkbox" id="ifDone" disabled value="<%=resultSet.getBoolean("isdone")%>"></div>
                    <div style="float: left; width: 25%">Відмовлено <input type="checkbox" id="ifRefused" disabled value="<%=resultSet.getBoolean("isrefused")%>"></div>
                    <%

                        if(false){
                            System.out.println("address not null");
                        ResultSet rs = DatabaseManager.getUserByID((Connection)session.getAttribute("connection"), resultSet.getInt("idcourier"));
                        rs.next();
                    %>
                    <div style="float: left; width: 25%">Кур'єр <input type="checkbox" id="courier" disabled>id(<%=rs.getInt("id")%>) <%=rs.getString("name")%> <%=rs.getString("surname")%></div>
                    <%
                            rs.close();
                        }
                        System.out.println("after address");
                    %>
                    <div style="float:left; text-align: right; width: 25%"><input type="submit" value="Відмовити" id="refuse" %><br></div>
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
</body>
</html>
