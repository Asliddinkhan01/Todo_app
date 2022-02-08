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

//Asliddin Kenjaev 2/6/2022 9:48 PM
@WebServlet("/EditTask2")
public class EditTask2 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userEmail = req.getParameter("userEmail");
        int taskId = Integer.parseInt(req.getParameter("taskId"));
        String taskTitle = req.getParameter("taskTitle");
        String taskDescription = req.getParameter("taskDescription");
        String taskDeadline = req.getParameter("taskDeadline");
        Connection connection = DbConnect.getConnection();
        PreparedStatement preparedStatement1;
        try {
            preparedStatement1 = connection.prepareStatement("update tasks set title = ?, description = ?, deadline = ?::date, updatedat = now() where id = ?");
            preparedStatement1.setString(1, taskTitle);
            preparedStatement1.setString(2, taskDescription);
            preparedStatement1.setString(3, taskDeadline);
            preparedStatement1.setInt(4, taskId);
            try {
                preparedStatement1.executeQuery();
            } catch (SQLException e){
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
