
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Register</title>
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
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card point-card">
                        <div class="card-body">
                            <p class="fs-4 text-center">User Register</p>
                            
                             <c:if test="${not empty sucMsg}">
                                <h5 class="text-center text-success">${sucMsg}</h5>
                                <c:remove var="sucMsg" scope="session"/>
                            </c:if>
                                
                                 <c:if test="${not empty errorMsg}">
                                <h5 class="text-center text-danger">${errorMsg}</h5>
                                <c:remove var="errorMsg" scope="session"/>
                            </c:if>
                            
                            

                            <form action="signup" method="post">
                                 <div class="mb-3">
                                    <label  class="form-label">Full Name</label>
                                    <input type="text" name="fullname" class="form-control" required>
                                    
                                </div>
                                <div class="mb-3">
                                    <label  class="form-label">Email address</label>
                                    <input name="email" type="email" class="form-control" required>
                                    
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Password</label>
                                    <input type="password" class="form-control" name="password" required>
                                </div>
                                
                                <button type="submit" class="btn bg-success text-white col-md-12">Submit</button>
                            </form>




                        </div>
                    </div>
                </div>
            </div>
        </div>






    </body>
</html>
