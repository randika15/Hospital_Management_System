<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    :root {
        --medical-blue: #1a6fbf;
        --doctor-green: #2a9d8f;
        --dark-teal: #264653;
        --light-gray: #f8f9fa;
    }

    .med-navbar {
        background: linear-gradient(135deg, var(--medical-blue) 0%, var(--doctor-green) 100%) !important;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        padding: 0.8rem 1rem;
    }

    .navbar-brand {
        font-weight: 700;
        font-size: 1.5rem;
        letter-spacing: 0.5px;
        display: flex;
        align-items: center;
    }

    .navbar-brand i {
        margin-right: 10px;
        font-size: 1.8rem;
    }

    .nav-link {
        font-weight: 500;
        padding: 0.5rem 1rem !important;
        margin: 0 0.2rem;
        border-radius: 6px;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
    }

    .nav-link i {
        margin-right: 6px;
        font-size: 1.1rem;
    }

    .nav-link:hover, .nav-link:focus {
        background-color: rgba(255,255,255,0.15);
        transform: translateY(-2px);
    }

    .nav-link.active {
        background-color: rgba(255,255,255,0.2);
    }

    .user-profile {
        display: flex;
        align-items: center;
        background-color: rgba(255,255,255,0.1);
        padding: 0.3rem 0.8rem;
        border-radius: 20px;
    }

    .user-profile i {
        margin-right: 8px;
    }

    .dropdown-menu {
        border: none;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    .dropdown-item {
        padding: 0.5rem 1rem;
    }

    .dropdown-item:hover {
        background-color: var(--light-gray);
        color: var(--medical-blue);
    }

    .navbar-toggler {
        border: none;
        padding: 0.5rem;
    }

    .navbar-toggler:focus {
        box-shadow: none;
    }

    @media (max-width: 991px) {
        .navbar-collapse {
            padding: 1rem 0;
        }

        .nav-link {
            margin: 0.3rem 0;
            padding: 0.8rem 1rem !important;
        }

        .user-profile {
            margin: 0.5rem 0;
            width: 100%;
        }
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark med-navbar">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="fa-solid fa-house-medical"></i> MEDI HOME
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <c:if test="${empty userObj}">
                    <li class="nav-item">
                        <a class="nav-link" href="admin_login.jsp">
                            <i class="fa-solid fa-user-shield"></i> ADMIN
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="doctor_login.jsp">
                            <i class="fa-solid fa-user-md"></i> DOCTOR
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="user_appoinment.jsp">
                            <i class="fa-solid fa-calendar-check"></i> APPOINTMENT
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="user_login.jsp">
                            <i class="fa-solid fa-user"></i> PATIENT
                        </a>
                    </li>
                </c:if>

                <c:if test="${not empty userObj}">
                    <li class="nav-item">
                        <a class="nav-link user-profile">
                            <i class="fa-solid fa-user-circle"></i> ${userObj.fullName}
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="user_appoinment.jsp">
                            <i class="fa-solid fa-calendar-plus"></i> NEW APPOINTMENT
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="view_appointment.jsp">
                            <i class="fa-solid fa-list-ul"></i> MY APPOINTMENTS
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="change_password.jsp">
                            <i class="fa-solid fa-key"></i> PASSWORD
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="userLogut">
                            <i class="fa-solid fa-right-from-bracket"></i> LOGOUT
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>