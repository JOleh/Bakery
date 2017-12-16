<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.net.ConnectException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %><%--
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
<body style="padding: 40px; min-width: 1200px">
    <%
        System.out.println("in basket jsp");
        Map<Integer,Integer> map = (Map<Integer,Integer>)session.getAttribute("order");
        double all = 0;

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
                try {
                for (Map.Entry<Integer, Integer> mSet : map.entrySet()) {
                    ResultSet rs = DatabaseManager.getProductByIDNoImage((Connection)session.getAttribute("connection"), mSet.getKey());
                    rs.next();
                    all+=rs.getDouble("price")*mSet.getValue();
                    %><tr>
                        <td style="width: 60%"><%=rs.getString("name")%></td>
                        <td style="width: 20%"><%=mSet.getValue()%></td>
                        <td style="width: 20%"><%=rs.getDouble("price")*mSet.getValue()%> грн.</td>
                    </tr>
                    <%


                        }
                } catch (Exception e) {
                    e.printStackTrace();
                        }
                    %>
        </table>
        <br>
        <div style="text-align: right">
            Загальна ціна : <%=all%> грн.
            <%
                session.setAttribute("allorderingprice", all);
            %>
        </div>
        <br>
        <form action="SaveOrderProduction">
        <div>
            Кур'єр
            <input type="checkbox" name="checkCourier">
            <input type="text" name="address" placeholder="Введіть адресу доставки">
        </div>
        <br>
        <div style="text-align: left; float:left; width: 50%">

            <input type="submit" value="Замовити" name="order">

        </div>
        </form>
        <div style="text-align: right; float: left; width: 50%">
            <form action="BackToConsumer">
                <input type="submit" value="Назад" name="back">
            </form>
        </div>
    </div>
    </div>
</body>
</html>
