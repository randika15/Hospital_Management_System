<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Your Appointment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
    :root {
        --primary-color: #2a9d8f;
        --secondary-color: #264653;
        --accent-color: #e9c46a;
        --light-color: #f8f9fa;
        --dark-color: #343a40;
    }

    .appointment-header {
        background: linear-gradient(135deg, rgba(42,157,143,0.9) 0%, rgba(38,70,83,0.9) 100%),
                    url("img/medical-banner.jpg");
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

    .appointment-card {
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        border: none;
        overflow: hidden;
        transition: transform 0.3s ease;
    }

    .appointment-card:hover {
        transform: translateY(-5px);
    }

    .card-header {
        background-color: var(--primary-color);
        color: white;
        font-weight: 600;
        padding: 15px 20px;
    }

    .form-label {
        font-weight: 500;
        color: var(--secondary-color);
    }

    .form-control, .form-select {
        border-radius: 8px;
        padding: 10px 15px;
        border: 2px solid #e0e0e0;
        transition: all 0.3s;
    }

    .form-control:focus, .form-select:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 0.25rem rgba(42,157,143,0.25);
    }

    .btn-appointment {
        background-color: var(--primary-color);
        border: none;
        padding: 12px 0;
        font-weight: 600;
        letter-spacing: 0.5px;
        transition: all 0.3s;
    }

    .btn-appointment:hover {
        background-color: var(--secondary-color);
        transform: translateY(-2px);
    }

    .illustration-img {
        max-width: 100%;
        height: auto;
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    .info-box {
        background-color: #f8f9fa;
        border-left: 4px solid var(--primary-color);
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 0 8px 8px 0;
    }

    .step-indicator {
        display: flex;
        justify-content: space-between;
        margin-bottom: 30px;
    }

    .step {
        text-align: center;
        position: relative;
        flex: 1;
    }

    .step-number {
        width: 40px;
        height: 40px;
        background-color: #e0e0e0;
        color: var(--dark-color);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 10px;
        font-weight: bold;
    }

    .step.active .step-number {
        background-color: var(--primary-color);
        color: white;
    }

    .step-title {
        font-size: 14px;
        color: var(--dark-color);
    }

    .step:not(:last-child)::after {
        content: '';
        position: absolute;
        top: 20px;
        left: 60%;
        width: 80%;
        height: 2px;
        background-color: #e0e0e0;
    }

    .step.active:not(:last-child)::after {
        background-color: var(--primary-color);
    }
</style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>

    <div class="appointment-header">
        <div class="text-center">
            <h1 class="display-4">Book Your Appointment</h1>
            <p class="lead">Schedule your visit with our expert doctors</p>
        </div>
    </div>

    <div class="container">
        <div class="step-indicator">
            <div class="step active">
                <div class="step-number">1</div>
                <div class="step-title">Appointment Details</div>
            </div>
            <div class="step">
                <div class="step-number">2</div>
                <div class="step-title">Confirmation</div>
            </div>
            <div class="step">
                <div class="step-number">3</div>
                <div class="step-title">Completion</div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6 mb-4">
                <div class="info-box">
                    <h4><i class="fas fa-info-circle text-primary me-2"></i>Important Information</h4>
                    <p class="mb-0">Please fill out all fields accurately to ensure we can provide you with the best possible care. All information will be kept confidential.</p>
                </div>
                <img src="img/appointment-illustration.png" alt="Appointment Illustration" class="illustration-img">
            </div>

            <div class="col-lg-6">
                <div class="card appointment-card">
                    <div class="card-header">
                        <h5 class="mb-0"><i class="fas fa-calendar-check me-2"></i> Appointment Form</h5>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                ${errorMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                ${succMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <form class="row g-3" action="appAppointment" method="post">
                            <input type="hidden" name="userid" value="${userObj.id }">

                            <div class="col-md-6">
                                <label for="fullname" class="form-label">Full Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input required type="text" class="form-control" id="fullname" name="fullname" placeholder="Your full name">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="gender" class="form-label">Gender</label>
                                <select class="form-select" id="gender" name="gender" required>
                                    <option value="" selected disabled>Select gender</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label for="age" class="form-label">Age</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
                                    <input required type="number" class="form-control" id="age" name="age" min="1" max="120" placeholder="Your age">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="appoint_date" class="form-label">Appointment Date</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                    <input type="date" class="form-control" id="appoint_date" required name="appoint_date">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input required type="email" class="form-control" id="email" name="email" placeholder="your.email@example.com">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="phno" class="form-label">Phone Number</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    <input maxlength="10" required type="tel" class="form-control" id="phno" name="phno" placeholder="10-digit number">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="diseases" class="form-label">Medical Concern</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-notes-medical"></i></span>
                                    <input required type="text" class="form-control" id="diseases" name="diseases" placeholder="Brief description">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="doct" class="form-label">Select Doctor</label>
                                <select required class="form-select" id="doct" name="doct">
                                    <option value="" selected disabled>-- Select Doctor --</option>
                                    <%
                                    DoctorDao dao = new DoctorDao(DBConnect.getConn());
                                    List<Doctor> list = dao.getAllDoctor();
                                    for (Doctor d : list) {
                                    %>
                                    <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>

                            <div class="col-12">
                                <label for="address" class="form-label">Full Address</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-home"></i></span>
                                    <textarea required name="address" id="address" class="form-control" rows="3" placeholder="Your complete address"></textarea>
                                </div>
                            </div>

                            <div class="col-12 mt-4">
                                <c:if test="${empty userObj }">
                                    <a href="user_login.jsp" class="btn btn-appointment btn-lg w-100 text-uppercase">
                                        <i class="fas fa-sign-in-alt me-2"></i>Login to Book Appointment
                                    </a>
                                </c:if>

                                <c:if test="${not empty userObj }">
                                    <button type="submit" class="btn btn-appointment btn-lg w-100 text-uppercase">
                                        <i class="far fa-paper-plane me-2"></i>Submit Appointment
                                    </button>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="component/footer.jsp"%>

    
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <script>
        
        document.getElementById('appoint_date').min = new Date().toISOString().split('T')[0];

        
        const formControls = document.querySelectorAll('.form-control, .form-select');
        formControls.forEach(control => {
            control.addEventListener('focus', function() {
                this.parentElement.querySelector('.input-group-text').style.backgroundColor = '#2a9d8f';
                this.parentElement.querySelector('.input-group-text').style.color = 'white';
            });
            control.addEventListener('blur', function() {
                this.parentElement.querySelector('.input-group-text').style.backgroundColor = '';
                this.parentElement.querySelector('.input-group-text').style.color = '';
            });
        });
    </script>
</body>
</html>
