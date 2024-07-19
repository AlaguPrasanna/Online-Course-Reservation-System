<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark custom-navbar bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-user-graduate"></i> EduVista</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
      
          <li class="nav-item">
          <a class="nav-link active" href="viewCourse.jsp">Courses</a>
        </li>
        
         <li class="nav-item">
          <a class="nav-link active" href="#">Manage students</a>
        </li>
        
        <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
      <i class="fa-solid fa-circle-user fa-1x"></i>  ${teacherObj.fullname}
      </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
              <li><a class="dropdown-item" href="../teacherLogout">Logout</a></li>
    			<li><hr class="dropdown-divider"></li>
  				  <li><a class="dropdown-item" href="#">Help</a></li>
    
  			</ul>
			</div>
       
       
       
        
       
      </ul>
      
    </div>
  </div>
</nav>
