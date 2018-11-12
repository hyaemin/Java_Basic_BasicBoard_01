<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MainBoard</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/boardList.css?aadfg" >
<script type="text/javascript">

	//글 조회하기
	function board_view(boardNo) {
		
		var form = document.getElementById("boardForm");
		var url = "<c:url value='/viewContent'/>";//controller에서 requestMapping의 value
		url = url + "?boardNo=" + boardNo;
		
		form.action = url;
		form.submit();
	}
	//글쓰기
	function board_write() {
		
		var form = document.getElementById("boardForm");
		
		form.action = "<c:url value='/writeForm'/>";
		
		form.submit();
		
	}

</script>
</head>
<body>
	<div id="board_wrap">
		<div id="board_top">
		 	<div id="board_top_title">BasicBoard Example01</div>
		</div>
		<div id="board_bottom">
			<div id="board_bottom_writeBtn">
				<a href='#' onclick='board_write()'>[ Write ]</a>
			</div>
		</div>
		<div id="board_middle">
			<form id="boardForm" name="boardForm" method="post">
				<table id="board_table">
					<thead>
						<tr>
							<td>No</td>
							<td>Title</td>
							<td>Writer</td>
							<td>Date</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${list}" varStatus="status">
							<tr>
								<td><c:out value="${result.boardNo}"/></td>
								<td><a href='#' onclick='board_view(${result.boardNo})'><c:out value="${result.title}"/></a></td>
								<td><c:out value="${result.writer}"/></td>
								<td><c:out value="${result.writeDate}"/></td>
								<%-- <td><fmt:formatDate value="${result.writeDate}" pattern="yyyy-MM-dd" /></td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>

</body>
</html>