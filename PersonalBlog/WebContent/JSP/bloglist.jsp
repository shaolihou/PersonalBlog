<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 表单标签库 -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<!-- my personal blog's css file  -->
<link rel="stylesheet" href="<c:url value="/resource/blog/myblogstyle.css"/>">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<title>BlogList</title>
</head>
<body >
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
	        	<a class="navbar-brand" href="<c:url value="/"/>">MyBlog</a>
	        </div>
	        <div class="collapse navbar-collapse navbar-ex1-collapse">
	        	<ul class="nav navbar-nav">
	            	<li><a href="#about">About</a></li>
	                <li class="dropdown">
	                	<a  href="#" class="dropdown-toggle" data-toggle="dropdown">Blog<span class="caret"></span></a>
	                	<ul class="dropdown-menu" role="menu">
	                		<li><a href="<c:url value="/findAllBlogs/all/1"/>">All Blogs</a></li>
	                		<li class="divider"></li>
	                		<li><a href="<c:url value="/findAllBlogs/Spring/1"/>">Spring/SpringMVC</a></li>
	                		<li><a href="<c:url value="/findAllBlogs/bootstrap/1"/>">bootstrap</a></li>
	                		<li><a href="<c:url value="/findAllBlogs/mybatis/1"/>">MyBatis</a></li>
	                		<li><a href="<c:url value="/findAllBlogs/java/1"/>">java knowledge</a></li>
	                		<li><a href="<c:url value="/findAllBlogs/web/1"/>">web knowledge</a></li>
	                		<li class="divider"></li>
	                		<li><a href="<c:url value="/findAllBlogs/others/1"/>">others</a></li>
	                	</ul>
	                </li>
	                <li><a href="#">Contact</a></li>
	            </ul>
	            <form class="navbar-form navbar-right" role="search" action="<%=basePath%>search" method="post">
       				<div class="form-group">
          				<input name="searchKey" type="text" class="form-control" placeholder="Search">
        			</div>
        			<button type="submit" class="btn btn-default">Search</button>
      			</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a class="header-user-name" href="#"><c:out value="${user.userName}"/></a></li>
					<li><a href="<c:url value="/addBlog"/>">New Blog</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="bloglist-height content-top container">
		<div class="content row">
			<div class="col-md-9">
				<ul class="media-list">
					<!--<li><span>PageCount: ${responseParm.pageCount}/CurrentPage: ${responseParm.currentPage}</span></li> -->
					<c:forEach items="${responseParm.bloglist}" var="blog" begin="0" end="${responseParm.bloglist.size()}" step="1">
						<li><span class="month"><fmt:formatDate type="both" value="${blog.createDate}" pattern="yyyy.MM.dd"/></span><span>&nbsp;&nbsp;·&nbsp; </span><a href="<c:url value="/blog/${blog.blogID}"/>">${blog.blogTile}</a></li>
					</c:forEach>	
				</ul>
			</div>
		</div>
	</div>
	<nav class="content-bottom">
  		<ul class="pagination">
  			<c:if test="${responseParm.currentPage == 1}">
  				<li><a href="#" class="disable">&laquo;</a></li>
  			</c:if>
  			<c:if test="${responseParm.currentPage != 1}">
  				<li><a href="<c:url value="/findAllBlogs/${responseParm.keyTag}/${responseParm.currentPage - 1}"/>">&laquo;</a></li>
  			</c:if>
  			<c:forEach var="pageNo" begin="1" end="${responseParm.pageCount}" step="1">
  				<c:if test="${responseParm.currentPage == pageNo}">
  					<li><a href="#" class="disable">${pageNo}</a></li>
  				</c:if>
  				<c:if test="${responseParm.currentPage != pageNo}">
  					<li><a href="<c:url value="/findAllBlogs/${responseParm.keyTag}/${pageNo}"/>">${pageNo}</a></li>
  				</c:if>
  			</c:forEach>
		    <c:if test="${responseParm.currentPage == responseParm.pageCount}">
  				<li><a href="#" class="disable">&raquo;</a></li>
  			</c:if>
  			<c:if test="${responseParm.currentPage != responseParm.pageCount}">
  				<li><a href="<c:url value="/findAllBlogs/${responseParm.keyTag}/${responseParm.currentPage + 1}"/>">&raquo;</a></li>
  			</c:if>
 		 </ul>
	</nav>
	<div class="container">
		<div class="footer">
			<div class="footer-wrapper">
				<hr><p> © · 2016-2xxx &nbsp;<a href="#">HouShaoli's Personal Blog</a></p>
			</div>
		</div>
	</div>
</body>
</html>