
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Core</div>
                
                <a class="nav-link ${requestScope.destPage}" href="updateProduct?productId=${product.id}">
                    <i class="bi bi-person-lines-fill sb-nav-link-icon"></i>
                    Update Course
                </a>
                <a class="nav-link ${requestScope.destPage}" href="createproduct.jsp">
                    <i class="bi bi-tree sb-nav-link-icon"></i>
                    Create Course
                </a>
              
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            Admin
        </div>
    </nav>
</div>