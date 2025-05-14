package com.nsbm.controller;

import com.nsbm.dao.ParticipantDAO;
import com.nsbm.model.Participant;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ParticipantServlet", urlPatterns = {"/new", "/insert", "/list"})
public class ParticipantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ParticipantDAO participantDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        participantDAO = new ParticipantDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        System.out.println("Action: " + action); // Debug statement

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertParticipant(request, response);
                    break;
                case "/list":
                default:
                    listParticipants(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException("Database error occurred", ex);
        }
    }

    private void listParticipants(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        System.out.println("Listing participants..."); // Debug
        List<Participant> participantList = participantDAO.listParticipants();
        request.setAttribute("participantList", participantList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("participantList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Showing new form..."); // Debug
        RequestDispatcher dispatcher = request.getRequestDispatcher("eventForm.jsp");
        dispatcher.forward(request, response);
    }

    private void insertParticipant(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        System.out.println("Inserting participant..."); // Debug
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String event = request.getParameter("event");
        
        System.out.println("Received: " + name + ", " + email + ", " + event); // Debug
        
        Participant newParticipant = new Participant(name, email, event);
        participantDAO.insertParticipant(newParticipant);
        response.sendRedirect("list");
    }
}