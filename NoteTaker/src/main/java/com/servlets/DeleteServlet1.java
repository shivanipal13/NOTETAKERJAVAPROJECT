package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


/**
 * Servlet implementation class DeleteServlet1
 */
public class DeleteServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet1() {
        super();
        // TODO Auto-generated constructor stub
        
        
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        int noteId = Integer.parseInt(request.getParameter("note_id").trim());

	        Session s = FactoryProvider.getFactory().openSession();
	        Transaction tx = s.beginTransaction();
	        Note note = (Note) s.get(Note.class, noteId);
	        s.delete(note);
	        tx.commit();
	        s.close();

	        // Send success message as response
	        response.setStatus(HttpServletResponse.SC_OK);
	        response.getWriter().write("Note deleted successfully");
	    } catch (Exception e) {
	        e.printStackTrace(); // stack trace for debugging
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while deleting the note");
	    }
	}


}