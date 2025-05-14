<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<nav class="navbar navbar-expand-lg navbar-dark bg-info">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-medical"></i> MEDI HOME</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

                <c:if test="${empty userObj}">

                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="admin_login.jsp"><i class="fa-solid fa-right-to-bracket"></i> ADMIN</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="doctor_login.jsp">DOCTOR</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="user_appoinment.jsp">APPOINTMENT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="user_login.jsp">USER</a>
                    </li>
                    



                </c:if>


                <c:if test="${not empty userObj}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#"><i class="fa-solid fa-user"></i> ${userObj.fullName}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="user_appoinment.jsp">APPOINTMENT</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="view_appointment.jsp">VIEW APPOINTMENT</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="change_password.jsp">CHANGE PASSWORD</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="userLogut"><i class="fa-solid fa-right-from-bracket"></i>LOGOUT</a>
                    </li>
                    

                    <!-- <li class="nav-item dropdown">
                         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    ${userObj.fullName}
                </a>
               
            </li> 
             <div class="col-md-3">
                    <a href="#" class="btn btn-success">Change Password</a>

                </div>
                <div class="col-md-3">
                    <a href="#" class="btn btn-success"> Logout</a>

                </div>-->


                </c:if>


                <!--<li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Dropdown
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                  </ul>
                </li>-->



            </ul>
           <!-- <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="userLogut"><i class="fa-solid fa-right-from-bracket"></i>LOGOUT</a>
            </li>-->

        </div>
    </div>
</nav>