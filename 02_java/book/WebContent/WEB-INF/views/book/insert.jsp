<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="${contextPath}main?action=insert" method="post">
	<table>
		<tr>
			<th colspan="2">도서 정보 입력</th>
		</tr>
		<tr>
			<th>도서 일련번호</th>
			<td>시스템 자동 부여</td>
		</tr>
		<tr>
			<th>ISBN</th>
			<td><input type="text" name="isbn" value="" /></td>
		</tr>
		<tr>
			<th>도서 제목</th>
			<td><input type="text" name="title" value="" /></td>
		</tr>
		<tr>
			<th>저자</th>
			<td><input type="text" name="author" value="" /></td>
		</tr>
		<tr>
			<th>내용소개</th>
			<td>
				<textarea name="content" cols="60" rows="15"></textarea>
			</td>
		</tr>
		<tr>
			<th>출판사</th>
			<td>
				<c:forEach var="code" items="${codes}">
					<input type="radio" name="companyCd" 
					       value="${code.code}" 
					       id="${code.code}"/>
					<label for="${code.code}">${code.codeVal}</label>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>페이지 수</th>
			<td><input type="number" name="totalPage" value="" /></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="number" name="price" value="" /></td>
		</tr>
		<tr>
			<th>재고 수량</th>
			<td><input type="number" name="quantity" value="" /></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="저장하기" />
				<input type="reset" value="초기화" />
			</th>
		</tr>
	</table>
</form>

</body>
</html>