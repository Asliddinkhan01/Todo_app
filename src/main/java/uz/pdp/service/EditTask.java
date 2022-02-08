package uz.pdp.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import static uz.asliddin.util.MyUtil.*;

//Asliddin Kenjaev 2/6/2022 7:14 PM
@WebServlet("/EditTask")
public class EditTask extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taskId = req.getParameter("id");
        String taskTitle = req.getParameter("title");
        String taskDescription = req.getParameter("description");
        String userEmail = req.getParameter("userEmail");
        String deadline = req.getParameter("deadline");

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/jsp/editTask.jsp");


        req.setAttribute("taskId", taskId);
        req.setAttribute("taskTitle", taskTitle);
        req.setAttribute("taskDescription", taskDescription);
        req.setAttribute("userEmail", userEmail);
        req.setAttribute("deadline",deadline);

        requestDispatcher.forward(req, resp);
    }
}
