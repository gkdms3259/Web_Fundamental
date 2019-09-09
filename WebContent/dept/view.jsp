<%@page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@ page pageEncoding="UTF-8"%>
<%
	String tempNo = request.getParameter("no");
	int no = 0;
	try{
		no = Integer.parseInt(tempNo);
	}catch(NumberFormatException e){
		no = 0;
	}
	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = dao.select(no);
	
	if(dto != null){
		no = dto.getNo();
		String name = dto.getName();
		String loc = dto.getLoc();
		
%>
<%@ include file="../inc/header.jsp" %>

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Dept</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">부서</h5>

						<form class="form-horizontal" role="form" name="f" method="post" action="">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="no">부서번호</label>
								<div class="col-sm-10">
									<p><%=no %></p>
								</div>
								
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="dname">부서이름</label>
								<div class="col-sm-10">
									<p><%=name %></p>
								</div>
								
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="loc">부서위치</label>
								<div class="col-sm-10">
									<p><%=loc %></p>
								</div>
							</div>
							
						</form>

						<div class="text-right">
								<a href="list.jsp" class="btn btn-outline-success">리스트</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="../inc/footer.jsp"%>
<%}else{%>
<script>
	alert("없는 부서 입니다.");
	history.back(-1);
</script>
<%} %>




