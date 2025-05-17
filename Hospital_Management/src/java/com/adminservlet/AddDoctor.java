package com.admin.servlet;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/adddoctor")
public class AddDoctor extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String fullName = req.getParameter("fullname");
		String dob      = req.getParameter("dob");
		String qualification = req.getParameter("qualification");

		
		int specialist_id;
		try {
			specialist_id = Integer.parseInt(req.getParameter("spec"));
		} catch (NumberFormatException e) {
			req.getSession().setAttribute("errorMsg", "Please select a valid specialist.");
			resp.sendRedirect("admin/doctor.jsp");
			return;
		}

		String email = req.getParameter("email");
		String mobno = req.getParameter("mobno");
		String password = req.getParameter("password");

		Doctor d = new Doctor(fullName, dob, qualification,
				specialist_id, email, mobno, password);

		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		try {
			if (dao.registerDoctor(d)) {
				session.setAttribute("succMsg", "Doctor added successfully.");
			} else {
				session.setAttribute("errorMsg", "Something went wrong on the server.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMsg", "Server error: " + e.getMessage());
		}

		resp.sendRedirect("admin/doctor.jsp");
	}
}
