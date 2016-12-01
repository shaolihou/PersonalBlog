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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<!-- my personal blog's css file  -->
<link rel="stylesheet" href="/PersonalBlog/resource/blog/myblogstyle.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- thinyMCE	 -->
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script type="text/javascript">
  tinymce.init({
	    selector: '#blogcontent',
	    theme: 'modern',
	    width: 900,
	    height: 300,
	    plugins: [
	      'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
	      'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
	      'save table contextmenu directionality emoticons template paste textcolor'
	    ],
	    content_css: 'css/content.css',
	    toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons'
	  });
  </script>
<title>New Blog</title>
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
	                	<a href="#services" class="dropdown-toggle" data-toggle="dropdown">Blog<span class="caret"></span></a>
	                	<ul class="dropdown-menu" role="menu">
	                		<li><a href="<c:url value="/findAllBlogs/all/1"/>">All Blogs</a></li>
	                		<li class="divider"></li>
	                		<li><a href="<c:url value="/findAllBlogs/Spring/1"/>">Spring related</a></li>
	                		<li><a href="<c:url value="/findAllBlogs/bootstrap/1"/>">bootstrap</a></li>
	                		<li><a href="<c:url value="/findAllBlogs/mybatis/1"/>">MyBatis</a></li>
	                		<li><a href="<c:url value="/findAllBlogs/java/1"/>">java knowledge</a></li>
	                		<li><a href="<c:url value="/findAllBlogs/web/1"/>">web knowledge</a></li>
	                		<li class="divider"></li>
	                		<li><a href="<c:url value="/findAllBlogs/others/1"/>">others</a></li>
	                	</ul>
	                </li>
	                <li><a href="#contact">Contact</a></li>
	            </ul>
	            <form class="navbar-form navbar-right" role="search" action="<%=basePath%>search">
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
	<div class="content-top container">
		<div class="row">
			<div class="col-md-6">
				<div class="content">
					<c:url var="saveAndUpdate" value="/saveAndUpdateBlog?blogID=${blog.blogID}" />
					<form:form commandName="blog" role="form" action="${saveAndUpdate}" method="post">
					  <div class="form-group">
					    <label for="blogtitle">Blog Title</label>
					    <form:input path="blogTile" type="text" class="form-control" id="blogtitle" placeholder="Enter title"/>
					  </div>
					  <div class="form-group">
					    <label for="blogtag">Blog Tags</label>
					    <form:input path="blogTags" type="text" class="form-control" id="blogtag" placeholder="Enter tags"/>
					  </div>
					  <div class="form-group">
					    <label for="blogcontent">Blog Content</label>
					    <form:textarea path="blogContent" id="blogcontent" class="form-control" placeholder="Enter content"></form:textarea>
					  </div>
  					  <span><button type="submit" class="btn btn-default btn-sm">Submit</button></span>
					  <span><button type="reset" class="btn btn-default btn-sm">Clear</button></span>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="footer">
			<div class="footer-wrapper">
				<hr><p> © · 2016-2xxx &nbsp;<a href="#">HouShaoli's Personal Blog</a></p>
			</div>
		</div>
	</div>
</body>
</html>