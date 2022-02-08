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
import java.sql.SQLException;

//Asliddin Kenjaev 2/8/2022 8:47 PM

@WebServlet("/MakeUndoTask")
public class MakeUndoTask extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int taskId = Integer.parseInt(req.getParameter("id"));
        String userEmail = req.getParameter("userEmail");
        Connection connection = DbConnect.getConnection();
        PreparedStatement preparedStatement1;
        try {
            preparedStatement1 = connection.prepareStatement("update tasks set status = false where tasks.id = ?");
            preparedStatement1.setInt(1, taskId);
            preparedStatement1.execute();

            String path = "/tasks?email=" + userEmail;

            RequestDispatcher requestDispatcher = req.getRequestDispatcher(path);

            requestDispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
