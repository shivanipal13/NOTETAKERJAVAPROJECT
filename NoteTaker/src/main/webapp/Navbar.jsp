<nav class="navbar navbar-expand-lg navbar-dark purple sticky-top">
  <a class="navbar-brand" href="index.jsp">Note Taker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item <% if(request.getRequestURI().endsWith("index.jsp")) { %>active<% } %>">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item <% if(request.getRequestURI().endsWith("add_notes.jsp")) { %>active<% } %>">
        <a class="nav-link" href="add_notes.jsp">Add Notes</a>
      </li>
      
      <li class="nav-item <% if(request.getRequestURI().endsWith("All_notes.jsp")) { %>active<% } %>">
        <a class="nav-link" href="All_notes.jsp">Show Notes</a>
      </li>
    </ul>
    <form action="SearchServlet" method="post" class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" required type="text" id="searchTerm" name="searchTerm" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
