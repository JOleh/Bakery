package Accounts;

import Database.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(value = "/Registration")
public class Registration extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("in post");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("IN REGISTRATION get");
        boolean f = false;
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("checkPassword");

        String m_email = " ";
        String m_phone = " ";
        String m_pass = " ";

        System.out.println(name+"\n"+surname+"\n"+email+"\n"+phonenumber+"\n"+password+"\n"+cpassword);

        if(Database.DatabaseManager.isEmailUsed((Connection)request.getSession().getAttribute("connection"), email)){
            f = true;
            m_email = "Дана електронна пошта вже використовується";
            System.out.println("check email");
        }
        if(Database.DatabaseManager.isPhoneUsed((Connection)request.getSession().getAttribute("connection"), phonenumber)){
            f = true;
            m_phone = "Даний номер вже використовується";
            System.out.println("check phone");
        }
        if(!password.equals(cpassword)){
            f = true;
            m_pass = "Паролі відмінні один від одного";
            System.out.println("check pass");
        }

        if(f){
            System.out.println("in f start");
            request.setAttribute("m_email", m_email);
            request.setAttribute("m_phone", m_phone);
            request.setAttribute("m_pass", m_pass);
            response.sendRedirect("registrationPage.jsp");
            System.out.println("in f end");
        }
        else{
            System.out.println("in !f start");
            DatabaseManager.registrateUser((Connection)request.getSession().getAttribute("connection"), name, surname, phonenumber, email, password, 1);
            response.sendRedirect("index.jsp");
            System.out.println("in !f end");
        }

        System.out.println("In reg end");
    }
}
