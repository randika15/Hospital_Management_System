<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Back | User Login</title>
        <%@include file="component/allcss.jsp" %>

        <style>
            :root {
                --primary-color: #2a9d8f;
                --secondary-color: #264653;
                --accent-color: #e9c46a;
                --light-color: #f8f9fa;
                --dark-color: #343a40;
            }

            .login-hero {
                background: linear-gradient(135deg, rgba(42,157,143,0.85) 0%, rgba(38,70,83,0.85) 100%),
                            url("img/medical-hero.jpg");
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

            .login-card {
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                border: none;
                overflow: hidden;
                transition: transform 0.3s ease;
                max-width: 450px;
                margin: 0 auto;
            }

            .login-card:hover {
                transform: translateY(-5px);
            }

            .card-header {
                background-color: var(--primary-color);
                color: white;
                font-weight: 600;
                padding: 20px;
                text-align: center;
                border-bottom: 4px solid var(--accent-color);
            }

            .card-body {
                padding: 30px;
            }

            .form-label {
                font-weight: 500;
                color: var(--secondary-color);
                margin-bottom: 8px;
            }

            .form-control {
                border-radius: 8px;
                padding: 12px 15px;
                border: 2px solid #e0e0e0;
                transition: all 0.3s;
                margin-bottom: 20px;
            }

            .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 0.25rem rgba(42,157,143,0.25);
            }

            .btn-login {
                background-color: var(--primary-color);
                border: none;
                padding: 12px 0;
                font-weight: 600;
                letter-spacing: 0.5px;
                transition: all 0.3s;
                width: 100%;
                text-transform: uppercase;
            }

            .btn-login:hover {
                background-color: var(--secondary-color);
                transform: translateY(-2px);
            }

            .user-icon {
                width: 80px;
                height: 80px;
                background-color: white;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: -50px auto 20px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
                border: 4px solid var(--primary-color);
            }

            .user-icon i {
                font-size: 36px;
                color: var(--primary-color);
            }

            .input-icon {
                position: relative;
            }

            .input-icon i {
                position: absolute;
                left: 15px;
                top: 14px;
                color: var(--primary-color);
            }

            .input-icon input {
                padding-left: 45px;
            }

            .signup-link {
                color: var(--primary-color);
                font-weight: 500;
                transition: all 0.3s;
            }

            .signup-link:hover {
                color: var(--secondary-color);
                text-decoration: underline;
            }

            .divider {
                display: flex;
                align-items: center;
                margin: 20px 0;
            }

            .divider::before, .divider::after {
                content: "";
                flex: 1;
                border-bottom: 1px solid #e0e0e0;
            }

            .divider-text {
                padding: 0 10px;
                color: var(--dark-color);
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>

        <div class="login-hero">
            <div class="text-center">
                <h1 class="display-4">Welcome Back</h1>
                <p class="lead">Access your personal health portal</p>
            </div>
        </div>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card login-card">
                        <div class="card-header">
                            <h3 class="mb-0">User Login</h3>
                        </div>
                        <div class="card-body">
                            <div class="user-icon">
                                <i class="fas fa-user-circle"></i>
                            </div>

                            <c:if test="${not empty succMsg}">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    ${succMsg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty errorMsg}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    ${errorMsg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <c:remove var="errorMsg" scope="session"/>
                            </c:if>

                            <form action="userLogin" method="post">
                                <div class="mb-3 input-icon">
                                    <label class="form-label"></label>
                                    <i class="fas fa-envelope"></i>
                                    <input type="email" class="form-control" required name="email" placeholder="your.email@example.com">
                                </div>

                                <div class="mb-3 input-icon">
                                    <label class="form-label"></label>
                                    <i class="fas fa-lock"></i>
                                    <input type="password" class="form-control" required name="password" placeholder="••••••••">
                                </div>

                                <div class="d-grid gap-2 mb-3">
                                    <button type="submit" class="btn btn-login">
                                        <i class="fas fa-sign-in-alt me-2"></i>Login
                                    </button>
                                </div>

                                <div class="text-center mb-3">
                                    <a href="#" class="text-decoration-none text-muted">Forgot password?</a>
                                </div>

                                <div class="divider">
                                    <span class="divider-text">OR</span>
                                </div>

                                <div class="text-center mt-3">
                                    Don't have an account? <a href="signup.jsp" class="text-decoration-none signup-link">Create one</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="component/footer.jsp" %>

        
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

        <script>
            
            const inputs = document.querySelectorAll('.form-control');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.previousElementSibling.style.color = 'var(--primary-color)';
                    this.parentElement.querySelector('i').style.color = 'var(--secondary-color)';
                });
                input.addEventListener('blur', function() {
                    this.previousElementSibling.style.color = '';
                    this.parentElement.querySelector('i').style.color = 'var(--primary-color)';
                });
            });
        </script>
    </body>
</html>
