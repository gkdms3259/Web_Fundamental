<%@ page pageEncoding="UTF-8"%>
<%@ page import="kr.co.kic.dev1.dto.NoticeDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="kr.co.kic.dev1.dao.NoticeDao"%>
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
	NoticeDao dao = NoticeDao.getInstance();
	ArrayList<NoticeDto> list = dao.select(start, length);
	
	int totalRows = dao.getRows();//63개
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
			<li class="breadcrumb-item active" aria-current="page">Notice</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">공지사항</h5>
						<div class="table-responsive-md">
							<table class="table table-hover">
								<colgroup>
									<col width="10%" />
									<col width="12%" />
									<col width="63%" />
									<col width="15%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">작성자</th>
										<th scope="col">제목</th>
										<th scope="col">등록날짜</th>
									</tr>
								</thead>
								<tbody>
									<%
									if(list.size() != 0){
										for(int i=0;i<list.size();i++){
											NoticeDto dto = list.get(i);
											int num = dto.getNum();
											String writer = dto.getWriter();
											String title = dto.getTitle();
											String regdate = dto.getRegdate();
									%>
									<tr>
										<th scope="row"><%=pageNum--  %></th>
										<td><%=writer %></td>
										<td><a href="view.jsp?num=<%=num%>"><%=title %></a> </td>
										<td><%=regdate %></td>
									</tr>
									<%
										}
									}else{ 
									%>
									<tr>
										<td class="text-center" colspan="4" scope="row">공지된 게시물이 없습니다.</td>
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