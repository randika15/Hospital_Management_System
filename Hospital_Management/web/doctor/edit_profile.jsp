<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Profile Settings</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
    :root {
        --medical-blue: #1a6fbf;
        --doctor-green: #2a9d8f;
        --dark-teal: #264653;
        --light-gray: #f8f9fa;
    }

    .settings-header {
        background: linear-gradient(135deg, rgba(26,111,191,0.85) 0%, rgba(42,157,143,0.85) 100%),
                    url("../img/doctor-settings-banner.jpg");
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

    .settings-card {
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        border: none;
        overflow: hidden;
        border-top: 5px solid var(--medical-blue);
        margin-bottom: 30px;
    }

    .card-header {
        background-color: var(--medical-blue);
        color: white;
        font-weight: 600;
        padding: 20px;
        text-align: center;
    }

    .form-label {
        font-weight: 500;
        color: var(--dark-teal);
        margin-bottom: 8px;
    }

    .form-control, .form-select {
        border-radius: 8px;
        padding: 12px 15px;
        border: 2px solid #e0e0e0;
        transition: all 0.3s;
        margin-bottom: 20px;
    }

    .form-control:focus, .form-select:focus {
        border-color: var(--medical-blue);
        box-shadow: 0 0 0 0.25rem rgba(26,111,191,0.25);
    }

    .btn-save {
        background-color: var(--medical-blue);
        border: none;
        padding: 12px 0;
        font-weight: 600;
        letter-spacing: 0.5px;
        transition: all 0.3s;
        width: 100%;
        text-transform: uppercase;
    }

    .btn-save:hover {
        background-color: var(--dark-teal);
        transform: translateY(-2px);
    }

    .btn-change {
        background-color: var(--doctor-green);
        border: none;
        padding: 12px 0;
        font-weight: 600;
        letter-spacing: 0.5px;
        transition: all 0.3s;
        width: 100%;
        text-transform: uppercase;
    }

    .btn-change:hover {
        background-color: #228e7f;
        transform: translateY(-2px);
    }

    .alert-message {
        border-radius: 8px;
    }

    @media (max-width: 768px) {
        .settings-header {
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

    <div class="settings-header">
        <div class="text-center">
            <h1 class="display-4">Profile Settings</h1>
            <p class="lead">Manage your account information and security</p>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <!-- Change Password Card -->
            <div class="col-md-6">
                <div class="card settings-card">
                    <div class="card-header">
                        <h3 class="mb-0">Change Password</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty succMsg }">
                            <div class="alert alert-success alert-message alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i>${succMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty errorMsg }">
                            <div class="alert alert-danger alert-message alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <form action="../doctChangePassword" method="post">
                            <div class="mb-3">
                                <label class="form-label">Current Password</label>
                                <input type="password" name="oldPassword" class="form-control" required
                                    placeholder="Enter your current password">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">New Password</label>
                                <input type="password" name="newPassword" class="form-control" required
                                    placeholder="Enter your new password">
                            </div>

                            <input type="hidden" value="${doctObj.id }" name="uid">

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-change">
                                    <i class="fas fa-key me-2"></i> Change Password
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Edit Profile Card -->
            <div class="col-md-6">
                <div class="card settings-card">
                    <div class="card-header">
                        <h3 class="mb-0">Edit Profile</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty succMsgd }">
                            <div class="alert alert-success alert-message alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i>${succMsgd}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="succMsgd" scope="session" />
                        </c:if>

                        <c:if test="${not empty errorMsgd }">
                            <div class="alert alert-danger alert-message alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${errorMsgd}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="errorMsgd" scope="session" />
                        </c:if>

                        <form action="../doctorUpdateProfile" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" required name="fullname" class="form-control"
                                    value="${doctObj.fullName }">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Date of Birth</label>
                                <input type="date" required name="dob" class="form-control"
                                    value="${doctObj.dob }">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Qualification</label>
                                <input required name="qualification" type="text" class="form-control"
                                    value="${doctObj.qualification }">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Specialization</label>
                                <select name="spec" required class="form-select">
                                    <option>${doctObj.specialist }</option>
                                    <%
                                    SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                                    List<Specialist> list = dao.getAllSpecialist();
                                    for (Specialist s : list) {
                                    %>
                                    <option><%=s.getSpecialistName()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" readonly required name="email" class="form-control"
                                    value="${doctObj.email }">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mobile Number</label>
                                <input type="tel" required name="mobno" class="form-control"
                                    value="${doctObj.mobNo }">
                            </div>

                            <input type="hidden" name="id" value="${doctObj.id }">

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-save">
                                    <i class="fas fa-save me-2"></i> Save Changes
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