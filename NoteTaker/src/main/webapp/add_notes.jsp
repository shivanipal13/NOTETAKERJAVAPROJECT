<% String successMessage = (String)request.getAttribute("successMessage"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
 <div class="container">
  <%@include file="Navbar.jsp" %>
 
  <br>
  <h1>Please fill your note detail</h1>
  <br>
  <%-- Display success message if it exists --%>
    <% if (successMessage != null && !successMessage.isEmpty()) { %>
        <div  class="container text-center"style="color: green;">
            <%= successMessage %>
        </div>
    <% } %>
  
  
  
  
  <!-- This is add form -->
  <form action="SaveNoteServlet" method="post">
  <div class="form-group">
    <label for="title">Note Title</label>
    <input name="title" required type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter your note title here">
    
  </div>
  <div class="form-group">
    <label for="Content">Note Content</label>
    <textarea  name="content" required id="content" placeholder="Enter your content here" class="form-control" style="height:300px;"></textarea>
    
  </div>
  
  <div class="container text-center">
  <button type="submit" class="btn btn-primary">Add</button>
  </div>
</form>

 </div>

</body>
</html>