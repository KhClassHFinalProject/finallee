<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
body{
	width:90%;
}
table>thead>tr>th{
	font-size: 140%;
	text-align: center;
}
table>tbody>tr>td{
	font-size: 120%;
}
</style>
<body>

<div class="container" id="modalForm">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">수업 관리</h4>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container" id="modalForm">
  <!-- Modal -->
  <div class="modal fade" id="modalB" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">선생님 추가</h4>
        </div>
        <div class="Bmodal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>

<div class="row">
	<div class="col-md-2">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	
	<div class="col-md-9" >

		<h2>선생님 리스트</h2>
		
		<c:set var="dto" value="${dto}"/>
		<form name="teacherList" action="learningTeacherAdd.ju" method="get">
		<table class="table">
		<thead>
			<tr>
				<th>강사 이름</th>
				<th>생년월일</th>
				<th>연락처</th>
				<th>주소</th>
				<th>강사 설명</th>
				<th>진행중인 수업 수</th>
				<th>끝난 수업 수</th>
				<th>수업 정보</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="8" align="center">
						등록된 강사가 없습니다.
					</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td align="center">${dto.tc_name}<input type="hidden" id="tc_idx" value="${dto.tc_idx}"></td>
					<td align="center">${dto.tc_birth}</td>
					<td align="center">${dto.tc_hp}</td>
					<td>${dto.tc_addr}</td>
					<td>${dto.tc_sum}</td>
					<td align="center">${dto.tc_num}</td>
					<td align="center">${dto.tc_end}</td>
					<td align="center"><button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" onclick="modalOpen('${dto.tc_idx}')" id="classInfo">수업 확인</button></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot align="center">
			<tr>
				<td colspan="8">
				<nav>
				  <ul class="pagination">
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    ${pageStr}
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
				</td>
			</tr>
		</tfoot>
		</table>
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modalB" onclick="modalBdd()">강사등록</button>
		</form>
		</div>
	</div>
<script>
$("#learningList").addClass('open').children('ul').show();
$("#learningList3").addClass('open').children('ul').show();
function modalOpen(idx){
	var params = new Object();
	params.tc_idx = idx;
	$.ajax({
		type : "POST",
		url : "teacherInfo.ju",
		data : params,
		success : function(args) {
			$(".modal-body").html(args);
		}
	})
}

function modalBdd(){
	var params = new Object();
	$.ajax({
		type : "GET",
		url : "learningTeacherAdd.ju",
		success : function(args) {
			$(".Bmodal-body").html(args);
		}
	})
}



</script>
</body>
</html>