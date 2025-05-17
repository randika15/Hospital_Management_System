<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Portal | Secure Login</title>
        <%@include file="component/allcss.jsp" %>

        <style>
            :root {
                --medical-blue: #1a6fbf;
                --doctor-green: #2a9d8f;
                --dark-teal: #264653;
                --light-gray: #f8f9fa;
            }

            .doctor-hero {
                background: linear-gradient(135deg, rgba(26,111,191,0.85) 0%, rgba(42,157,143,0.85) 100%),
                            url("img/doctor-hero-bg.jpg");
                height: 30vh;
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
                transition: transform 0.3s ease;
                max-width: 450px;
                margin: 0 auto;
                border-top: 5px solid var(--medical-blue);
            }

            .doctor-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 15px 35px rgba(0,0,0,0.15);
            }

            .card-header {
                background-color: white;
                color: var(--dark-teal);
                font-weight: 600;
                padding: 25px;
                text-align: center;
                border-bottom: 1px solid rgba(0,0,0,0.1);
            }

            .card-body {
                padding: 30px;
            }

            .form-label {
                font-weight: 500;
                color: var(--dark-teal);
                margin-bottom: 8px;
                font-size: 15px;
            }

            .form-control {
                border-radius: 8px;
                padding: 12px 15px;
                border: 2px solid #e0e0e0;
                transition: all 0.3s;
                margin-bottom: 20px;
            }

            .form-control:focus {
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

            .doctor-icon {
                width: 90px;
                height: 90px;
                background-color: white;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: -60px auto 20px;
                box-shadow: 0 5px 20px rgba(0,0,0,0.1);
                border: 4px solid var(--medical-blue);
            }

            .doctor-icon i {
                font-size: 40px;
                color: var(--medical-blue);
            }

            .input-icon {
                position: relative;
            }

            .input-icon i {
                position: absolute;
                left: 15px;
                top: 14px;
                color: var(--medical-blue);
            }

            .input-icon input {
                padding-left: 45px;
            }

            .security-badge {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-top: 20px;
                color: #666;
                font-size: 13px;
            }

            .security-badge i {
                color: var(--doctor-green);
                margin-right: 8px;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>

        <div class="doctor-hero">
            <div class="text-center">
                <h1 class="display-4">Doctor Portal</h1>
                <p class="lead">Secure access to medical records and tools</p>
            </div>
        </div>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card doctor-card">
                        <div class="card-header">
                            <h3 class="mb-0">Professional Login</h3>
                        </div>
                        <div class="card-body">
                            <div class="doctor-icon">
                                <i class="fas fa-user-md"></i>
                            </div>

                            <c:if test="${not empty succMsg}">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <i class="fas fa-check-circle me-2"></i>${succMsg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty errorMsg}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <c:remove var="errorMsg" scope="session"/>
                            </c:if>

                            <form action="doctorLogin" method="post">
                                <div class="mb-3 input-icon">
                                    <label class="form-label"></label>
                                    <i class="fas fa-envelope"></i>
                                    <input type="email" class="form-control" required name="email" placeholder="your.name@clinic.com">
                                </div>

                                <div class="mb-3 input-icon">
                                    <label class="form-label"></label>
                                    <i class="fas fa-lock"></i>
                                    <input type="password" class="form-control" required name="password" placeholder="••••••••">
                                </div>

                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-doctor">
                                        <i class="fas fa-sign-in-alt me-2"></i>Access Portal
                                    </button>
                                </div>

                                <div class="security-badge">
                                    <i class="fas fa-shield-alt"></i>
                                    <span>All data is encrypted and secure</span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="component/footer.jsp" %>

        <!-- Font Awesome for icons -->
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

        <script>
            // Add animation to form elements when focused
            const inputs = document.querySelectorAll('.form-control');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.previousElementSibling.style.color = 'var(--medical-blue)';
                    this.parentElement.querySelector('i').style.color = 'var(--dark-teal)';
                });
                input.addEventListener('blur', function() {
                    this.previousElementSibling.style.color = '';
                    this.parentElement.querySelector('i').style.color = 'var(--medical-blue)';
                });
            });
        </script>
    </body>
</html>