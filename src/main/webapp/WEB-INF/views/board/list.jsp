<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	alert("자바스크립트 테스트");
	solid();
	
	var result = '<c:out value="${result}" />';
	var actionForm = $("#actionForm");
	
	$("#dataTable_paginate2 li a").on("click", function(e) {
		e.preventDefault();
		console.log("click");
		$("#actionForm").find("input[name='pageNum']").val($(this).attr("href"));
		$("#actionForm").submit();
	});
	
	$("#regBtn").on("click", function() {
		self.location = "/board/register";
	});
	
	$("tbody tr").on("click", function(){	
		var $actionFrm = $("#actionForm")
		$actionFrm.append("<input type='hidden' name='bno' id='bno' value='" + $(this).find("td:eq(0)").text() + "'>");
		$actionFrm.attr("action", "/board/get");
		$actionFrm.submit();
	});

	checkModal(result);
	history.replace({}, null, null);

	function checkModal(result) {
		if (result == '' || history.state) return;
		if (parseInt(result) > 0) $('.modal-body').html('게시글 : ' + parseInt(result) + "번이 등록되었습니다. ");
		$("#myModal").modal("show");
	}
	
	
});

function solid() {
	$("#dataTable_paginate2 li.paginate_button.active").attr("style", "border:solid")
}
</script>

<form id="actionForm" action="/board/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
</form>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Tables</h1>
	<p class="mb-4">
		new register board <a target="_blank"
			href="http://127.0.0.1:8080/board/register">Go Register</a>.
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.bno}"></c:out></td>
								<td><c:out value="${board.title}"></c:out></td>
								<td><c:out value="${board.writer}"></c:out></td>
								<td><fmt:formatDate pattern="YYYY-MM-dd"
										value="${board.regdate}" /></td>
								<td><fmt:formatDate pattern="YYYY-MM-dd"
										value="${board.update}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>

<!-- 페이징 넘버 -->
<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate2">
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button page-item previous disabled">
				<a href="${pageMaker.startPage - 1}">Previous</a>
			</li>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? 'active':'' } ">
				<a href="${num}">${num}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<li class="paginate_button page-item next disabled">
				<a href="${pageMaker.endPage + 1}">Next</a>
			</li>
		</c:if>
	</ul>
</div>

<%@ include file="../include/footer.jsp"%>
