<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리 메인</title>
<style type="text/css">
	table, th, td {
		border : 1px solid black;
	}
</style>
</head>
<body>
<!-- 컨텍스트 패스 경로 요청 객체에 속성으로 추가 -->
<c:set var="contextPath" 
       value="${pageContext.request.contextPath}" 
       scope="request"/>

<!-- table>(tr>td*2)*3 -->
<table>
	<tr>
		<td colspan="2">
			<!-- 페이지 헤더 영역 -->
			<jsp:include page="/header" />
		</td>
	</tr>
	<tr>
		<td>
			<!-- 페이지 메뉴 영역 -->
			<jsp:include page="/menu" />
		</td>
		<td>
			<!-- 페이지 컨텐트 영역 
				도서 목록 보기
				도서 정보 입력
				도서 정보 상세보기
				도서 정보 수정하기 
				등의 화면들이 동적으로 변경될 위치
			-->
			<c:choose>
				<c:when test="${empty requestScope.content}">
					초기 화면 입니다..
				</c:when>
				<c:otherwise>
					<jsp:include page="${content}" />
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<!-- 페이지 푸터 영역 -->
			<jsp:include page="/footer" />
		</td>
	</tr>
</table>


</body>
</html>