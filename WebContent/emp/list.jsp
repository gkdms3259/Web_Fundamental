<%@ page pageEncoding="UTF-8"%>
<%@ page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ include file="../inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	System.out.println(tempPage);
	int cPage = 0;
	if(tempPage == null || tempPage.length()==0){
		cPage = 1;
	}
	try{
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1;
	}
	int length = 10;
	int pageLength = 5;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int start = (cPage-1) * length;
	int pageNum = 0;
	
	EmpDao dao = EmpDao.getInstance();
	ArrayList<EmpDto> list = dao.select(start, length);
	
	int totalRows = dao.getRows();
	pageNum = totalRows + (cPage -1)*(-length);
	
	totalPage = totalRows%length == 0 ? 
				totalRows/length : totalRows/length + 1 ;
	if(totalPage == 0){
		totalPage = 1;
	}
	
	int currentBlock = cPage % pageLength == 0 ?
			cPage/pageLength : cPage/pageLength + 1;
	int totalBlock = totalPage % pageLength == 0 ?
			totalPage/pageLength : totalPage/pageLength +1;
	//An = a1 + (n-1)*d        n => currentBlock
	//startPage => 1, 11, 21
	startPage = 1 + (currentBlock - 1) * pageLength;
	//endPage => 10, 20, 30, .....
	endPage = pageLength + (currentBlock - 1) * pageLength;
	
	if(currentBlock == totalBlock){
		endPage = totalPage;
	}
	
%>
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
						<h5 class="card-title">사원</h5>
						<div class="table-responsive-md">
							<table class="table table-hover">
								<colgroup>
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
									<col width="25%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">사원번호</th>
										<th scope="col">이름</th>
										<th scope="col">직책</th>
										<th scope="col">사수</th>
										<th scope="col">부서번호</th>
										<th scope="col">입사날짜</th>
									</tr>
								</thead>
								<tbody>
									<%
									if(list.size() != 0){
										for(int i=0;i<list.size();i++){
											EmpDto dto = list.get(i);
											int no = dto.getNo();
											String name = dto.getName();
											String job = dto.getJob();
											int mgr = dto.getMgr();
											String hiredate = dto.getHiredate();
											int deptno = dto.getDeptNo();
									%>
									<tr>
										<th scope="row"><%=pageNum--  %></th>
										<td><a href="view.jsp?no=<%=no%>"><%=name %></a></td>
										<td><%=job %></td>
										<td><%=mgr %></td>
										<td><a href="../dept/view.jsp?no=<%=deptno%>"><%=deptno %></a></td>
										<td><%=hiredate %></td>
									</tr>
									<%
										}
									}else{ 
									%>
									<tr>
										<td class="text-center" colspan="6" scope="row">사원정보가 없습니다.</td>
									</tr>
									<%} %>
								</tbody>
							</table>

							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-lg justify-content-center">
									<%if(currentBlock != 1){ %>
									<li class="page-item">
										<a class="page-link" href="list.jsp?page=<%=startPage-1 %>" tabindex="-1">&laquo;</a>
									</li>
									<%}else{ %>
									<li class="page-item disabled">
										<a class="page-link" href="#" tabindex="-1">&laquo;</a>
									</li>
									<%} %>
									
									<%for(int i=startPage;i<=endPage;i++){ %>
									<li class="page-item <%if(cPage==i){ %>active<%}%>"><a class="page-link" href="list.jsp?page=<%=i %>"><%=i %></a></li>
									<%} %>
									<%if(currentBlock != totalBlock){ %>
									<li class="page-item">
										<a class="page-link" href="list.jsp?page=<%=endPage+1 %>">&raquo;</a>
									</li>
									<%}else{ %>
									<li class="page-item disabled">
										<a class="page-link" href="#">&raquo;</a>
									</li>
									<%} %>
									
								</ul>
							</nav>		
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="../inc/footer.jsp"%>