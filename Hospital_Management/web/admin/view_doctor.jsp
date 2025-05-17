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
<title>Doctor Details</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
    :root {
        --medical-blue: #1a6fbf;
        --doctor-green: #2a9d8f;
        --dark-teal: #264653;
        --light-gray: #f8f9fa;
    }

    .doctor-header {
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

    .doctor-card {
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

    .doctor-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
    }

    .doctor-table thead th {
        background-color: var(--light-gray);
        color: var(--dark-teal);
        font-weight: 600;
        padding: 12px 15px;
        position: sticky;
        top: 0;
        z-index: 10;
    }

    .doctor-table tbody tr {
        transition: all 0.2s ease;
    }

    .doctor-table tbody tr:hover {
        background-color: rgba(42,157,143,0.1);
    }

    .doctor-table td, .doctor-table th {
        padding: 12px 15px;
        border-bottom: 1px solid #e0e0e0;
        vertical-align: middle;
    }

    .action-btn {
        padding: 6px 12px;
        border-radius: 6px;
        font-size: 0.875rem;
        transition: all 0.3s;
    }

    .btn-edit {
        background-color: var(--medical-blue);
        border-color: var(--medical-blue);
    }

    .btn-edit:hover {
        background-color: #155a9e;
        transform: translateY(-2px);
    }

    .btn-delete {
        background-color: #dc3545;
        border-color: #dc3545;
    }

    .btn-delete:hover {
        background-color: #bb2d3b;
        transform: translateY(-2px);
    }

    .table-container {
        max-height: 70vh;
        overflow-y: auto;
    }

    @media (max-width: 768px) {
        .table-container {
            overflow-x: auto;
        }

        .doctor-table {
            font-size: 0.875rem;
        }

        .action-btn {
            padding: 4px 8px;
            font-size: 0.75rem;
        }
    }
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="doctor-header">
        <div class="text-center">
            <h1 class="display-4">Doctor Records</h1>
            <p class="lead">View and manage doctor information</p>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card doctor-card">
                    <div class="card-header">
                        <h3 class="mb-0">Doctor Details</h3>
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
                            <table class="doctor-table">
                                <thead>
                                    <tr>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Date of Birth</th>
                                        <th scope="col">Qualification</th>
                                        <th scope="col">Specialization</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Mobile No</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                    List<Doctor> list2 = dao2.getAllDoctor();
                                    for (Doctor d : list2) {
                                    %>
                                    <tr>
                                        <td><%=d.getFullName()%></td>
                                        <td><%=d.getDob()%></td>
                                        <td><%=d.getQualification()%></td>
                                        <td><%=d.getSpecialist()%></td>
                                        <td><%=d.getEmail()%></td>
                                        <td><%=d.getMobNo()%></td>
                                        <td>
                                            <div class="d-flex gap-2">
                                                <a href="edit_doctor.jsp?id=<%=d.getId()%>"
                                                   class="btn btn-sm btn-edit text-white">
                                                   <i class="fas fa-edit me-1"></i> Edit
                                                </a>
                                                <a href="../deleteDoctor?id=<%=d.getId()%>"
                                                   class="btn btn-sm btn-delete text-white"
                                                   onclick="return confirm('Are you sure you want to delete this doctor?')">
                                                   <i class="fas fa-trash-alt me-1"></i> Delete
                                                </a>
                                            </div>
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