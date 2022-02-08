package uz.pdp.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

import static uz.asliddin.util.MyUtil.*;

//Asliddin Kenjaev 2/7/2022 11:32 PM
@WebServlet("/Logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie ck=new Cookie("cookieName","");
        ck.setMaxAge(0);
        response.addCookie(ck);


        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/loginPage.jsp");
        dispatcher.forward(request,response);
    }
}
