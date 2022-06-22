<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/fontawesome-free/css/all.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
<link href="vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="css/stylish-portfolio.css" rel="stylesheet">

</head>

<body id="page-top">

	<%
	request.setCharacterEncoding("UTF-8");
	String bbsDivide = "전체";
	String bbsAddress = "전체 시/도";
	if(request.getParameter("bbsDivide") != null) {
		bbsDivide = request.getParameter("bbsDivide");
	}
	if(request.getParameter("bbsDivide") != null) {
		bbsAddress = request.getParameter("bbsAddress");
	}
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>

	<!-- Navigation -->
	<a class="menu-toggle rounded" href="#"> <i class="fas fa-bars"></i>
	</a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a class="js-scroll-trigger"
				href="#page-top">Welcome!</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="index.html">홈</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#about">골드의 탄생</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#services">서비스</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="write.jsp">가게 등록하러 가기!</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#contact">연락</a></li>
			<%
				if (userID == null) {
			%>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="login.jsp">로그인</a></li>
			<%
				} else {
			%>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="logoutAction.jsp">로그아웃</a></li>
			<%
				}
			%>
		</ul>
	</nav>
	<%
	int pageNumber = 1; //기본 페이지 넘버
	//페이지넘버값이 있을때
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>

	<div class="container">
		<div class="row"> &nbsp;&nbsp;&nbsp;
			<table class="table table-striped mt-5 border-radius: 0.8rem "
				style="text-align: center; border: 1px solid #ba9106">
				
				<thead>
					
					<tr>
						<th colspan="4"
							style="background-color: hsl(41, 100%, 80%); text-align: center; border-top: #ecb807; border-bottom: 1px solid #ecb807">가게 리스트</th>
					</tr>
					<tr>
						<th
							style="background-color: hsl(41, 100%, 80%); text-align: center;">제목</th>
						<th
							style="background-color: hsl(41, 100%, 80%); text-align: center;">분류</th>
						<th
							style="background-color: hsl(41, 100%, 80%); text-align: center;">해시테그</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber, bbsDivide, bbsAddress);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle() %></a></td>
						<td><%=list.get(i).getBbsDivide() %></td>
						<td><%=list.get(i).getBbsHashtag() %></td>
					</tr>

					<%
						}
					%>
				</tbody>
				
			</table>

			<form method="get" action="list.jsp" style="width: 400px;">
					<div class="form-group float-left" style = "margin-right: 3%;">
						<select class="form-control" name="bbsDivide" style = "margin-right: 10%; border-color: #ecb807; width: 150px;">
							<option value="전체">전체</option>
							<option value="음식점" <%if(bbsDivide.equals("음식점")) out.println("selected");%>>음식점</option>
               				<option value="미용실" <%if(bbsDivide.equals("미용실")) out.println("selected");%>>미용실</option>
                			<option value="병원" <%if(bbsDivide.equals("병원")) out.println("selected");%>>병원</option>
                			<option value="마트" <%if(bbsDivide.equals("마트")) out.println("selected");%>>마트</option>
                			<option value="네일" <%if(bbsDivide.equals("네일")) out.println("selected");%>>네일</option>
                			<option value="약국" <%if(bbsDivide.equals("약국")) out.println("selected");%>>약국</option>
                			<option value="편의점" <%if(bbsDivide.equals("편의점")) out.println("selected");%>>편의점</option>
                			<option value="카페" <%if(bbsDivide.equals("카페")) out.println("selected");%>>카페</option>
                			<option value="제과점" <%if(bbsDivide.equals("제과점")) out.println("selected");%>>제과점</option>
                			<option value="공방" <%if(bbsDivide.equals("공방")) out.println("selected");%>>공방</option>
                			<option value="숙박" <%if(bbsDivide.equals("숙박")) out.println("selected");%>>숙박</option>
                			<option value="건강관리" <%if(bbsDivide.equals("건강관리")) out.println("selected");%>>건강관리</option>
                			<option value="서점" <%if(bbsDivide.equals("서점")) out.println("selected");%>>서점</option>
                			<option value="문구" <%if(bbsDivide.equals("문구")) out.println("selected");%>>문구</option>
                			<option value="기타" <%if(bbsDivide.equals("기타")) out.println("selected");%>>기타</option>
                	 			     			     
            	 		</select>
            	 	
            	</div>
            	<div class="form-group float-left" style = "margin-right: 3%;">
                  <select class="form-control" name="bbsAddress" style = "margin-right: 10%; border-color: #ecb807; width: 150px;">
                     	 <option value="전체 시/도">전체 시/도</option>
                     	 <option value="서울" <%if(bbsAddress.equals("서울")) out.println("selected");%>>서울특별시</option>
                         <option value="부산" <%if(bbsAddress.equals("부산")) out.println("selected");%>>부산광역시</option>
                         <option value="대구" <%if(bbsAddress.equals("대구")) out.println("selected");%>>대구광역시</option>
                         <option value="인천" <%if(bbsAddress.equals("인천")) out.println("selected");%>>인천광역시</option>
                         <option value="광주" <%if(bbsAddress.equals("광주")) out.println("selected");%>>광주광역시</option>
                         <option value="대전" <%if(bbsAddress.equals("대전")) out.println("selected");%>>대전광역시</option>
                         <option value="울산" <%if(bbsAddress.equals("울산")) out.println("selected");%>>울산광역시</option>
                         <option value="경기" <%if(bbsAddress.equals("경기")) out.println("selected");%>>경기도</option>
                         <option value="강원" <%if(bbsAddress.equals("강원도")) out.println("selected");%>>강원도</option>
                         <option value="충북" <%if(bbsAddress.equals("충북")) out.println("selected");%>>충청북도</option>
                         <option value="충남" <%if(bbsAddress.equals("충남")) out.println("selected");%>>충청남도</option>
                         <option value="세종" <%if(bbsAddress.equals("세종")) out.println("selected");%>>세종특별자치시</option>
                         <option value="전북" <%if(bbsAddress.equals("전북")) out.println("selected");%>>전라북도</option>
                         <option value="전남" <%if(bbsAddress.equals("전남")) out.println("selected");%>>전라남도</option>
                         <option value="경북" <%if(bbsAddress.equals("경북")) out.println("selected");%>>경상북도</option>
                         <option value="경남" <%if(bbsAddress.equals("경남")) out.println("selected");%>>경상남도</option>
                         <option value="제주" <%if(bbsAddress.equals("제주")) out.println("selected");%>>제주특별자치도</option>
                                                
                      </select>
                   
               </div>
            
     
            	<button class="btn btn-success" type="submit" 
          			style = "margin-left: 1%; width: 56px; height: 36px; color: #000000; background-color: #ecb807; border-color: #ecb807">검색</button>
        	</form>
        	
			
				
				
			<!-- 페이지 넘기기 -->
			<%
				if (pageNumber != 1) {
			%>
			<a href="list.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success float-right" 
			style="margin-right: 1%; margin-left: 50%; width: 56px; height: 36px; color: #000000; background-color: #ecb807; border-color: #ecb807">이전</a>
			<%
				}
			if (bbsDAO.nextPage(pageNumber + 1)) {
			%>
			<a href="list.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success float-right" 
			style="margin-right: 1%; margin-left: 50%; width: 56px; height: 36px; color: #000000; background-color: #ecb807; border-color: #ecb807">다음</a>
			<%
				}
			%>
			<!-- 회원만넘어가도록 -->
			<%
				//if logined userID라는 변수에 해당 아이디가 담기고 if not null
			if (session.getAttribute("userID") != null) {
			%>
			<a href="write.jsp" class="btn btn-primary float-right" style ="width: 80px; height: 36px;">등록하기</a>
			<%
				} else {
			%>
			<button class="btn btn-primary float-right" onclick="if(confirm('로그인 하세요'))location.href='login.jsp';"
			style ="width: 80px; height: 36px;" type="button" >등록하기</button>
			<%
				}
			%>
			
			
			</div>
	</div>
	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<ul class="list-inline mb-5">
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#!"> <i
						class="icon-social-facebook"></i>
				</a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#!"> <i
						class="icon-social-twitter"></i>
				</a></li>
			</ul>
			<p class="text-muted small mb-0">Copyright &copy; 골목으로 드루와!
				2021</p>
		</div>
	</footer>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/stylish-portfolio.min.js"></script>

</body>
</html>