<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
    :root {
        --medical-blue: #1a6fbf;
        --doctor-green: #2a9d8f;
        --dark-teal: #264653;
        --light-gray: #f8f9fa;
    }

    .dashboard-header {
        background: linear-gradient(135deg, rgba(26,111,191,0.85) 0%, rgba(42,157,143,0.85) 100%),
                    url("../img/admin-banner.jpg");
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

    .stat-card {
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        border: none;
        overflow: hidden;
        transition: all 0.3s ease;
        border-top: 5px solid var(--medical-blue);
        margin-bottom: 20px;
    }

    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    }

    .stat-card-body {
        padding: 25px;
        text-align: center;
    }

    .stat-icon {
        font-size: 3rem;
        margin-bottom: 15px;
        color: var(--medical-blue);
    }

    .stat-number {
        font-size: 2rem;
        font-weight: 600;
        color: var(--dark-teal);
        margin: 10px 0;
    }

    .stat-label {
        font-size: 1.1rem;
        color: var(--dark-teal);
        font-weight: 500;
    }

    .specialist-card {
        cursor: pointer;
        background-color: rgba(42,157,143,0.1);
    }

    .specialist-card:hover {
        background-color: rgba(42,157,143,0.2);
    }

    .modal-header {
        background-color: var(--medical-blue);
        color: white;
    }

    .modal-title {
        font-weight: 600;
    }

    .alert-message {
        border-radius: 8px;
    }
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <c:if test="${ empty adminObj }">
        <c:redirect url="../admin_login.jsp"></c:redirect>
    </c:if>

    <div class="dashboard-header">
        <div class="text-center">
            <h1 class="display-4">Admin Dashboard</h1>
            <p class="lead">Hospital Management System Overview</p>
        </div>
    </div>

    <div class="container">
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

        <%
        DoctorDao dao = new DoctorDao(DBConnect.getConn());
        %>

        <div class="row">
            <!-- Doctors Card -->
            <div class="col-md-4">
                <div class="card stat-card">
                    <div class="stat-card-body">
                        <i class="fas fa-user-md stat-icon"></i>
                        <p class="stat-number"><%=dao.countDoctor()%></p>
                        <p class="stat-label">Doctors</p>
                    </div>
                </div>
            </div>

            <!-- Users Card -->
            <div class="col-md-4">
                <div class="card stat-card">
                    <div class="stat-card-body">
                        <i class="fas fa-user-circle stat-icon"></i>
                        <p class="stat-number"><%=dao.countUSer()%></p>
                        <p class="stat-label">Users</p>
                    </div>
                </div>
            </div>

            <!-- Appointments Card -->
            <div class="col-md-4">
                <div class="card stat-card">
                    <div class="stat-card-body">
                        <i class="far fa-calendar-check stat-icon"></i>
                        <p class="stat-number"><%=dao.countAppointment()%></p>
                        <p class="stat-label">Appointments</p>
                    </div>
                </div>
            </div>

            <!-- Specialists Card -->
            <div class="col-md-4">
                <div class="card stat-card specialist-card" data-bs-toggle="modal"
                    data-bs-target="#specialistModal">
                    <div class="stat-card-body">
                        <i class="fas fa-stethoscope stat-icon"></i>
                        <p class="stat-number"><%=dao.countSpecialist()%></p>
                        <p class="stat-label">Specialists</p>
                        <small class="text-muted">Click to add new specialist</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Specialist Modal -->
    <div class="modal fade" id="specialistModal" tabindex="-1"
        aria-labelledby="specialistModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="specialistModalLabel">
                        <i class="fas fa-plus-circle me-2"></i>Add New Specialist
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../addSpecialist" method="post">
                        <div class="mb-3">
                            <label class="form-label">Specialist Name</label>
                            <input type="text" name="specName" class="form-control"
                                placeholder="Enter specialist name" required>
                        </div>
                        <div class="d-grid gap-2 mt-4">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-2"></i>Add Specialist
                            </button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">
                        <i class="fas fa-times me-2"></i>Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>