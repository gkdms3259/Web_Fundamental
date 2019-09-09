<%@page import="kr.co.kic.dev1.util.Utility"%>
<%@ page contentType="application/json;charset=utf-8"%>
<%
	String clientId = "TNmvU6DNqh0G6hv4ztY2";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "pZ1IiVmaiy";//애플리케이션 클라이언트 시크릿값";
	String oriUrl = request.getParameter("url");
	String url = Utility.getShortenURL(clientId, clientSecret, oriUrl);
	if(url != null && url.trim().length()>0){
%>
{"path" : "<%=url %>"}
<%}else{%>
{"path" : "<%="" %>"}
<%}%>