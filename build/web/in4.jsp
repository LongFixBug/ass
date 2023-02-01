<%-- 
    Document   : in4
    Created on : 14-07-2022, 13:05:08
    Author     : phamp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/headComponent.jsp" %>
    </head>
    <body>
        <section class="h-100 gradient-custom-2">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-9 col-xl-7">
                        <div class="card">
                            <div class="rounded-top text-white d-flex flex-row" style="background-color: #000; height:200px;">
                                <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                                         alt="Generic placeholder image" class="img-fluid img-thumbnail mt-4 mb-2"
                                         style="width: 150px; z-index: 1">
                                </div>
                                <div class="ms-3" style="margin-top: 130px;">
                                    <h3>Update Your Account</h3>
                                    
                                </div>
                            </div>
                            <div class="p-4 text-black" style="background-color: #f8f9fa;">
                                <div class="d-flex justify-content-end text-center py-1">
                                    <div>
                                        <p class="mb-1 h5">253</p>
                                        <p class="small text-muted mb-0">Photos</p>
                                    </div>
                                    <div class="px-3">
                                        <p class="mb-1 h5">1026</p>
                                        <p class="small text-muted mb-0">Followers</p>
                                    </div>
                                    <div>
                                        <p class="mb-1 h5">478</p>
                                        <p class="small text-muted mb-0">Following</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-4 text-black">
                                
                                        
                                        <form action="update-account" method="POST">
                                            <input type="hidden" name="id" value="${accountId.id}" />

                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <input type="text" id="username" class="form-control" name="username"/>
                                                    <label class="form-label" for="username"> UserName</label>
                                                </div>
                                            </div>

                                            

                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <input type="password" id="password" class="form-control" name="password"/>
                                                    <label class="form-label" for="password">Password</label>
                                                </div>
                                            </div>
                                            
                                             <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <input type="text" id="displayName" class="form-control" name="displayName" />
                                                    <label class="form-label" for="displayName"> Display Name</label>
                                                </div>
                                            </div>
                                            
                                             <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <input type="text" id="address" class="form-control" name="address"/>
                                                    <label class="form-label" for="address"> Address</label>
                                                </div>
                                            </div>
                                            
                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <input type="text" id="email" class="form-control" name="email" />
                                                    <label class="form-label" for="email">Your Email</label>
                                                </div>
                                            </div>
                                            
                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <input type="text" id="phone" class="form-control" name="phone"/>
                                                    <label class="form-label" for="phone"> Your Phone</label>
                                                </div>
                                            </div>

                                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                                <button type="submit" class="btn btn-primary btn-lg">Save</button>
                                            </div>

                                        </form>
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <p class="lead fw-normal mb-0">Recent photos</p>
                                    <p class="mb-0"><a href="#!" class="text-muted">Show all</a></p>
                                </div>
                                <div class="row g-2">
                                    <div class="col mb-2">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(112).webp"
                                             alt="image 1" class="w-100 rounded-3">
                                    </div>
                                    <div class="col mb-2">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(107).webp"
                                             alt="image 1" class="w-100 rounded-3">
                                    </div>
                                </div>
                                <div class="row g-2">
                                    <div class="col">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(108).webp"
                                             alt="image 1" class="w-100 rounded-3">
                                    </div>
                                    <div class="col">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(114).webp"
                                             alt="image 1" class="w-100 rounded-3">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src="js/scripts.js"></script>
    </body>
</html>
