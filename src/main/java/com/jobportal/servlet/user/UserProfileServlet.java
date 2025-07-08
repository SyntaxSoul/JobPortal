package com.jobportal.servlet.user;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.jobportal.dao.UserProfileDAO;

public class UserProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int loginId = (Integer) session.getAttribute("login_id");

        UserProfileDAO dao = new UserProfileDAO();
        Map<String, String> profile = dao.getProfileByLoginId(loginId);

        request.setAttribute("profile", profile);
        RequestDispatcher rd = request.getRequestDispatcher("user/my-profile.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int loginId = (Integer) session.getAttribute("login_id");

        String fullName = request.getParameter("full_name");
        String phone = request.getParameter("phone");
        String city = request.getParameter("city");
        String education = request.getParameter("education");

        UserProfileDAO dao = new UserProfileDAO();
        boolean success = dao.updateOrInsertProfile(loginId, fullName, phone, city, education);

        if (success) {
            response.sendRedirect("MyProfile?status=updated");
        } else {
            response.getWriter().println("Something went wrong while saving your profile.");
        }
    }
}
