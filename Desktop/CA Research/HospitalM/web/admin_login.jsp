<%-- 
    Document   : admin_login.jsp
    Created on : May 19, 2023, 5:23:15 PM
    Author     : piuma
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login Page</title>
        <%@include file="component/allcss.jsp" %>
        
         <style>
            
            .point-card{
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
            
        </style>
        
    </head>
    <body>
         <%@include file="component/navbar.jsp" %>
         
        
        <div class="container p-5">
            <div class="row mt-2">
                <div class="col-md-4 offset-md-4">
                    <div class="card point-card">
                        <div class="card-body">
                            <h3 class="text-center">Admin Login</h3>
                            
                              <c:if test="${not empty succMsg}">
                                <h5 class="text-center text-success">${succMsg}</h5>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>
                                
                                 <c:if test="${not empty errorMsg}">
                                <h5 class="text-center text-danger">${errorMsg}</h5>
                                <c:remove var="errorMsg" scope="session"/>
                            </c:if>
                            

                            
                            <form action="adminLogin" method="post">
                                <div class="mb-3">
                                    <label  class="form-label">Email Address</label>
                                    <input type="email" class="form-control"  required="required" name="email">
                                   
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Password</label>
                                    <input type="password" class="form-control"  required="required" name="password">
                                </div>
                                
                                
                                <button type="submit" class="btn bg-success   text-white col-md-12">Login</button>
                                
                                
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
         
         
    </body>
</html>
