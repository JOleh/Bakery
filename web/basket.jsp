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
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Basket</title>
        <link rel="stylesheet" href="CSS/basketStylesheet.css">
        <link rel="stylesheet" href="CSS/BODY.css">
        <link rel="stylesheet" href="CSS/EXIT.css">
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
    <body>
        <%
            Map<Integer,Integer> map = (Map<Integer,Integer>)session.getAttribute("order");
            double all = 0;
        %>
        <div class="maindiv">
            <div class="exitdiv">
                <form action="BackToConsumer">
                <input type="submit" value="Назад" name="back">
                </form>
            </div>
            <form action="SaveOrderProduction">
                <div class="titlediv">
                    К о р з и н а
                </div>
                <br><br>
                <div >
                    <table>
                        <thead>
                            <td>Продукт</td>
                            <td>Кількість</td>
                            <td>Ціна</td>
                        </thead>
                        <%
                        try {
                            for (Map.Entry<Integer, Integer> mSet : map.entrySet()) {
                                ResultSet rs =
                                        DatabaseManager
                                                .getProductByIDNoImage((Connection)session.getAttribute("connection"),
                                                        mSet.getKey());
                                rs.next();
                                all+=rs.getDouble("price")*mSet.getValue();
                        %>
                        <tr>
                            <td class="nametd">
                                <%=rs.getString("name")%>
                            </td>
                            <td class="valuetd">
                                <%=mSet.getValue()%>
                            </td>
                            <td class="pricetd">
                                <%=rs.getDouble("price")*mSet.getValue()%> грн.
                            </td>
                        </tr>
                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        %>
                    </table>
                    <br>
                    <div class="allprice">
                        Загальна ціна : <%=all%> грн.
                        <%
                            session.setAttribute("allorderingprice", all);
                        %>
                    </div>
                    <br>
                    <div class="buttondiv">
                        <div>
                            Кур'єр
                            <input type="checkbox" name="checkCourier">
                            <input type="text" name="address" placeholder="Введіть адресу доставки">
                        </div>
                        <br>
                        <div class="ordersubmit">
                            <input type="submit" value="Замовити" name="order">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
