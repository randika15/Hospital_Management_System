<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<style>
    :root {
        --medical-blue: #1a6fbf;
        --doctor-green: #2a9d8f;
        --dark-teal: #264653;
        --light-gray: #f8f9fa;
    }

    .admin-navbar {
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

    .logout-btn {
        display: flex;
        align-items: center;
        background-color: rgba(255,255,255,0.1);
        padding: 0.3rem 0.8rem;
        border-radius: 20px;
    }

    .logout-btn:hover {
        background-color: rgba(255,255,255,0.2);
    }

    .logout-btn i {
        margin-right: 8px;
    }

    @media (max-width: 991px) {
        .navbar-collapse {
            padding: 1rem 0;
        }

        .nav-link {
            margin: 0.3rem 0;
            padding: 0.8rem 1rem !important;
        }

        .logout-btn {
            margin: 0.5rem 0;
            width: 100%;
        }
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark admin-navbar">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-clinic-medical"></i> Medi Home
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#adminNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="adminNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-home"></i> HOME
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="doctor.jsp">
                        <i class="fas fa-user-md"></i> DOCTOR
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="view_doctor.jsp">
                        <i class="fas fa-list-ul"></i> VIEW DOCTOR
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="patient.jsp">
                        <i class="fas fa-user-injured"></i> PATIENT
                    </a>
                </li>
            </ul>

            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link logout-btn" href="../adminLogout">
                        <i class="fas fa-sign-out-alt"></i> LOGOUT
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>