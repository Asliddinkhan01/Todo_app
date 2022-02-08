package uz.pdp.dao;

import uz.pdp.model.Task;
import uz.pdp.util.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//Asliddin Kenjaev 2/4/2022 11:25 AM

public class TaskDao {

    public static List<Task> getAllTask(String userEmail) {
        Connection connection = DbConnect.getConnection();
        PreparedStatement preparedStatement;

        List<Task> taskList = new ArrayList<>();
        try {
            String sqlQuery = "select t.id, t.userid, t.title, t.description, t.status, t.deadline, t.createdat, t.updatedat from tasks t join users u on u.id = t.userid where u.email = ? order by deadline";
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
        return taskList;
    }
}
