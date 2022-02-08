package uz.pdp.service;

import uz.pdp.model.Task;
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
import java.util.ArrayList;
import java.util.List;

//Asliddin Kenjaev 2/8/2022 9:18 PM
@WebServlet("/OrderBy")
public class OrderBy extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sortType = req.getParameter("type");
        String userEmail = req.getParameter("userEmail");

        Connection connection = DbConnect.getConnection();
        PreparedStatement preparedStatement;

        List<Task> taskList = new ArrayList<>();
        try {
            String sqlQuery;
            if (sortType.equals("statusDone")) {
                sqlQuery = "select t.id, t.userid, t.title, t.description, t.status, t.deadline, t.createdat, t.updatedat from tasks t join users u on u.id = t.userid where u.email = ? and t.status = true";
            } else if (sortType.equals("statusInProgress")) {
                sqlQuery = "select t.id, t.userid, t.title, t.description, t.status, t.deadline, t.createdat, t.updatedat from tasks t join users u on u.id = t.userid where u.email = ? and t.status = false";
            } else {
                sqlQuery = "select t.id, t.userid, t.title, t.description, t.status, t.deadline, t.createdat, t.updatedat from tasks t join users u on u.id = t.userid where u.email = ? order by status, deadline";
            }
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, userEmail);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                taskList.add(
                        new Task(
                                resultSet.getInt(1),
                                resultSet.getInt(2),
                                resultSet.getString(3),
                                resultSet.getString(4),
                                resultSet.getBoolean(5),
                                resultSet.getTimestamp(6).toLocalDateTime(),
                                resultSet.getTimestamp(7).toLocalDateTime(),
                                resultSet.getTimestamp(8).toLocalDateTime()
                        )
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/jsp/view-tasks.jsp");

        req.setAttribute("taskList", taskList);
        req.setAttribute("userEmail", userEmail);

        requestDispatcher.forward(req, resp);
    }
}
