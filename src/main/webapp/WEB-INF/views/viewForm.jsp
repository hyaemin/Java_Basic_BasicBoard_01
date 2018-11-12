<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SelectBoard</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/viewForm.css?aaa" >
<script type="text/javascript">

	//수정하기 => 비밀번호 체크하기
	function board_update() {
		
		var form = document.getElementById("viewForm");
		var url = "<c:url value='/updateForm'/>";//controller에서 requestMapping의 value
		url = url + "?boardNo="+${result.boardNo};
		
		form.action = url;
		form.submit();
		
	}
	
	//삭제하기 => 비밀번호 체크하기
	function board_delete() {
		
		var form = document.getElementById("viewForm");
		
		var url = "<c:url value='/delete'/>";//controller에서 requestMapping의 value
		
		form.action = url;
		form.submit();

	}
	
	//목록으로
	function go_boardList() {
		location.href="boardList";
	}

</script>
</head>
<body>
<div id="view_wrap">
		<div id="view_top">
		 	<div id="view_top_title">BasicBoard View</div>
		</div>
	<form id="viewForm" name="viewForm" method="post">
		<input type="hidden" id="boardNo" name="boardNo" value="${result.boardNo}"/>
			<div id="view_bottom">
					<div id="view_bottom_updateBtn">
						<a href='#' onclick='board_update()'>[ Modify ] </a>
						<a href='#' onclick='board_delete()'>[ Delete ] </a>				
						<a href='#' onclick='go_boardList()'>[ List ]</a>				
					</div>
			</div>
			<div id="view_middle_out">
				<div id="view_middle_in">
					
						<div id=one>
							<span id="title_one" class="title">Title : </span>
							<span id="title_two" class="title"><c:out value="${result.title}"/></span>
						</div>
						<div id="two">
							<span id="writer_one" class="writer">Writer : </span>
							<span id="writer_two" class="writer"><c:out value="${result.writer}"/></span>
						</div>
						<div id="three">
							<div id="content_one" class="content">Content</div>
							<div id="content_two" class="content"><c:out value="${result.content}"/></div>
						</div>					
				</div>
			</div>
	</form>
</div>
</body>
</html>