<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 0:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=session.getAttribute("nameP")%></title>
    <link rel="stylesheet" href="CSS/productListStylesheet.css">
</head>
<body>

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

<div class="headerTitle"><%=session.getAttribute("nameP")%></div>
<div class="contactInfo">
    <div class="exit">
        <form action="ExitConsumerAccount">
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
<div class="products">
    <table>
            <%
            int temporary = 0;
          for (int i = 0; i < 9 ; i++) {
              if(i-temporary==3){
                    %>
        </tr> <%
        }
        if(i%3==0){
            temporary = i;
    %>
        <tr>
            <%
                }
            %>
            <td style="box-sizing: border-box; padding: 10px; text-align: center">
                <div class="name">
                <%="Name"%><br>
                </div >
                <a href="singleProductForConsumer.jsp"><img src="<% %>" alt="image" style="width: 280px; height: 300px; border: solid black 1px"></a>
                <br><br>
                <div class="plusminus">
                    <input type="button" value="+" id="plus">
                    <input type="number" id="number" min="0" max="10000" style="width: 40px">
                    <input type="button" value="-" id="minus">
                </div>
                <div class="price">
                    <%="25"%>грн.
                </div>
            </td>
            <%
                }
            %></tr>
    </table>
</div>
<div class="navigation">
    <%=session.getAttribute("name")%> <%=session.getAttribute("surname")%><br><br>
    <form action="EnterFromConsumer">
        <input type="submit" value="Корзина" name="basket" style="width: 80%; text-align: center"><br>
        <input type="submit" value="Історія замовлень" name="history" style="width: 80%; text-align: center">
    </form>
</div>
</body>
</html>
