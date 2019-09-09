<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page pageEncoding="UTF-8"%>
<%
	String tempNo = request.getParameter("no");
	int no = 0;
	try{
		no = Integer.parseInt(tempNo);
	}catch(NumberFormatException e){
		no = 0;
	}
	EmpDao dao = EmpDao.getInstance();
	EmpDto dto = dao.select(no);
	
	if(dto != null){
		no = dto.getNo();
		String name = dto.getName();
		String job = dto.getJob();
		int mgr = dto.getMgr();
		String hiredate = dto.getHiredate();
		float sal = dto.getSal();
		float comm = dto.getComm();
		int deptNo = dto.getDeptNo();
%>
<%@ include file="../inc/header.jsp" %>

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Emp</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">사원정</h5>

						<form class="form-horizontal" role="form" name="f" method="post" action="">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="empno">사원번호</label>
								<div class="col-sm-10">
									<p><%=no %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">사원이름</label>
								<div class="col-sm-10">
									<p><%=name %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="job">직책</label>
								<div class="col-sm-10">
									<p><%=job %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="mgr">상사</label>
								<div class="col-sm-10">
									<p><%=mgr %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="mgr">월급</label>
								<div class="col-sm-10">
									<p><%=sal %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="mgr">커미션</label>
								<div class="col-sm-10">
									<p><%=comm %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="mgr">부서번호</label>
								<div class="col-sm-10">
									<p><%=deptNo %></p>
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
	alert("없는글입니다.");
	history.back(-1);
</script>
<%} %>




