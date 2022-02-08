package uz.pdp.service;

import uz.pdp.util.DbConnect;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//Asliddin Kenjaev 2/5/2022 5:33 PM
@WebServlet("/SaveUser")
public class SaveUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int las_max_id = 0;
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPass = req.getParameter("confirmPass");

        if (password.equals(confirmPass)) {
            Connection connection = DbConnect.getConnection();
            PreparedStatement preparedStatement;
            try {
                preparedStatement = connection.prepareStatement("select max(id) from users");
                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    las_max_id = resultSet.getInt(1) + 1;
                }
                PreparedStatement preparedStatement1 = connection.prepareStatement("insert into users(id,fullname,email,password) values (?,?,?,?)");
                preparedStatement1.setInt(1, las_max_id);
                preparedStatement1.setString(2, name);
                preparedStatement1.setString(3, email);
                preparedStatement1.setString(4, password);
                try {
                    preparedStatement1.executeQuery();
                } catch (SQLException e){
                    e.printStackTrace();
                }

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/jsp/loginPage.jsp");

                String message = "Registered successfully !";

                req.setAttribute("message", message);

                requestDispatcher.forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/jsp/loginPage.jsp");

            String message = "Confirm password must match with password !";

            req.setAttribute("message", message);

            requestDispatcher.forward(req, resp);
        }
    }
}
