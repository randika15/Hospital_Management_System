<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
    :root {
        --medical-blue: #1a6fbf;
        --doctor-green: #2a9d8f;
        --dark-teal: #264653;
        --light-gray: #f8f9fa;
    }

    .doctor-dashboard-header {
        background: linear-gradient(135deg, rgba(26,111,191,0.85) 0%, rgba(42,157,143,0.85) 100%),
                    url("../img/doctor-dashboard-banner.jpg");
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

    .stats-card {
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        border: none;
        overflow: hidden;
        transition: all 0.3s ease;
        border-top: 5px solid var(--medical-blue);
        margin-bottom: 20px;
    }

    .stats-card:hover {
        transform: translateY(-5px);
    }

    .stats-card-body {
        padding: 30px;
        text-align: center;
    }

    .stats-icon {
        font-size: 3rem;
        margin-bottom: 15px;
        color: var(--medical-blue);
    }

    .stats-number {
        font-size: 2rem;
        font-weight: 600;
        color: var(--dark-teal);
        margin: 10px 0;
    }

    .stats-label {
        font-size: 1.1rem;
        color: var(--dark-teal);
        font-weight: 500;
    }

    .welcome-message {
        text-align: center;
        margin-bottom: 30px;
    }

    .welcome-text {
        font-size: 1.5rem;
        color: var(--dark-teal);
    }

    .doctor-name {
        color: var(--medical-blue);
        font-weight: 600;
    }

    @media (max-width: 768px) {
        .doctor-dashboard-header {
            height: 20vh;
        }

        .welcome-text {
            font-size: 1.2rem;
        }
    }
</style>
</head>
<body>
    <c:if test="${empty doctObj }">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <%@include file="navbar.jsp"%>

    <div class="doctor-dashboard-header">
        <div class="text-center">
            <h1 class="display-4">Doctor Dashboard</h1>
            <p class="lead">Medical practice overview and statistics</p>
        </div>
    </div>

    <div class="container">
        <div class="welcome-message">
            <p class="welcome-text">Welcome back, <span class="doctor-name">${doctObj.fullName}</span></p>
        </div>

        <%
        Doctor d = (Doctor) session.getAttribute("doctObj");
        DoctorDao dao = new DoctorDao(DBConnect.getConn());
        %>

        <div class="row justify-content-center">
            
            <div class="col-md-5">
                <div class="card stats-card">
                    <div class="stats-card-body">
                        <i class="fas fa-user-md stats-icon"></i>
                        <p class="stats-number"><%=dao.countDoctor()%></p>
                        <p class="stats-label">Colleague Doctors</p>
                    </div>
                </div>
            </div>

            
            <div class="col-md-5">
                <div class="card stats-card">
                    <div class="stats-card-body">
                        <i class="fas fa-calendar-check stats-icon"></i>
                        <p class="stats-number"><%=dao.countAppointmentByDocotrId(d.getId())%></p>
                        <p class="stats-label">Your Appointments</p>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="row justify-content-center mt-4">
            <div class="col-md-10">
                <div class="card stats-card">
                    <div class="stats-card-body">
                        <h4 class="text-center mb-4">Quick Actions</h4>
                        <div class="d-flex justify-content-center gap-4">
                            <a href="patient.jsp" class="btn btn-primary">
                                <i class="fas fa-user-injured me-2"></i> View Patients
                            </a>
                            <a href="edit_profile.jsp" class="btn btn-success">
                                <i class="fas fa-user-edit me-2"></i> Edit Profile
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
