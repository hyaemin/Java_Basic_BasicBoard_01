<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WriteForm</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/writeForm.css?qqsq" >
<script type="text/javascript">

	//글 등록하기
	function board_write_confirm() {
		
		var form = document.getElementById("writeForm");
		
		form.action = "<c:url value='/write'/>";
		form.submit();
		
	}
	
	//글 취소하고 목록으로 돌아가기
	function go_boardList() {
		location.href="boardList";
	}
	

</script>
</head>
<body>
<div id="write_wrap">
		<div id="write_top">
		 	<div id="write_top_title">BasicBoard Write</div>
		</div>
			<div id="write_bottom">
					<a href='#' onclick='board_write_confirm()'>[ Confirm ]</a>
					<a href='#' onclick='go_boardList()'>[ List ]</a>
			</div>
		<div id="write_middle">
			<form id="writeForm" name="writeForm" method="post">
				<table id="write_table">
					<tr>
						<td class="title">Title</td>
						<td colspan="3" class="title"><input style="width: 100%;" placeholder="제목을 입력해주세요."  type="text" id="title" name="title" /></td>
					</tr>
					<tr>
						<td class="writer">Writer</td>
						<td class="writer" ><input style="width: 100%;" placeholder="ID를 입력해주세요."  type="text" id="writer" name="writer" /></td>
						<td class="writer">Password</td>
						<td class="writer"><input style="width: 100%;" placeholder="비밀번호를 입력해주세요."  type="text" id="password" name="password" /></td>
					</tr>
					<tr>
						<td class="content" colspan="4">Content</td>
					</tr>
					<tr>
						<td class="content_two" colspan="4"><textarea style="width: 100%;" placeholder="내용을 입력해주세요."  rows="10" cols="10" id="content_two" name="content"></textarea></td>
					</tr>
				</table>
				
			</form>
		</div>
	</div>


</body>
</html>