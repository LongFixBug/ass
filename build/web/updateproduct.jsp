<%-- 
    Document   : updateproduct
    Created on : Dec 11, 2022, 10:23:39 PM
    Author     : long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>

    </head>
    <body>
        <form action="adminUpdate" method="POST" class="mt-3" style="margin-bottom: 100px">

            <table>
                <tr>
                    <input class="form-control" type="hidden" name="id"
                   value="${product.id}"/><br/>
                </tr>
                
                <tr>
                    <td>name*<br/>
                <c:if test="${not empty messagename}">
                    <i style="color: red">${messagename}</i>
                </c:if> 
                </td>
                <td><input type="text" name="name" value="${product.name}"required/> (6-20 chars)</td>
                </tr>

                <tr>
                    <td>price*<br/>
                <c:if test="${not empty messageprice}">
                    <i style="color: red">${messageprice}</i>
                </c:if>
                </td>
                <td><input type="number" name="price" value="${product.price}" required/> (5-20 chars)</td>
                </tr>


                <tr>
                    <td>quantity*<br/>
                <c:if test="${not empty messagequantity}">
                    <i style="color: red">${messagequantity}</i>
                </c:if>
                </td>
                <td><input type="number" name="quantity" value="${product.quantity}" required/></td>
                </tr>

                <tr>              
                        <td>Description: <c:if test="${not empty messagedescription}">
                    <i style="color: red">${messagedescription}</i>
                </c:if>
                </td> 
                <td><textarea class="form-control" type="text" name="description" required
                              rows="4">${product.description}</textarea><br/></td>  
                </tr>
                <tr>
                    <tr>
                    <td>image*<br/>
                <c:if test="${not empty messageimageUrl}">
                    <i style="color: red">${messageimageUrl}</i>
                </c:if>
                </td>
                <td><input type="text" name="imageUrl" value="${product.imageUrl}" required/></td>
                </tr>
                <tr>
                    <td>startDate*<br/>
<!--                <c:if test="${not empty messagestartDate}">
                    <i style="color: red">${messagestartDate}</i>
                </c:if>-->
                </td>
                <td><input type="date" name="startDate" value="${product.startDate}" required/></td>
                </tr>
                <tr>
                    <td>endDate*<br/>
<!--                <c:if test="${not empty messageendDate}">
                    <i style="color: red">${messageendDate}</i>
                </c:if>-->
                </td>
                <td><input type="date" name="endDate" value="${product.endDate}" required/></td>
                </tr>
                <tr>
                    <td>categoryId*<br/>
                <c:if test="${not empty messagecategoryId}">
                    <i style="color: red">${messagecategoryId}</i>
                </c:if>
                </td>
                <td><input type="number" name="categoryId" value="${product.categoryId}" required/></td>
                </tr>
                <tr>
                       <td>status*<br/>
                <c:if test="${not empty messagestatus}">
                    <i style="color: red">${messagestatus}</i>
                </c:if>
                </td>
                <td><input type="number" name="status" value="${product.status}" required/></td>
               
                </tr>
                
                      <input class="btn btn-primary w-100" type="submit" value="Update">
            <td><a style="color: green" href="admin">Comeback</a></td>
                </tr>
                  <h3 class="text-danger">${MSG_SUCCESS}</h3>
            <h3 class="text-danger">${msg}</h3>
            <h3 class="text-danger">${MSG_ERROR}</h3>
            </table>
            

          
        </form>


    </body>
</html>
