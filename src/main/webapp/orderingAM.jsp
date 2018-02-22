<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Ordering</title>
        <link rel="stylesheet" href="CSS/orderingAMStylesheet.css">
        <link rel="stylesheet" href="CSS/EXIT.css">
        <link rel="stylesheet" href="CSS/BODY.css">
    </head>
    <body>
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
        <div class="maindiv">
            <div class="exitdiv">
                <form action="BackToManager">
                    <input type="submit" value="Назад" name="back">
                </form>
            </div>
            <br>
                <%
                    try {
                        ResultSet resultSet =
                                DatabaseManager
                                        .getOrderProductionList((Connection)session.getAttribute("connection"));
                        while(resultSet.next()){
                %>
            <div class="tablediv">
                <div class="consumerdiv">
                    Замовник :
                    <%=resultSet.getString("uname")%>
                    <%=resultSet.getString("usurname")%>
                </div>
                <div class="datediv">
                    Дата :
                    <%=resultSet.getTimestamp("date")%>
                </div>
                <table>
                    <%
                        ResultSet resultSet2 =
                                DatabaseManager
                                        .getLocalOrderProductionList((Connection)session.getAttribute("connection"),
                                                resultSet.getInt("oid"));
                        while(resultSet2.next()){
                    %>
                    <tr>
                        <td class="nametd">
                            <%=resultSet2.getString("name")%>
                        </td>
                        <td class="counttd">
                            <%=resultSet2.getInt("count")%>
                            шт.
                        </td>
                        <td class="pricetd">
                            <%=resultSet2.getInt("count")*resultSet2.getDouble("price")%>
                            грн.
                        </td>
                    </tr>
                    <%
                        }
                        resultSet2.close();
                    %>
                </table>
                <br>
                <div class="allprice">
                    Загальна ціна :
                    <%=resultSet.getDouble("price")%>
                    грн.
                </div>
                <br>
                <%
                if(resultSet.getBoolean("isrefused")){
                %>
                Відмовлено
                <%
                }else if(resultSet.getBoolean("isdelevered")){
                %>
                Доставлено
                <%
                }else if(resultSet.getBoolean("isdone")){
                %>
                Очікує доставки
                <%
                }else if((int)session.getAttribute("level")==4 || (int)session.getAttribute("level")==5){
                %>
                <div class="refusediv">
                    <form action="RefuseProductOrder">
                        <input type="submit" value="Відмовити" name="refuse<%=resultSet.getInt("oid")%>">
                    </form>
                    <br>
                </div>
                <%
                }else if((int)session.getAttribute("level")==2){
                %>
                <div class="dodiv">
                    <form action="DoProductOrder">
                        <input type="submit" value="Виготовлено" name="do<%=resultSet.getInt("oid")%>">
                    </form>
                    <br>
                </div>
                <%
                }
                %>
                <br>
            </div>
            <br><br>
            <%
                        }
                        resultSet.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
            %>
        </div>
    </body>
</html>
