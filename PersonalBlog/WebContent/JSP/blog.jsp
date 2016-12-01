<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>${responseParm.blog.blogTile}</title>
</head>
<body class="top">
<div class="container">
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
	</div>
	<div class="blogButton">
		<div class="btn-group">
			<a class="btn btn-md btn-default" href="<c:url value="/update/${responseParm.blog.blogID}"/>"><span class="glyphicon glyphicon-pencil"></span></a>
			<a class="btn btn-md btn-default" data-toggle="modal" data-target="#deleteConfirm"  href="#"><span class="glyphicon glyphicon-remove"></span></a>
		</div>
		<div class="modal fade bs-example-modal-sm" id="deleteConfirm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		      </div>
		      <div class="modal-body">
		        <h4>Do you confirm to delete this Blog?</h4>
		      </div>
		      <div class="modal-footer">
		      	<a class="btn btn-md btn-default" data-dismiss="modal">Cancel</a>
		      	<a class="btn btn-md btn-default" href="<c:url value="/delete/${responseParm.blog.blogID}"/>">Delete</a>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<div class=" container">
		<div class="header-title">
			<div class="header-title-wrapper">
				<h1>${responseParm.blog.blogTile}</h1>
				<p><fmt:formatDate type="both" value="${responseParm.blog.createDate}" pattern="yyyy.MM.dd"/></p>
			</div>
		</div>
	</div>
	<div class="container main-container">
		<div class="post">
			<div class="content blogContent">
				${responseParm.blog.blogContent}
			</div>
			<div class="info"> 
				<ul class="list-unstyled">
					<li>
						<span>
							Tags:
							<c:forEach var="tag" items="${responseParm.tagList}">
								<a class="btn btn-xs btn-default" href="<c:url value="/findAllBlogs/${tag}/1"/>">${tag}</a>
							</c:forEach>
						</span>
					</li>
					<li>
						Update on <fmt:formatDate type="both" value="${responseParm.blog.lastEditDate}" pattern="yyyy.MM.dd"/>
					</li>
				</ul>
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