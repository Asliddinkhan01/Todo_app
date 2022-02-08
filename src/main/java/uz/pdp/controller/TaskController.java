package uz.pdp.controller;

import uz.pdp.dao.TaskDao;
import uz.pdp.model.Task;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

//Asliddin Kenjaev 2/4/2022 11:24 AM
@WebServlet("/tasks")
public class TaskController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        List<Task> allTask = TaskDao.getAllTask(email);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/jsp/view-tasks.jsp");

        req.setAttribute("taskList", allTask);
        req.setAttribute("userEmail", email);

        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        Cookie[] ck = req.getCookies();
        Cookie cookie1 = null;
        for (Cookie cookie : ck) {
            if (cookie.getName().equals("cookieName") && cookie.getValue().equals(email)) {
                cookie1 = cookie;
                break;
            }
        }
        if (cookie1 != null){
            List<Task> allTask = TaskDao.getAllTask(email);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/jsp/view-tasks.jsp");

            req.setAttribute("taskList", allTask);
            req.setAttribute("userEmail", email);

            requestDispatcher.forward(req, resp);
        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/notfound/notfound.html");
            requestDispatcher.forward(req,resp);
        }
    }
}
