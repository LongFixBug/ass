<%-- 
    Document   : index
    Created on : 30-06-2022, 23:19:10
    Author     : phamp
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="en_US" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="components/headComponent.jsp" %>
    <body>
        <%@include  file="components/navBarComponent.jsp" %>
        <!-- Product section-->
        <section class="py-5">

            <div class="container" style="min-height: 1000px">
                <h1>Checkout</h1>
                <div class="row">
                    <div class="col-md-8" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">                        <h3>List Products</h3>
                        <table class="table table-dark table-striped" >
                            <thead class="text-center" >
                                <tr>
                                    <th scope="col"><i class="bi bi-list-ol"></i></th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>      
                                   
                                    <th scope="col">Total Price</th>

                                </tr>
                            </thead>
                            <tbody class="text-center">
                                <c:forEach items="${carts}" var="C">

                                <tr>
                                <input type="hidden" name="productId" value="${C.value.product.id}"  />  
                                <th scope="row">${C.value.product.id}</th>
                                <td><img src="${C.value.product.imageUrl}" width="50"/></td>
                                <td>${C.value.product.name}</td>
                                <td>${C.value.product.price}</td>
                                <td>${C.value.quantity}</td>
                                
                                <td>${C.value.product.price*C.value.quantity}</td>                                                            
                                </tr> 

                            </c:forEach>
                            </tbody>
                        </table>
                        <h3 <i class="bi bi-cash-coin" > Total Money: <fmt:formatNumber value="${totalMoney}" type="currency" /></i> </h3></div>
                    <div class="col-md-4" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                        <h3>Information of customer</h3>
                        <form action="checkout" method="POST">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp">

                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Phone</label>
                                <input type="text" class="form-control" id="phone" name="phone" aria-describedby="emailHelp">

                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" name="address" aria-describedby="emailHelp">

                            </div>
                            <div class="mb-3">
                                <label for="note" class="form-label">Note</label>
                                <textarea class="form-control" id="note" name="note" rows="3"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Submit</button>
                        </form>
                    </div>  
                </div>           
            </div>
        </section>
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>
