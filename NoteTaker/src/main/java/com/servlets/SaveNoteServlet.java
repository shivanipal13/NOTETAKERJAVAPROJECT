package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;



/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNoteServlet() {
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
		try 
		{
			//fetch input data title content
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			  // Create an instance of the Note class using the parameterized constructor
			Note note=new Note(title,content,new Date(System.currentTimeMillis()));
			//System.out.println(note.getId()+":"+ note.getTitle());
			//save data to database using Hibernate calling session factory
			
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			s.save(note);
			tx.commit();
			
			s.close();
			//response.setContentType("text/html");
			//PrintWriter out=response.getWriter();
			//out.println("<ht>Note is added successfully</h1>");
			request.setAttribute("successMessage", "Note added successfully");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/add_notes.jsp");
			dispatcher.forward(request, response);

			
			
		

		}
		catch(Exception e){
			e.printStackTrace();
			
		}
	}

}
