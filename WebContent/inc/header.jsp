<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@ page pageEncoding="UTF-8"%>
<% 
	MemberDto memberDto = (MemberDto)session.getAttribute("member");
%>
 
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script src="../js/jquery-3.4.1.js"></script>
<title>Bootstrap Template</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #563d7c;">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="/">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="/notice/list.jsp">Notice</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/emp/list.jsp">Emp</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/dept/list.jsp">Dept</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/member/list.jsp">Member</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/file/index.jsp">Upload</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/crawling/index.jsp">Crawling</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/qrcode/index.jsp">Qrcode</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/shorten/index.jsp">Shorten URL</a></li>


			</ul>
			<ul class="navbar-nav">
				<li class="nav-item">
				<%if(memberDto == null){%>
				<a class="nav-link" href="/member/register.jsp"><i class="fa fa-file-text-o"></i>Rsgister</a></li>
				<%}%>
				</li>
				<li class="nav-item">
				<%if(memberDto == null){%>
				<a class="nav-link" href="/member/login.jsp"><i class="fa fa-user"></i>Login</a></li>
				<%}else{ %>
				<a class="nav-link" href="/member/logout.jsp"><i class="fa fa-user"></i>Logout(<%=memberDto.getName()%>님 환영합니다.)</a></li>
				<%} %>
			</ul>
		</div>
	</nav>