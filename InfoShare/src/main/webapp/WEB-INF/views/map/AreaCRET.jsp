<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="<c:url value='/css/AreaCRET.css'/>" rel="stylesheet" type="text/css">
		
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=k04agvr2et&submodules=geocoder"></script>
	
	</head>
	<body>
		<div id="map" style="width:500px;height:500px;"></div>
		<script src="<c:url value='/js/AreaCRET.js'/>"></script>
		<div class="pos">
		<input type="hidden" name="address" id="address" value="${mem.memAddress }">
			<input class="locCheckbtn" type="button" value="확인" id="locCheck" onclick="locCheck()">
		</div>
	</body>
</html>