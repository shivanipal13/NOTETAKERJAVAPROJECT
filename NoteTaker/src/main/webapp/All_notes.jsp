
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<title>All Notes:Note Taker</title>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.6.5/axios.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.6.5/axios.min.js"></script>
<%@include file="all_js_css.jsp"%>


  <script src="deleteandupdate.js"></script>
</head>
<body>
	<div class="container">

		<%@include file="Navbar.jsp"%>
		<br>
		<h2>All Notes:</h2>


		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note note : list) {
				%>



				<div class="card mt-3">
					<img class="card-img-top pl-4 pt-4 mx-auto" style="max-width: 100px"
						src="Image/notebook.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<P><b class="text-primary text-center"><%= note.getAddedDate() %></b></P>
						<div class="container text-center mt-2">
						<%-- <a href="#" class="btn btn-danger" onclick="deleteNoteConfirmation(<%= note.getId() %>); return false;">Delete</a> --%>
						<button class="btn btn-danger" onclick="deleteNoteConfirmation(<%= note.getId() %>); return false;">Delete</button>
						
						<%-- <a href="#" class="btn btn-danger" onclick="deleteNoteConfirmation(<%= note.getId() %>)">Delete</a> --%>
						<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary" onclick="updateNoteConfirmation(<%= note.getId() %>)">Update</a>
							<%-- <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger" style="max-width: 50px max-height: 30px;">Delete</a>  --%>
							<%-- <a href="edit.jsp?note_id=<%= note.getId() %>"class="btn btn-primary" style="max-width: 50px max-height: 30px;">Update</a> --%>
						</div>

					</div>
				</div>



				<%
				}

				s.close();
				%>
			</div>
		</div>

	</div>





</body>
</html>