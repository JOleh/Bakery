<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=session.getAttribute("nameP")%></title>
    <link rel="stylesheet" href="CSS/startPageForCourier.css">
</head>
<body>

<%
    if(session.getAttribute("level")==null) response.sendRedirect("index.jsp");
    switch((int)session.getAttribute("level")){
        case 1: response.sendRedirect("productList.jsp");break;
        case 2: response.sendRedirect("resourcesStartPageForWorker.jsp");break;
        case 3: break;
        case 4: response.sendRedirect("productListStartPageForManager.jsp");break;
        case 5: response.sendRedirect("workerListStartPageForAdmin");break;
        default: response.sendRedirect("index.jsp");
    }
%>

<div class="headerTitle"><%=session.getAttribute("nameP")%></div>
<div class="contactInfo">
    <div class="exit">
        <form action="ExitAdminAccount">
            <input type="submit" value="Вихід">
        </form>
    </div>
    <div class="info">
        Телефон : <br>
        <%=session.getAttribute("phoneP")%><br>
        Email : <br>
        <%=session.getAttribute("emailP")%>
    </div>
</div>
<div style="padding: 20px; border:solid black 2px; box-sizing: border-box; margin: 0 auto; float: left; width: 100%; border-top: hidden">
    <div style="width: 80%; text-align: center; margin: 0 auto;">
        <div style="float: left; width: 40%; text-align: left"><%=session.getAttribute("name")%> <%=session.getAttribute("surname")%></div>
        <div style="text-align: left; width: 30%; float: left">
            <form action="EnterFromCourier">
            <input type="submit" name="userRegime" value="Режим покупця">
            </form>
        </div>
        <form action="SubmitDeliveryByCourier">
        <div style="text-align: right; width: 30%; float: left">
            <input type="submit" name="confirmDelivery" value="Підтвердити">
        </div>
        <br>
   <table style="text-align: center">
       <thead>
            <td style="width: 20%;">ПІБ</td>
            <td style="width: 20%;">Номер телефону</td>
            <td style="width: 40%;">Адреса</td>
            <td style="width: 10%;">Отримати</td>
            <td style="width: 10%;">Виконано</td>
       </thead>
       <%
           try {
               ResultSet resultSet = DatabaseManager.getOrderProductionListForCourier((Connection)session.getAttribute("connection"));
               int i = 0;
               while(resultSet.next()){
               %>
                    <tr>
                        <td><%=resultSet.getString("uname")%> <%=resultSet.getString("usurname")%></td>
                        <td><%=resultSet.getString("phonenumber")%></td>
                        <td><%=resultSet.getString("address")%></td>
                        <%
                            if(resultSet.getBoolean("is_get")){
                                %>
                        <<input type="text" name="<%=resultSet.getInt("id")%>" hidden>
                        <td><input type="checkbox" name="ifordergotten<%=resultSet.getInt("id")%>" value="<%=resultSet.getBoolean("is_get")%>" disabled></td>
                        <td><input type="checkbox" name="iforderdelivered<%=resultSet.getInt("id")%>" value="<%=resultSet.getBoolean("is_delivered")%>"></td>
                                <%
                            }else{
                                %>
                        <td><input type="checkbox" name="ifordergotten<%=resultSet.getInt("id")%>" value="<%=resultSet.getBoolean("is_get")%>"></td>
                        <td><input type="checkbox" name="iforderdelivered<%=resultSet.getInt("id")%>" value="<%=resultSet.getBoolean("is_delivered")%>" disabled></td>
                                <%
                            }
                        %>
                    </tr>
                <%
                            i++;
                        }
                    } catch (Exception e) {
                    }
       %>

   </table>
        </form>
    </div>

</div>
</body>
</html>
