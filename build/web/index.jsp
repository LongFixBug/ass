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
        <%@include  file="components/navBarComponent.jsp" %>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Piano Music Center</h1>
                    <p class="lead fw-normal text-white-50 mb-0">
                        Everyone Can Play Music
                    </p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="text-center"> 
                        <h1 style="color: red" class="display-4 fw-bolder">List Course</h1>
                    </div> 
                    <div class="col-md-12">
                        
                          <c:choose>
                                 <c:when test="${listProducts == null || listProducts.size()==0}">
                                     NOT FOUNDS
                                 </c:when>
                                 <c:otherwise>
                                     <nav aria-label="Page navigation example" class="d-flex justify-content-center"> 
                                         <ul class="pagination">
                                        <%-- <li class="page-item"><a class="page-link" href="home?page=${page-1}">Previous</a> --%>     
                                                 
                                             </li>
                                                 <c:forEach begin="1" end="${totalPage}" var="i">
                                                 <li class="page-item ${i==page?"active":""}"><a class="page-link" href="home?page=${i}">${i}</a></li>
                                                 </c:forEach>                                
                                         <%-- <li class="page-item"><a class="page-link" href="home?page=${page+1}">Next</a></li>  --%>                                   
                                         </ul>
                                     </nav>
                                 </c:otherwise>
                             </c:choose> 


                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center">
                            <c:forEach items="${listProducts}" var="P" >
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div class="badge bg-dark text-white position-absolute" style="top: 1rem; right: 1rem">
                                          <c:choose>
                                                    <c:when test="${P.status == 1}">
                                                        Active
                                                    </c:when>
                                                    <c:otherwise>
                                                        Not Active
                                                    </c:otherwise>
                                                </c:choose>
                                                
                                        </div>
                                        <!-- Product image-->
                                        <a href="detail?productId=${P.id}">
                                            <img 
                                                class="card-img-top" 
                                                src="${P.imageUrl}" 
                                                alt="..." 
                                                /> 
                                        </a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${P.name}</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                <span class="text-center">Price $${P.price}</span> <br/>
                                                <span class="text-center">Date: ${P.startDate} - ${P.endDate} </span>
                                                
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-outline-dark mt-auto" 
                                                   onclick="addToCartAsync(${P.id})"
                                                   >Add to cart</a></div>
                                        </div>
                                    </div>
                                </div> 
                            </c:forEach>
                        </div>     
                                      
                          <c:choose>
                                 <c:when test="${listProducts == null || listProducts.size()==0}">
                                     NOT FOUNDS
                                 </c:when>
                                 <c:otherwise>
                                     <nav aria-label="Page navigation example" class="d-flex justify-content-center"> 
                                         <ul class="pagination">
                                        <%-- <li class="page-item"><a class="page-link" href="home?page=${page-1}">Previous</a> --%>     
                                                 
                                             </li>
                                                 <c:forEach begin="1" end="${totalPage}" var="i">
                                                 <li class="page-item ${i==page?"active":""}"><a class="page-link" href="home?page=${i}">${i}</a></li>
                                                 </c:forEach>                                
                                         <%-- <li class="page-item"><a class="page-link" href="home?page=${page+1}">Next</a></li>  --%>                                   
                                         </ul>
                                     </nav>
                                 </c:otherwise>
                             </c:choose> 
                    </div>
                </div>

            </div>
        </section>
        <%@include file="components/footerComponent.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script>
                                                       function addToCartAsync(productId) {
                                                           axios.get('add-to-cart-async', {
                                                               params: {
                                                                   productId: productId
                                                               }
                                                           }).then((response) => {
                                                               //lay data thanh cong
                                                               document.getElementById("cart_number").innerHTML = response.data;
                                                               //cap nhat view
                                                           })
                                                       }
        </script>
    </body>
</html>
