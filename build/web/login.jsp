<%-- 
    Document   : index
    Created on : 30-06-2022, 23:19:10
    Author     : phamp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="components/headComponent.jsp" %>
    <body>        
        <section class="vh-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6 text-black">                       
                        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

                            <form style="width: 23rem;" action="login" method="POST">

                                <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Log in</h3>

                                <div class="form-outline mb-4">
                                    <input type="text" id="username" class="form-control form-control-lg" name="username" />
                                    <label class="form-label" for="username">User name</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" id="password" class="form-control form-control-lg" name="password" />
                                    <label class="form-label" for="password">Password</label>
                                </div>

                                <div class="mb-4 form-check">
                                    <input type="checkbox" id="exampleCheck1" class="form-check-input" name="remember"/>
                                    <label class="form-check-label" for="exampleCheck1">Remember me</label>
                                </div>
                                <h3 class="text-danger">${error}</h3>

                                <div class="pt-1 mb-4">
                                    <button type="submit" class="btn btn-info btn-lg btn-block" type="button">Login</button>
                                </div>


                                <p class="small mb-5 pb-lg-2"><a class="text-muted" href="#!">Forgot password?</a></p>
                                <p>Don't have an account? <a href="registration" class="link-info">Register here</a></p>

                            </form>

                        </div>

                    </div>
                    <div class="col-sm-6 px-0 d-none d-sm-block">
                        <img src="./images/logo.jpg"
                             alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: right;">
                    </div>
                </div>
            </div>
        </section>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <script src="js/scripts.js"></script>
    </body>
</html>
