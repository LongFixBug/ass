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
        <div class="container" style="min-height:  1000px">
            <div class="alert alert-success text-center mt-5" role="alert">
              Thank you very much
              <div class="text-center mt-2">
                  <a class="btn btn-outline-dark" href="home">Continue Shopping</a>
              </div>
            </div>           
        </div>
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>
