package com.jobportal.servlet.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.util.*;

import com.jobportal.dao.JobDAO;

@WebServlet("/CompanyJobsServlet")
public class CompanyJobsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String company = request.getParameter("company");

        JobDAO jobDAO = new JobDAO();
        List<Map<String, String>> jobs = jobDAO.getJobsByCompany(company);

        request.setAttribute("jobs", jobs);
        request.setAttribute("company", company);

        RequestDispatcher rd = request.getRequestDispatcher("user/company-jobs.jsp");
        rd.forward(request, response);
    }
}
