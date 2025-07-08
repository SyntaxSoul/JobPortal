package com.jobportal.servlet.user;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.jobportal.dao.ApplicationDAO;

public class MyApplicationsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        ApplicationDAO dao = new ApplicationDAO();
        List<Map<String, String>> applications = dao.getApplicationsByEmail(email);

        request.setAttribute("applications", applications);
        RequestDispatcher rd = request.getRequestDispatcher("user/my-applications.jsp");
        rd.forward(request, response);
    }
}
