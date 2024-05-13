package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.helper.FactoryProvider;

import com.entities.Note;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchTerm=request.getParameter("searchTerm");
		try
		{
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			
			String hql = "FROM Note e WHERE LOWER(e.title) LIKE :searchTerm";
			Query query = s.createQuery(hql);
			query.setParameter("searchTerm", "%" + searchTerm.toLowerCase() + "%");
			List<Note> resultList = query.list();
            // Set the result list as a request attribute
            request.setAttribute("resultList", resultList);

            // Forward to the JSP page to display results
            request.getRequestDispatcher("SearchResult.jsp").forward(request, response);
			tx.commit();
			s.close();
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
