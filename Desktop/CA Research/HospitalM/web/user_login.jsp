<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <%@include file="component/allcss.jsp" %>

    <style>
        body {
            background: #f7f9fc;
        }

        .login-container {
            min-height: 90vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            background-color: #ffffff;
        }

        .form-title {
            font-size: 1.8rem;
            font-weight: 600;
            text-align: center;
            margin-bottom: 1rem;
        }

        .form-label {
            font-weight: 500;
        }

        .success-msg {
            text-align: center;
            color: #28a745;
        }

        .error-msg {
            text-align: center;
            color: #dc3545;
        }

        .btn-login {
            background-color: #28a745;
            border: none;
        }

        .btn-login:hover {
            background-color: #218838;
        }

        .signup-link {
            text-align: center;
            margin-top: 1rem;
            font-size: 0.95rem;
        }
    </style>
</head>

<body>
    <%@include file="component/navbar.jsp" %>

    <div class="container login-container">
        <div class="col-md-5">
            <div class="card login-card">
                <div class="card-body">

                    <p class="form-title">User Login</p>

                    <!-- Success and Error Messages -->
                    <c:if test="${not empty succMsg}">
                        <p class="success-msg">${succMsg}</p>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty errorMsg}">
                        <p class="error-msg">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session"/>
                    </c:if>

                    <!-- Login Form -->
                    <form action="userLogin" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" name="email" id="email" class="form-control" placeholder="you@example.com" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" name="password" id="password" class="form-control" placeholder="Enter your password" required>
                        </div>

                        <button type="submit" class="btn btn-login text-white w-100">Login</button>
                    </form>

                    <div class="signup-link">
                        Don't have an account?
                        <a href="signup.jsp" class="text-success text-decoration-none"> Create one</a>
                    </div>

                </div>
            </div>
        </div>
    </div>

</body>
</html>
