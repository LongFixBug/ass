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
        <!-- Product section-->
        <section class="py-5">
            <div class="container" style="min-height: 1000px">
                <c:choose>
                    <c:when test="${sessionScope.carts==null||sessionScope.carts.size()==0}" >
                        <h1> List is Empty </h1>
                    </c:when>
                    <c:otherwise>
                        <h3>List Products</h3>
                        <table class="table table-dark table-striped" >
                            <thead class="text-center" >
                                <tr>
                                    <th scope="col"><i class="bi bi-list-ol"></i></th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody class="text-center">
                                <c:forEach items="${carts}" var="C">
                                <form action="update-quantity">
                                    <tr>
                                    <input type="hidden" name="productId" value="${C.value.product.id}"  />  
                                    <th scope="row">${C.value.product.id}</th>
                                    <td><img src="${C.value.product.imageUrl}" width="50"/></td>
                                    <td>${C.value.product.name}</td>
                                    <td>${C.value.product.price}</td>
                                    <td><input onchange="this.form.submit()" type="number" name="quantity" value="${C.value.quantity}"/></td>
                                    <td>${C.value.product.price*C.value.quantity}</td>
<!--                                    <td><a href="delete-cart?productId=${C.value.product.id}" class="btn btn-outline-light"><i class="bi bi-trash"></i>Delete</a></td>                                -->
                                    <td>
                                        <span>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#blockBtn${C.value.product.id}">
                                                <i class="bi bi-trash"></i> Delete
                                            </button>
                                            <!-- Modal -->
                                            <div class="modal fade" id="blockBtn${C.value.product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="p-4 text-center fs-3"
                                                             style="color: red;">
                                                            Are you sure you want to remove plant "<span class="text-dark">${C.value.product.name}</span>" from your cart?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                            <a href="delete-cart?productId=${C.value.product.id}" class="btn btn-outline-danger"><i class="bi bi-trash"></i>Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </span>
                                    </td>
                                    </tr> 
                                </form>                                
                            </c:forEach>
                            </tbody>
                        </table>
                        <h3 <i class="bi bi-cash-coin" > Total Money: $${totalMoney} </i> </h3>
                        <a href="checkout" class="btn btn-dark w-25">Check Out</a>
                    </c:otherwise>
                </c:choose>              
            </div>
        </section>
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>
