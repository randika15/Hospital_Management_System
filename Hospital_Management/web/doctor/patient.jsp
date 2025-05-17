<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.entity.Doctor"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Management</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
    :root {
        --medical-blue: #1a6fbf;
        --doctor-green: #2a9d8f;
        --dark-teal: #264653;
        --light-gray: #f8f9fa;
    }

    .patient-dashboard-header {
        background: linear-gradient(135deg, rgba(26,111,191,0.85) 0%, rgba(42,157,143,0.85) 100%),
                    url("../img/patient-management-banner.jpg");
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

    .patient-management-card {
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

    .patient-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
    }

    .patient-table thead th {
        background-color: var(--light-gray);
        color: var(--dark-teal);
        font-weight: 600;
        padding: 12px 15px;
        position: sticky;
        top: 0;
        z-index: 10;
    }

    .patient-table tbody tr {
        transition: all 0.2s ease;
    }

    .patient-table tbody tr:hover {
        background-color: rgba(42,157,143,0.1);
    }

    .patient-table td, .patient-table th {
        padding: 12px 15px;
        border-bottom: 1px solid #e0e0e0;
        vertical-align: middle;
    }

    .status-pending {
        color: #ff9800;
        font-weight: 500;
    }

    .status-completed {
        color: #4caf50;
        font-weight: 500;
    }

    .btn-comment {
        background-color: var(--doctor-green);
        border: none;
        padding: 6px 12px;
        border-radius: 6px;
        font-size: 0.875rem;
        transition: all 0.3s;
    }

    .btn-comment:hover {
        background-color: #228e7f;
        transform: translateY(-2px);
    }

    .btn-comment:disabled {
        background-color: #cccccc;
        cursor: not-allowed;
    }

    .table-container {
        max-height: 70vh;
        overflow-y: auto;
    }

    @media (max-width: 768px) {
        .table-container {
            overflow-x: auto;
        }

        .patient-table {
            font-size: 0.875rem;
        }

        .btn-comment {
            padding: 4px 8px;
            font-size: 0.75rem;
        }
    }
</style>
</head>
<body>
    <c:if test="${empty doctObj }">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <%@include file="navbar.jsp"%>

    <div class="patient-dashboard-header">
        <div class="text-center">
            <h1 class="display-4">Patient Management</h1>
            <p class="lead">Review and manage your patient appointments</p>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card patient-management-card">
                    <div class="card-header">
                        <h3 class="mb-0">Patient Appointments</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i>${succMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <div class="table-container">
                            <table class="patient-table">
                                <thead>
                                    <tr>
                                        <th scope="col">Patient Name</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Age</th>
                                        <th scope="col">Appointment Date</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Condition</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    Doctor d = (Doctor) session.getAttribute("doctObj");
                                    AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                                    List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
                                    for (Appointment ap : list) {
                                        String statusClass = "status-" + ap.getStatus().toLowerCase();
                                    %>
                                    <tr>
                                        <td><%=ap.getFullName()%></td>
                                        <td><%=ap.getGender()%></td>
                                        <td><%=ap.getAge()%></td>
                                        <td><%=ap.getAppoinDate()%></td>
                                        <td><%=ap.getEmail()%></td>
                                        <td><%=ap.getPhNo()%></td>
                                        <td><%=ap.getDiseases()%></td>
                                        <td class="<%=statusClass%>"><%=ap.getStatus()%></td>
                                        <td>
                                            <%
                                            if ("Pending".equals(ap.getStatus())) {
                                            %>
                                            <a href="comment.jsp?id=<%=ap.getId()%>"
                                               class="btn btn-comment text-white">
                                               <i class="fas fa-comment-medical me-1"></i> Comment
                                            </a>
                                            <%
                                            } else {
                                            %>
                                            <button class="btn btn-comment" disabled>
                                                <i class="fas fa-comment-medical me-1"></i> Commented
                                            </button>
                                            <%
                                            }
                                            %>
                                        </td>
                                    </tr>
                                    <%
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>