<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%="Product"%></title>
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

<div  style="width: 50%; margin: 0 auto; padding: 20px; border: solid black 2px;">
    <div style="text-align: center">
        <a href=""><img src="" alt="image" style="width: 280px; height: 300px; border: solid black 1px"></a>
    </div>
    <br>
    <div style="float: left; width: 50%"><input type="text" id="name" value="<%="Name"%>"></div>
    <div style="float: left; width: 50%; text-align: right">Ціна : <input type="text" id="price" value="<%="20"%>" style="width: 50px"> грн.</div>
    <br><br>
    <div>
        <textarea rows="6" style="width: 100%;" placeholder="<%="Інформація про продукт"%>"></textarea>
    </div>
    <br>
    <div style="padding-left: 5%">
        Інгрідієнти :
        <table>
        <%
            for (int i = 0; i <9 ; i++) {
                %>
                <tr>
                    <td><%="Інгрідієнт"%></td>
                    <td><input type="number" id="ingredientCount" style="width: 50px"> <%="шт."%></td>
                </tr>
                <%
            }
        %>
        </table>
    </div>
    <br><br>
    <div style="float: left ; width: 70%">
        <input type="button" id="ok" value="OK">
        <input type="button" id="cancel" value="Cancel">
    </div>
    <div style="float: left; width: 30%; text-align: right">
        <form action="BackToManager">
        <input type="submit" name="back" value="Назад">
        </form>
    </div>
    <br>
</div>
</body>
</html>
