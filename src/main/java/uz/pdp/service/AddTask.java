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

import static uz.asliddin.util.MyUtil.*;

//Asliddin Kenjaev 2/6/2022 12:43 PM
@WebServlet("/AddTask")
public class AddTask extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taskTitle = req.getParameter("taskTitle");
        String taskDescription = req.getParameter("taskDescription");
        String deadline = req.getParameter("deadline");
        String userEmail = req.getParameter("userEmail");
        Connection connection = DbConnect.getConnection();
        PreparedStatement preparedStatement;
        int userId = 0,max_task_id = 0;
        try {
            preparedStatement = connection.prepareStatement("select id from users where email = ?");
            preparedStatement.setString(1,userEmail);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                userId = resultSet.getInt(1);
            }
            PreparedStatement preparedStatement2 = connection.prepareStatement("select max(id) from tasks");
            ResultSet resultSet1 = preparedStatement2.executeQuery();
            if (resultSet1.next()) {
                max_task_id = resultSet1.getInt(1)+1;
            }
            PreparedStatement preparedStatement1 = connection.prepareStatement("insert into tasks(id,userid,title,description,deadline) values (?,?,?,?,?::date)");
            preparedStatement1.setInt(1, max_task_id);
            preparedStatement1.setInt(2, userId);
            preparedStatement1.setString(3, taskTitle);
            preparedStatement1.setString(4, taskDescription);
            preparedStatement1.setString(5, deadline);
            try {
                preparedStatement1.executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            String path = "/tasks?email="+userEmail;
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(path);

            requestDispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
