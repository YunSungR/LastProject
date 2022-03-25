<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>top</title>
		<link rel="icon" type="image/png" sizes="96x96" href="/favicon.ico/favicon-96x96.png">
		<link href="<c:url value='/css/home.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/tabMenu.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/login.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/slideShow.css'/>" rel="stylesheet" type="text/css">
		
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	  	
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/wichipopup.js'/>"></script>
		<script src="<c:url value='/js/login.js'/>"></script>
		<script src="<c:url value='/js/rank-list.js'/>"></script>
		<script src="<c:url value='/js/slideShow.js'/>"></script>
		<script src="<c:url value='/js/category.js'/>"></script>
		<script src="<c:url value='/js/postSearch.js'/>"></script>
	</head>
	<body>
		<header>
			<div id="top_layout">
				<div id="headerBox">
					<div id="top-navigation">
							
						<!-- 로그인 하지 않은 경우 보여줄 메뉴 항목  -->
						<c:if test="${empty sessionScope.sid }">
							<a href="<c:url value='/loginForm'/>" id="top-a">로그인</a>&nbsp; 
							<a href="<c:url value='/consentForm'/>" id="top-a">회원가입</a>&nbsp; 
							<a href="<c:url value='/chatbotForm'/>" id="top-a">챗봇</a> &nbsp;
						</c:if>
							
						<!-- 로그인 성공한 경우 보여줄 메뉴 항목  -->	
						<c:if test="${not empty sessionScope.sid}">
							${sessionScope.sname}님
							&nbsp;&nbsp;
							<a href="<c:url value='/logout'/>" id="top-a">로그아웃</a> &nbsp;
							<a href="<c:url value='/chatbotForm'/>" id="top-a">챗봇</a> &nbsp;
						</c:if>					
					</div>
					<div id="SearchHeader">
						<div id="SearchHeader-bar">
							<a href="<c:url value='/'/>" id="Name-home">홈 그라운드</a>
						</div>
						<div id="SearchInput">
							<form id="SearchInput-Form" action="/Allsearch" >
								<input id="Header-Search" name="Allkeyword" type="text">
								<label for="Header-Search">
									<button id="SearchBtn">
									 	<img id="SearchIcon" src="<c:url value="/imgs/search_icon.png"/>">
									</button>
								</label>
							</form>
						</div>
						<div id="content">
				            <a href="#none" target="_blank" onclick="wichiPopUp()" id="rank-a">내 위치</a>
				        </div>
				        <div id="profileLink">
				        	<!-- 로그인 하지 않은 경우 보여줄 메뉴 항목  -->
							<c:if test="${empty sessionScope.sid }">
								<a href="/loginForm" id="profile">
				        			<img id="profileIcon" src="<c:url value="/imgs/profile.png"/>">
				        			<p>내 정보</p>
				        		</a>
				        		<a href="/loginForm" id="profile">
				        			<img id="profileIcon" src="<c:url value="/imgs/basket.png"/>">
				        			<p id="cartList">장바구니</p>
				        		</a>
							</c:if>
								
							<!-- 로그인 성공한 경우 보여줄 메뉴 항목  -->	
							<c:if test="${not empty sessionScope.sid}">
								<a href="/infoedit/${sessionScope.sid }" id="profile">
				        			<img id="profileIcon" src="<c:url value="/imgs/profile.png"/>">
				        			<p>내 정보</p>
				        		</a>
				        		<a href="/cartList" id="profile">
				        			<img id="profileIcon" src="<c:url value="/imgs/basket.png"/>">
				        			<p>장바구니</p>
				        		</a>
							</c:if>	
						</div>
				</div>
				<div id="MenuBar">
					<ul id="ui_guide">
						<li id="ui_guide_menu">
							<div class="tooltip">카테고리
      							<span class="tooltiptext tooltip-bottom">
      								<ul style="padding-left: 0px;">
      								<c:if test="${sessionScope.saddress =='서울' || empty sessionScope.sid}">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnSU">서울</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${1}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${1}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='부산' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnBS">부산</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${2}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${2}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='대구'|| empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnDG">대구</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${3}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${3}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='인천' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnIC">인천</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${4}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${4}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='광주' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnGJ">광주</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${5}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${5}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='대전' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnDJ">대전</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${6}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${6}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='울산' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnUS">울산</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${7}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${7}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='세종' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnSJ">세종</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${8}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${8}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='경기' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnGG">경기</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${9}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${9}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='강원' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnGW">강원</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${10}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${10}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='충북' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnCB">충북</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${11}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${11}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='충남' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnCN">충남</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${12}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${12}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='경북' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnGB">경북</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${13}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${13}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='경남' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnGN">경남</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      						<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${14}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${14}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='전북' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnJB">전북</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${15}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${15}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='전남' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnJN">전남</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${16}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${16}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='제주' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnJJ">제주</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/foodListView/${17}'/>'">음식</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/clothsListView/${17}'/>'">의류</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">화장품</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">악세서리</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">가구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">문구</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">주방 & 생활</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">전자기기 관련</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">기타</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      								</ul>
      							</span>
    						</div>
						</li>
						<li id="ui_guide_menu">
							<a href="<c:url value='/'/>" id="guide_menu_btn"><span>홈</span></a>
						</li>
						<li id="ui_guide_menu">
							<span>새로운 작품</span>
						</li>
						<li id="ui_guide_menu">
							<a id="menu" href="<c:url value='/author/listAllAuthor'/>"><span>작가님들 소개</span></a>
						</li>
						<li id="ui_guide_menu">
							<div class="tooltip">지역별 커뮤니티
      							<span class="tooltiptext tooltip-bottom">
      								<ul style="padding-left: 0px;">
      								<c:if test="${sessionScope.saddress =='서울' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnSU">서울</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${1}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${1}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='부산' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnBS">부산</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${2}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${2}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='대구' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnDG">대구</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${3}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${3}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='인천' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnIC">인천</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${4}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${4}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='광주' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnGJ">광주</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${5}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${5}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='대전' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnDJ">대전</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${6}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${6}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='울산' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnUS">울산</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${7}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${7}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='세종' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnSJ">세종</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${8}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${8}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='경기' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnGG">경기</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${9}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${9}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='강원' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnGW">강원</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${10}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${10}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if> 
      									<c:if test="${sessionScope.saddress =='충북' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnCB">충북</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${11}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${11}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='충남' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnCN">충남</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${12}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${12}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='경북' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnGB">경북</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${13}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${13}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='경남' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnGN">경남</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${14}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${14}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='전북' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnJB">전북</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${15}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${15}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='전남' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnJN">전남</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${16}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${16}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      									<c:if test="${sessionScope.saddress =='제주' || empty sessionScope.sid }">
      									<li id="LocalCat">
      										<button id="LocalCatBtn" class="LocalCatBtnJJ">제주</button>
      										<div class="tooltip-right">
					      						<ul style="padding-left: 0px;">
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/list/${17}/${1}'/>'">자유게시판</button></li>
					      							<li id="prodCat"><button id="prodCatBtn" onclick="location.href='<c:url value='/reviewlist/${17}/${2}'/>'">작품 후기</button></li>
					      							<li id="prodCat"><button id="prodCatBtn">정보공유</button></li>
					      						</ul>
					      					</div>
      									</li>
      									</c:if>
      								</ul>
      							</span>
    						</div>
						</li>
					</ul>       	
				</div>
			</div>
		</header>


	</body>

</html>