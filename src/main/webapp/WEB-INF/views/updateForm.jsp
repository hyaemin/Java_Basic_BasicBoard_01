<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UpdateForm</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/updateForm.css?aaa" >
<script type="text/javascript">

	//글 수정완료
	function update_confirm() {
		
		var form = document.getElementById("updateForm");
		form.action = "<c:url value='/update'/>";
		form.submit();
		
	}
	
	//글 취소하고 목록으로 돌아가기
	function go_boardList() {
		location.href="boardList";
	}
	
</script>
</head>
<body>
<div id="update_wrap">
		<div id="update_top">
		 	<div id="update_top_title">BasicBoard Update</div>
		</div>
			<div id="update_bottom">
					<a href='#' onclick='update_confirm()'>[ Update Confirm ]</a>
					<a href='#' onclick='go_boardList()'>[ Cancel ]</a>
			</div>
		<div id="update_middle">
			<form id="updateForm" name="updateForm" method="post">
				<input type="hidden" id="boardNo" name="boardNo" value="${result.boardNo}"/>
					<table id="update_table">
						<tr>
							<td class="title">Title</td>
							<td colspan="3" class="title"><input style="width: 100%;" value="${result.title}" type="text" id="title" name="title" /></td>
						</tr>
						<tr>
							<td class="writer">Writer</td>
							<td class="writer" ><input style="width: 100%;" value="${result.writer}"  type="text" id="writer" name="writer" /></td>
							<td class="writer">Password</td>
							<td class="writer"><input style="width: 100%;" value="${result.password}"  type="text" id="password" name="password" /></td>
						</tr>
						<tr>
							<td class="content" colspan="4">Content</td>
						</tr>
						<tr>
							<td class="content_two" colspan="4"><textarea style="width: 100%;" rows="10" cols="10" id="content_two" name="content">${result.content}</textarea></td>
						</tr>
					</table>
			</form>
		</div>
	</div>
</body>
</html>