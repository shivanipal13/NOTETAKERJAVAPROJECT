<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entities.*"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <%@include file="all_js_css.jsp"%>
</head>
<body>
    <div class="container">
        <%@include file="Navbar.jsp"%>
        <br>
        <h2 class="mt-3">Search Results</h2>

        <div style="display: flex; flex-wrap: wrap;">
            <% 
                List resultList = (List) request.getAttribute("resultList");

                if (resultList.isEmpty()) {
            %>
                <p>No results found</p>
            <%
                } else {
                    for (Object obj : resultList) {
                        Note note = (Note) obj;
            %>
                        <div class="card mt-3">
                            <img class="card-img-top pl-4 pt-4 mx-auto" src="Image/notebook.png" alt="Card image cap">
                            <div class="card-body px-5">
                                <h5 class="card-title"><%=note.getTitle()%></h5>
                                <p class="card-text"><%=note.getContent()%></p>
                                <p><b class="text-primary text-center"><%= note.getAddedDate() %></b></p>
                                <div class="container text-center mt-2">
                                    <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
                                    <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
                                </div>
                            </div>
                        </div>
            <% 
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
