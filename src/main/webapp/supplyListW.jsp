<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>List</title>
        <link rel="stylesheet" href="CSS/supplyListWStylesheet.css">
        <link rel="stylesheet" href="CSS/BODY.css">
        <link rel="stylesheet" href="CSS/EXIT.css">
    </head>
    <body>
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

        <div  class="maindiv">
            <div class="exitdiv">
                <form action="BackToWorker">
                    <input type="submit" value="Назад" id="back">
                </form>
            </div>
            <br>
            <%
                try {
                    ResultSet resultSet =
                            DatabaseManager.getGlobalSupplyList((Connection)session.getAttribute("connection"));
                    while(resultSet.next()){
            %>
            <div class="tablediv">
                Дата : <%=resultSet.getTimestamp("date")%>
                <table>
                    <thead>
                        <td class="ingredienttd">
                            Інгрідієнт
                        </td>
                        <td class="numbertd">
                          Кількість
                        </td>
                        <td class="pricetd">
                            Ціна
                        </td>
                    </thead>
            <%
                ResultSet resultSet2 = DatabaseManager
                        .getLocalSupplyList((Connection)session.getAttribute("connection"), resultSet.getInt("id"));
                while(resultSet2.next()){
            %>
                    <tr>
                        <td>
                            <%=resultSet2.getString("name")%>
                        </td>
                        <td>
                            <%=resultSet2.getDouble("count")%>
                            <%=resultSet2.getString("value")%>
                        </td>
                        <td>
                            <%=resultSet2.getDouble("count")*resultSet2.getDouble("price")%> грн.
                        </td>
                    </tr>
                <%
                }
                %>
                </table>
                <br>
            <div class="allpricediv">
                Загальна ціна :
                <%=resultSet.getDouble("allprice")%>
                грн.
            </div>
            <br>
            <%
            if(resultSet.getObject("isconfirmed")!=null){
                if(resultSet.getBoolean("isconfirmed")){
            %>
                    Підтверджено
                <%
                }else{
                %>
                 Відхилено
                <%
                 }
            }
                %>
            <br>
            </div>
            <br>
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
