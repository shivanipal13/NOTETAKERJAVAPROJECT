<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Notes</title>
<%@include file="all_js_css.jsp"%>

<script type="text/javascript">
    function showSuccessMessage() {
        alert("Note updated successfully!");
    }
</script>

</head>
<body>
	<div class="container">
		<%@include file="Navbar.jsp"%>
		<br>
		<h2>Edit your Notes</h2>
		<br>
	
		<%
		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
		
		Session s=FactoryProvider.getFactory().openSession();
		Note note=(Note)s.get(Note.class,noteId);
		
		s.close();
		
		%>
		<!-- This is Edit form -->
  <form action="UpdateServlet" method="post">
  <!-- id which is going to update  -->
  <input value="<%= note.getId() %>" name="noteId" type="hidden"/>
  <div class="form-group">
    <label for="title">Note Title</label>
    <input name="title" required type="text" class="form-control" id="title"  placeholder="Enter your note title here" value="<%= note.getTitle() %>">
    
  </div>
  <div class="form-group">
    <label for="Content">Note Content</label>
    
    <textarea name="content" required id="content" placeholder="Enter your content here" class="form-control" style="height:300px;"><%= note.getContent() %></textarea>
    
    
  </div>
  
  <div class="container text-center">
  <button type="submit"  onclick="showSuccessMessage()" class="btn btn-success">Save your note</button>
  </div>
</form>
		
		
		
		
		
	</div>

</body>
</html>