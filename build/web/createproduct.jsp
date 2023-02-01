<%-- 
    Document   : createproduct
    Created on : Dec 13, 2022, 3:37:07 PM
    Author     : long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new Product</title>
    </head>
    <body>
                <form action="adminCreate" class="mt-3" style="margin-bottom: 100px">

            <table>
             
                <tr>
                    <td>name*<br/>
                <c:if test="${not empty messagename}">
                    <i style="color: red">${messagename}</i>
                </c:if> 
                </td>
                <td><input type="text" name="name" placeholder="new Course name" value="${name}" required/> (6-20 chars)</td>
                </tr>

                <tr>
                    <td>price*<br/>
                <c:if test="${not empty messageprice}">
                    <i style="color: red">${messageprice}</i>
                </c:if>
                </td>
                <td><input type="number" step="0.1" name="price" placeholder="new Course price" value="${price}" required/> (5-20 chars)</td>
                </tr>


                <tr>
                    <td>quantity*<br/>
                <c:if test="${not empty messagequantity}">
                    <i style="color: red">${messagequantity}</i>
                </c:if>
                </td>
                <td><input type="number" name="quantity" placeholder="new Course quantity" value="${quantity}" required/></td>
                </tr>

                <tr>              
                        <td>Description: <c:if test="${not empty messagedescription}">
                    <i style="color: red">${messagedescription}</i>
                </c:if>
                </td> 
                <td><textarea class="form-control" type="text" name="description" placeholder="new Course description" value="${description}" required
                              rows="4"></textarea><br/></td>  
                </tr>
                <tr>
                    <tr>
                    <td>image*<br/>
                <c:if test="${not empty messageimageUrl}">
                    <i style="color: red">${messageimageUrl}</i>
                </c:if>
                </td>
                <td><input type="text" name="imageUrl" placeholder="new Course image" value="${imageUrl}" required/></td>
                </tr>
                <tr>
                    <td>startDate*<br/>
<!--                <c:if test="${not empty messagestartDate}">
                    <i style="color: red">${messagestartDate}</i>
                </c:if>-->
                </td>
                <td><input type="date" name="startDate" placeholder="new Course startDate" value="${startDate}" required/></td>
                </tr>
                <tr>
                    <td>endDate*<br/>
<!--                <c:if test="${not empty messageendDate}">
                    <i style="color: red">${messageendDate}</i>
                </c:if>-->
                </td>
                <td><input type="date" name="endDate" placeholder="new Course endDate" value="${endDate}" required/></td>
                </tr>
                <tr>
                    <td>categoryId*<br/>
                <c:if test="${not empty messagecategoryId}">
                    <i style="color: red">${messagecategoryId}</i>
                </c:if>
                </td>
                <td><input type="number" name="categoryId" placeholder="new Course categoryId" value="${categoryId}" required/></td>
                </tr>

                
                      <input class="btn btn-primary w-100" type="submit" value="Create new course">
            <td><a style="color: green" href="admin">Comeback</a></td>
                </tr>
                  <h3 class="text-danger">${MSG_SUCCESS}</h3>
            <h3 class="text-danger">${msg}</h3>
            <h3 class="text-danger">${MSG_ERROR}</h3>
            </table>
            

          
        </form>
    </body>
</html>
