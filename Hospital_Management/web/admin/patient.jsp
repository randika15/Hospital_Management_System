<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Details</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
    :root {
        --medical-blue: #1a6fbf;
        --doctor-green: #2a9d8f;
        --dark-teal: #264653;
        --light-gray: #f8f9fa;
    }

    .patient-header {
        background: linear-gradient(135deg, rgba(26,111,191,0.85) 0%, rgba(42,157,143,0.85) 100%),
                    url("../img/patient-banner.jpg");
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

    .patient-card {
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

    .status-cancelled {
        color: #f44336;
        font-weight: 500;
    }

    .table-container {
        max-height: 70vh;
        overflow-y: auto;
    }

    @media (max-width: 768px) {
        .table-container {
            overflow-x: auto;
        }
    }
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="patient-header">
        <div class="text-center">
            <h1 class="display-4">Patient Records</h1>
            <p class="lead">View and manage patient appointment details</p>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card patient-card">
                    <div class="card-header">
                        <h3 class="mb-0">Patient Appointment Details</h3>
                    </div>
                    <div class="card-body">
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
                                        <th scope="col">Doctor</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                                    DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                    List<Appointment> list = dao.getAllAppointment();
                                    for (Appointment ap : list) {
                                        Doctor d = dao2.getDoctorById(ap.getDoctorId());
                                        String statusClass = "";
                                        if("Pending".equals(ap.getStatus())) {
                                            statusClass = "status-pending";
                                        } else if("Completed".equals(ap.getStatus())) {
                                            statusClass = "status-completed";
                                        } else if("Cancelled".equals(ap.getStatus())) {
                                            statusClass = "status-cancelled";
                                        }
                                    %>
                                    <tr>
                                        <td><%=ap.getFullName()%></td>
                                        <td><%=ap.getGender()%></td>
                                        <td><%=ap.getAge()%></td>
                                        <td><%=ap.getAppoinDate()%></td>
                                        <td><%=ap.getEmail()%></td>
                                        <td><%=ap.getPhNo()%></td>
                                        <td><%=ap.getDiseases()%></td>
                                        <td><%=d.getFullName()%></td>
                                        <td><%=ap.getAddress()%></td>
                                        <td class="<%=statusClass%>"><%=ap.getStatus()%></td>
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