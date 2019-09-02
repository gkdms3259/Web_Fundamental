<%@page import="java.util.ArrayList, java.io.BufferedReader"  %>
<!-- 응답 MIME 타입과 문자인코딩을 지정한다. -->
<%@ page contentType = "text/html; charset=utf-8" %>
<!-- 문자인코딩을 지정한다. -->
<%@ page pageEncoding = "utf-8" %>
<!-- HTTPSession 객체 사용여부를 결정한다. -->

<!DOCTYPE html>	
<html>
<head>
<meta charset="UTF-8">
<title>JSP page directive Demo</title>
<script>
	let name = '성영한';
	let str = `나는 ${name}입니다.`;
	console.log(str);
</script>
</head>
<body>
	<h1> directive Demo1111</h1>
	<%
		HttpSession ses = null;
		ArrayList list = new ArrayList();
		BufferedReader br = null;
		
		request.setAttribute("name","sung");
		String id = request.getParameter("id");
				if(id == null){
					id = "";
				}
		%>
		
		당신의 이름  : ${param.id} <%=id %>
		
</body>
</html>