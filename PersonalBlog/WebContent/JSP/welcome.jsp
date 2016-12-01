<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<!-- my personal blog's css file  -->
<link rel="stylesheet" href="/PersonalBlog/resource/blog/myblogstyle.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<title>My Blog</title>
</head>
<body>
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
	                		<li><a href="<c:url value="/findAllBlogs/spring/1"/>">Spring related</a></li>
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
	            <form class="navbar-form navbar-right" role="search" action="search">
       				<div class="form-group">
          				<input name="searchKey" type="text" class="form-control" placeholder="Search"/>
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
	<div class="center welcome-page-content-top">
		<img src="/PersonalBlog/resource/img/head.jpg" class="img-circle">
  		<h3><small>shaoli's personal Blog</small></h3>
	</div>
	<div class="center content-top">
  		<h3><small>for more 'interesting' thing will come soon...</small></h3>
  		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	</div>
	<div class="container">
		<div class="welcome-page-content-top">
			<div class="footer-wrapper">
				<hr><p> © · 2016-2xxx &nbsp;<a href="#">HouShaoli's Personal Blog</a></p>
			</div>
		</div>
	</div>
</body>
</html>