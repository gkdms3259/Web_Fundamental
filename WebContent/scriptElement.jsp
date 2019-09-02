<%@page import="java.util.Calendar"%>
<%@ page pageEncoding="utf-8"%>
<html>
	<body>
		<h1>Scripting Element</h1>
		<%!
			//declaration
			private int age;
			public void m(){
			
			}			
		 %>
		
		 <select>
		 <%
		 Calendar c = Calendar.getInstance();
		 int year = c.get(Calendar.YEAR);
		 
		 for(int i=1950;i<=year;i++){
		 %>
		 <option value='<%=i%>' <% if((year-20)==i){ %>selected="selected"<%} %> ><%=i %></option>
		 <!-- <option value='<%out.print(i);%>' <% if((year-20)==i){ %>selected="selected"<%} %> ><%=i %></option>  -->
		 <%
		 }
		 %>
		 </select>
	</body>
</html>