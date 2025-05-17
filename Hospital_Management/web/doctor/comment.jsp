<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Consultation</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
    :root {
        --medical-blue: #1a6fbf;
        --doctor-green: #2a9d8f;
        --dark-teal: #264653;
        --light-gray: #f8f9fa;
    }

    .consultation-header {
        background: linear-gradient(135deg, rgba(26,111,191,0.85) 0%, rgba(42,157,143,0.85) 100%),
                    url("../img/consultation-banner.jpg");
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

    .consultation-card {
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

    .patient-info-card {
        background-color: rgba(42,157,143,0.05);
        border-left: 4px solid var(--medical-blue);
        padding: 15px;
        border-radius: 0 8px 8px 0;
        margin-bottom: 20px;
    }

    .info-label {
        font-weight: 500;
        color: var(--dark-teal);
        margin-bottom: 5px;
    }

    .info-value {
        font-size: 1rem;
        color: var(--dark-teal);
        margin-bottom: 15px;
    }

    .form-label {
        font-weight: 500;
        color: var(--dark-teal);
        margin-bottom: 8px;
    }

    .form-control {
        border-radius: 8px;
        padding: 12px 15px;
        border: 2px solid #e0e0e0;
        transition: all 0.3s;
    }

    .form-control:focus {
        border-color: var(--medical-blue);
        box-shadow: 0 0 0 0.25rem rgba(26,111,191,0.25);
    }

    textarea.form-control {
        min-height: 150px;
    }

    .btn-submit {
        background-color: var(--medical-blue);
        border: none;
        padding: 12px 0;
        font-weight: 600;
        letter-spacing: 0.5px;
        transition: all 0.3s;
        width: 100%;
        text-transform: uppercase;
    }

    .btn-submit:hover {
        background-color: var(--dark-teal);
        transform: translateY(-2px);
    }

    @media (max-width: 768px) {
        .consultation-header {
            height: 20vh;
        }
    }
</style>
</head>
<body>
    <c:if test="${empty doctObj }">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <%@include file="navbar.jsp"%>

    <div class="consultation-header">
        <div class="text-center">
            <h1 class="display-4">Patient Consultation</h1>
            <p class="lead">Record your medical assessment and recommendations</p>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card consultation-card">
                    <div class="card-header">
                        <h3 class="mb-0">Patient Assessment</h3>
                    </div>
                    <div class="card-body">
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                        Appointment ap = dao.getAppointmentById(id);
                        %>

                        <div class="patient-info-card">
                            <div class="row">
                                <div class="col-md-6">
                                    <p class="info-label">Patient Name</p>
                                    <p class="info-value"><%=ap.getFullName()%></p>
                                </div>
                                <div class="col-md-6">
                                    <p class="info-label">Age</p>
                                    <p class="info-value"><%=ap.getAge()%></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p class="info-label">Contact Number</p>
                                    <p class="info-value"><%=ap.getPhNo()%></p>
                                </div>
                                <div class="col-md-6">
                                    <p class="info-label">Presenting Condition</p>
                                    <p class="info-value"><%=ap.getDiseases()%></p>
                                </div>
                            </div>
                        </div>

                        <form action="../updateStatus" method="post">
                            <div class="mb-4">
                                <label class="form-label">Medical Assessment</label>
                                <textarea required name="comm" class="form-control"
                                    placeholder="Enter your clinical findings, diagnosis, treatment plan, and any recommendations..."
                                    rows="5"></textarea>
                            </div>

                            <input type="hidden" name="id" value="<%=ap.getId()%>">
                            <input type="hidden" name="did" value="<%=ap.getDoctorId()%>">

                            <div class="d-grid gap-2 col-md-6 mx-auto">
                                <button type="submit" class="btn btn-submit">
                                    <i class="fas fa-file-medical-alt me-2"></i> Submit Assessment
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