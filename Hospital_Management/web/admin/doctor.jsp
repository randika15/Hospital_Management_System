<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Doctor</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
    :root {
        --medical-blue: #1a6fbf;
        --doctor-green: #2a9d8f;
        --dark-teal: #264653;
        --light-gray: #f8f9fa;
    }

    .doctor-form-header {
        background: linear-gradient(135deg, rgba(26,111,191,0.85) 0%, rgba(42,157,143,0.85) 100%),
                    url("../img/doctor-banner.jpg");
        height: 25vh;
        width: 100%;
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
        margin-bottom: 30px;
    }

    .doctor-form-card {
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        border: none;
        overflow: hidden;
        border-top: 5px solid var(--medical-blue);
    }

    .card-header {
        background-color: var(--medical-blue);
        color: white;
        font-weight: 600;
        padding: 20px;
        text-align: center;
    }

    .form-label {
        font-weight: 500;
        color: var(--dark-teal);
        margin-bottom: 8px;
        display: block; 
    }

    .form-control, .form-select {
        border-radius: 8px;
        padding: 12px 15px 12px 45px; 
        border: 2px solid #e0e0e0;
        transition: all 0.3s;
        margin-bottom: 20px;
        width: 100%; 
    }

    .form-control:focus, .form-select:focus {
        border-color: var(--medical-blue);
        box-shadow: 0 0 0 0.25rem rgba(26,111,191,0.25);
    }

    .btn-doctor {
        background-color: var(--medical-blue);
        border: none;
        padding: 12px 0;
        font-weight: 600;
        letter-spacing: 0.5px;
        transition: all 0.3s;
        width: 100%;
        text-transform: uppercase;
    }

    .btn-doctor:hover {
        background-color: var(--dark-teal);
        transform: translateY(-2px);
    }

    .input-container {
        position: relative;
        margin-bottom: 20px;
    }

    .input-icon {
        position: absolute;
        left: 15px;
        top: 40px; 
        color: var(--medical-blue);
        font-size: 1.1rem;
    }

    .alert-message {
        border-radius: 8px;
    }

    
    .date-input-container {
        margin-bottom: 20px;
    }
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="doctor-form-header">
        <div class="text-center">
            <h1 class="display-4">Add New Doctor</h1>
            <p class="lead">Register medical professionals to your system</p>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card doctor-form-card">
                    <div class="card-header">
                        <h3 class="mb-0">Doctor Registration Form</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger alert-message alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <div class="alert alert-success alert-message alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i>${succMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <form action="../adddoctor" method="post">
                            <!-- Full Name Field -->
                            <div class="input-container">
                                <label class="form-label">Full Name</label>
                                <i class="fas fa-user-md input-icon"></i>
                                <input type="text" required name="fullname" class="form-control" placeholder="Dr. John Smith">
                            </div>

                            <!-- Date of Birth Field (no icon) -->
                            <div class="date-input-container">
                                <label class="form-label">Date of Birth</label>
                                <input type="date" required name="dob" class="form-control">
                            </div>

                            <!-- Qualification Field -->
                            <div class="input-container">
                                <label class="form-label">Qualification</label>
                                <i class="fas fa-graduation-cap input-icon"></i>
                                <input required name="qualification" type="text" class="form-control" placeholder="MD, MBBS, etc.">
                            </div>

                            <!-- Specialization Field -->
                            <div class="input-container">
                                <label class="form-label">Specialization</label>
                                <i class="fas fa-stethoscope input-icon"></i>
                                <select name="spec" required class="form-select">
                                    <option value="" selected disabled>-- Select Specialization --</option>
                                    <%
                                    SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                                    List<Specialist> list = dao.getAllSpecialist();
                                    for (Specialist s : list) {
                                    %>
                                    <option value="<%= s.getId() %>"><%=s.getSpecialistName()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>

                            <!-- Email Field -->
                            <div class="input-container">
                                <label class="form-label">Email</label>
                                <i class="fas fa-envelope input-icon"></i>
                                <input type="email" required name="email" class="form-control" placeholder="doctor@example.com">
                            </div>

                            <!-- Mobile Number Field -->
                            <div class="input-container">
                                <label class="form-label">Mobile Number</label>
                                <i class="fas fa-phone input-icon"></i>
                                <input type="tel" required name="mobno" class="form-control" placeholder="+1 234 567 8900">
                            </div>

                            <!-- Password Field -->
                            <div class="input-container">
                                <label class="form-label">Password</label>
                                <i class="fas fa-lock input-icon"></i>
                                <input required name="password" type="password" class="form-control" placeholder="Create secure password">
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-doctor">
                                    <i class="fas fa-user-plus me-2"></i> Register Doctor
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
