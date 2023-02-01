<%-- 
    Document   : adminLogin
    Created on : 18-07-2022, 22:41:35
    Author     : phamp
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Admin - Dashboard</title>
    </head>
    <body class="sb-nav-fixed">
        <!-- Admin navbar -->
        <%@include file="components/adminNavBarComponent.jsp" %>
        <div id="layoutSidenav">
            <!-- Admin Slidenav -->
            <%@include file="components/adminSlideNavComponent.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Overview</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <!-- Account Table -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="bi bi-table"></i>
                                Accounts table
                            </div>
                            <div class="card-body">
                                <table id="accountsTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Email</th>
                                            <th>Name</th>
                                            <th>Password</th>
                                            <th>Phone</th>
                                            <th>Status</th>
                                            <th>Role</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Email</th>
                                            <th>Name</th>
                                            <th>Password</th>
                                            <th>Phone</th>
                                            <th>Status</th>
                                            <th>Role</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${sessionScope.listAccounts}" var="LA">
                                            <tr>
                                                <td>${LA.id}</td>
                                                <td>${LA.email}</td>
                                                <td>${LA.username}</td>
                                                <td>${LA.password}</td>
                                                <td>${LA.phone}</td>
                                                <c:choose>
                                                    <c:when test="${LA.status == 1}">
                                                        <td style="color: blue;">Active</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td style="color: red;">inActive</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${LA.role == 1}">
                                                        <td style="color: red;">Admin</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>User</td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Orders Table -->

                        <!-- Plant table -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="bi bi-table"></i>
                                Course table
                            </div>
                            <div class="card-body">
                                <table id="plantsTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>

                                            <th>Quantity</th>
                                            <th>Price</th>
                                           
                                            <th style="width: 100px;">Image</th>
                                            <th>StartDate</th>
                                            <th>EndDate</th>
                                            <th>CategoryID</th>
                                            <th>Status</th>
                                            <th>Update Course</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>

                                            <th>Quantity</th>
                                            <th>Price</th>
                                           
                                            <th style="width: 100px;">Image</th>
                                            <th>StartDate</th>
                                            <th>EndDate</th>
                                            <th>CategoryID</th>
                                            <th>Status</th>
                                            <th>Update Course</th>
                                            
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${sessionScope.listCourse}" var="LC">
                                            <tr>
                                                <td>${LC.id}</td>
                                                <td>${LC.name}</td>
                                                <td>${LC.quantity}</td>
                                                <td>${LC.price}</td>
                                                
                                                <td><img src="${LC.imageUrl}" width="100"/></td>
                                                <td>${LC.startDate}</td>
                                                 <td>${LC.endDate}</td>
                                                 <td>${LC.categoryId}</td>
                                                
                                                <c:choose>
                                                    <c:when test="${LC.status == 1}">
                                                        <td style="color: blue;">Active</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td style="color: red;">inActive</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                        <td><a style="color: green" href="adminUpdate?id=${LC.id}">Update</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!-- Footer -->
                <jsp:include page="components/adminFooter.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="demo/chart-area-demo.js"></script>
        <script src="demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
