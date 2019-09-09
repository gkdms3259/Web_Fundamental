<%@page import="kr.co.kic.dev1.util.Utility"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<%
	Document doc = null;
	String url = "https://coinmarketcap.com/currencies/bitcoin/historical-data/?start=20190101&end=20190909";

	try {
		doc = Jsoup.connect(url).get();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	//System.out.println("Date\tOpen\tHigh\tLow\tClose\tVolume\tMarket Cap");

	Elements bodyElements = doc.select(".table-responsive .table tbody tr");
	
%>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Crawling</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Crawling</h5>
						<div class="table-responsive-md">
							<table class="table-responsive table table-hover">
								<colgroup>
									<col width="25%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
									<col width="20%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">Date</th>
										<th scope="col">tOpen</th>
										<th scope="col">tHigh</th>
										<th scope="col">tLow</th>
										<th scope="col">tClose</th>
										<th scope="col">tVolume</th>
										<th scope="col">tMarket Cap</th>
									</tr>
								</thead>
								<tbody>
									<%
									if(bodyElements.size() !=0 ){
									for(int i=0;i<bodyElements.size();i++) {
										int index = 0;
										Element trElement = bodyElements.get(i);
										//Element dateElement = trElement.child(0);
										String date = trElement.child(index++).text();
										date = Utility.getKoreanDate(date);
										//Element openElement = trElement.child(1);
										String open = trElement.child(index++).text();
										String high = trElement.child(index++).text();
										String low = trElement.child(index++).text();
										String close = trElement.child(index++).text();
										String volume = trElement.child(index++).text();
										String marketCap = trElement.child(index++).text();
									%>
									<tr>
										<th scope="row"><%=date%></th>
										<td><%=open%> </td>
										<td><%=high %></td>
										<td><%=low%></td>
										<td><%=close %></td>
										<td><%=volume %></td>
										<td><%=marketCap %></td>
									</tr>
									<%
										} //end of for문
									}else{
									%>
									<tr>
										<td class="text-center" colspan="7" scope="row">공지된 데이터가 없습니다.</td>
									</tr>
									<%} %>
								</tbody>
							</table>
							
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="../inc/footer.jsp"%>