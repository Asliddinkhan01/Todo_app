package uz.pdp.service;

import uz.pdp.util.DbConnect;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//Asliddin Kenjaev 2/5/2022 9:53 PM
@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Connection connection = DbConnect.getConnection();
        PreparedStatement preparedStatement;

        try {
            preparedStatement = connection.prepareStatement("select password from users where email = ?");
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String dbPassword = resultSet.getString(1);
                RequestDispatcher requestDispatcher;
                if (dbPassword.equals(password)) {
                    Cookie ck = new Cookie("cookieName",email);
                    ck.setMaxAge(60*60);
                    resp.addCookie(ck);

                    requestDispatcher = req.getRequestDispatcher("/tasks");
                    req.setAttribute("email", email);
                } else {
                    requestDispatcher = req.getRequestDispatcher("/jsp/loginPage.jsp");
                    String messageSignIn = "Incorrect password !!";
                    req.setAttribute("messageSignIn", messageSignIn);
                }
                requestDispatcher.forward(req, resp);
            } else {
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/jsp/loginPage.jsp");
                String messageSignIn = "Incorrect email !!";
                req.setAttribute("messageSignIn", messageSignIn);
                requestDispatcher.forward(req, resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
