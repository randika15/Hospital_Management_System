<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Your Account</title>
        <%@include file="component/allcss.jsp" %>
        
        <style>
            :root {
                --primary-color: #2a9d8f;
                --secondary-color: #264653;
                --accent-color: #e9c46a;
                --light-color: #f8f9fa;
                --dark-color: #343a40;
            }
            
            .register-hero {
                background: linear-gradient(135deg, rgba(42,157,143,0.85) 0%, rgba(38,70,83,0.85) 100%),
                            url("img/register-bg.jpg");
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
            
            .register-card {
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                border: none;
                overflow: hidden;
                transition: transform 0.3s ease;
                max-width: 500px;
                margin: 0 auto;
            }
            
            .register-card:hover {
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
            
            .btn-register {
                background-color: var(--primary-color);
                border: none;
                padding: 12px 0;
                font-weight: 600;
                letter-spacing: 0.5px;
                transition: all 0.3s;
                width: 100%;
                text-transform: uppercase;
            }
            
            .btn-register:hover {
                background-color: var(--secondary-color);
                transform: translateY(-2px);
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
            
            .login-link {
                color: var(--primary-color);
                font-weight: 500;
                transition: all 0.3s;
            }
            
            .login-link:hover {
                color: var(--secondary-color);
                text-decoration: underline;
            }
            
            .progress-steps {
                display: flex;
                justify-content: space-between;
                margin-bottom: 30px;
                position: relative;
            }
            
            .step {
                display: flex;
                flex-direction: column;
                align-items: center;
                z-index: 1;
            }
            
            .step-number {
                width: 40px;
                height: 40px;
                background-color: #e0e0e0;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
                color: var(--dark-color);
                margin-bottom: 8px;
            }
            
            .step.active .step-number {
                background-color: var(--primary-color);
                color: white;
            }
            
            .step-title {
                font-size: 14px;
                color: var(--dark-color);
                text-align: center;
            }
            
            .progress-line {
                position: absolute;
                top: 20px;
                left: 0;
                right: 0;
                height: 2px;
                background-color: #e0e0e0;
                z-index: 0;
            }
            
            .progress-line-fill {
                position: absolute;
                top: 0;
                left: 0;
                height: 100%;
                width: 50%;
                background-color: var(--primary-color);
            }
        </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        
        <div class="register-hero">
            <div class="text-center">
                <h1 class="display-4">Join Our Community</h1>
                <p class="lead">Create your account in just a few steps</p>
            </div>
        </div>
        
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card register-card">
                        <div class="card-header">
                            <h3 class="mb-0">Create Account</h3>
                        </div>
                        <div class="card-body">
                            <div class="progress-steps">
                                <div class="progress-line">
                                    <div class="progress-line-fill"></div>
                                </div>
                                <div class="step active">
                                    <div class="step-number">1</div>
                                    <div class="step-title">Account Info</div>
                                </div>
                                <div class="step">
                                    <div class="step-number">2</div>
                                    <div class="step-title">Personal Details</div>
                                </div>
                                <div class="step">
                                    <div class="step-number">3</div>
                                    <div class="step-title">Complete</div>
                                </div>
                            </div>
                            
                            <c:if test="${not empty sucMsg}">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    ${sucMsg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <c:remove var="sucMsg" scope="session"/>
                            </c:if>
                                
                            <c:if test="${not empty errorMsg}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    ${errorMsg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <c:remove var="errorMsg" scope="session"/>
                            </c:if>
                            
                            <form action="signup" method="post">
                                <div class="mb-3 input-icon">
                                    <label class="form-label"></label>
                                    <i class="fas fa-user"></i>
                                    <input type="text" name="fullname" class="form-control" required placeholder="Enter your full name">
                                </div>
                                
                                <div class="mb-3 input-icon">
                                    <label class="form-label"></label>
                                    <i class="fas fa-envelope"></i>
                                    <input name="email" type="email" class="form-control" required placeholder="your.email@example.com">
                                </div>
                                
                                <div class="mb-3 input-icon">
                                    <label class="form-label"></label>
                                    <i class="fas fa-lock"></i>
                                    <input type="password" class="form-control" name="password" required placeholder="Create a password">
                                    <div class="form-text">Use 8 or more characters with a mix of letters, numbers & symbols</div>
                                </div>
                                
                                <div class="d-grid gap-2 mb-4">
                                    <button type="submit" class="btn btn-register">
                                        <i class="fas fa-user-plus me-2"></i>Create Account
                                    </button>
                                </div>
                                
                                <div class="text-center">
                                    Already have an account? <a href="user_login.jsp" class="text-decoration-none login-link">Sign in</a>
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
            
            
            document.querySelector('input[name="password"]').addEventListener('input', function() {
                
            });
        </script>
    </body>
</html>
