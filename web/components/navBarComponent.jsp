<%-- 
    Document   : navbarComponents
    Created on : 04-07-2022, 14:54:53
    Author     : phamp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->
<link rel="stylesheet" href="css/app.css">
<nav class="navbar navbar-expand-lg navbar-light bg-light" >
    <div class="container px-4 px-lg-5">
        <a href="home" class="logo12">
            <img style="max-width: 120px; max-height: 120px" src="./images/logo-3.png" alt="IMG-LOGO">
        </a>   
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">                       
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
      
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">List Course</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li> <c:forEach items="${sessionScope.listCategories}" var="C">
                            <li class="dropdown-item" class="dropdown-menu"><a style="color: black" href="filter-category?categoryId=${C.id}">${C.name}</a></li>
                                </c:forEach></li>
                        
                    </ul>
                </li>
            </ul>
           
            <form action="search" class="d-flex mx-auto">
                <input class="form-control me-2" 
                       type="search" 
                       placeholder="Search" 
                       aria-label="Search"
                       name ="keyword"/>

                <button class="btn btn-outline-dark" 
                        type="submit"><i class="bi bi-search"></i></button>
            </form>
            <div class="d-flex my-2" style="margin-right: 20%">
                <a class="btn btn-outline-dark" href="carts">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span id="cart_number" class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                </a>
            </div>
            <c:choose >
                <c:when test="${sessionScope.account != null}">
                    
                        <a type="hidden" href="update-account?id=${sessionScope.account.id}" 
                           style="color: red"  class= "btn btn-outline-dark ms-lg-2"> WELLCOME ${sessionScope.account.displayName}
                        </a>
                   
                    <a href="logout" class= "btn btn-outline-dark ms-lg-2">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="login" class= "btn btn-outline-dark ms-lg-2">Login</a>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</nav>


<!--                <nav class="navbar navbar-expand-lg navbar-light bg-light">
   Container wrapper 
  <div class="container-fluid">
     Toggle button 
    <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="fas fa-bars"></i>
    </button>

     Collapsible wrapper 
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
       Navbar brand 
      <a class="navbar-brand mt-2 mt-lg-0" href="#">
        <img
          src="https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp"
          height="15"
          alt="MDB Logo"
          loading="lazy"
        />
      </a>
       Left links 
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="#">Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Team</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Projects</a>
        </li>
      </ul>
       Left links 
    </div>
     Collapsible wrapper 

     Right elements 
    <div class="d-flex align-items-center">
       Icon 
      <a class="text-reset me-3" href="#">
        <i class="fas fa-shopping-cart"></i>
      </a>

       Notifications 
      <div class="dropdown">
        <a
          class="text-reset me-3 dropdown-toggle hidden-arrow"
          href="#"
          id="navbarDropdownMenuLink"
          role="button"
          data-mdb-toggle="dropdown"
          aria-expanded="false"
        >
          <i class="fas fa-bell"></i>
          <span class="badge rounded-pill badge-notification bg-danger">1</span>
        </a>
        <ul
          class="dropdown-menu dropdown-menu-end"
          aria-labelledby="navbarDropdownMenuLink"
        >
          <li>
            <a class="dropdown-item" href="#">Some news</a>
          </li>
          <li>
            <a class="dropdown-item" href="#">Another news</a>
          </li>
          <li>
            <a class="dropdown-item" href="#">Something else here</a>
          </li>
        </ul>
      </div>
       Avatar 
      <div class="dropdown">
        <a
          class="dropdown-toggle d-flex align-items-center hidden-arrow"
          href="#"
          id="navbarDropdownMenuAvatar"
          role="button"
          data-mdb-toggle="dropdown"
          aria-expanded="false"
        >
          <img
            src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
            class="rounded-circle"
            height="25"
            alt="Black and White Portrait of a Man"
            loading="lazy"
          />
        </a>
        <ul
          class="dropdown-menu dropdown-menu-end"
          aria-labelledby="navbarDropdownMenuAvatar"
        >
          <li>
            <a class="dropdown-item" href="#">My profile</a>
          </li>
          <li>
            <a class="dropdown-item" href="#">Settings</a>
          </li>
          <li>
            <a class="dropdown-item" href="#">Logout</a>
          </li>
        </ul>
      </div>
    </div>
     Right elements 
  </div>
   Container wrapper 
</nav>
 Navbar -->