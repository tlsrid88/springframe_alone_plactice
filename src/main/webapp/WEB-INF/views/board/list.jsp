<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	var result = '<c:out value="${result}" />';
	
	checkModal(result);
	
	history.replace({}, null, null);
	
	function checkModal(result) {
		
		if (result == '' || history.state) {
			return;
		}
		
		if (parseInt(result) > 0) {
			$('.modal-body').html('게시글 : ' + parseInt(result) + "번이 등록되었습니다. ");
		}
		$("#myModal").modal("show");
	}
});
</script>


 <!-- Begin Page Content -->
 <div class="container-fluid">

   <!-- Page Heading -->
   <h1 class="h3 mb-2 text-gray-800">Tables</h1>
   <p class="mb-4">new register board <a target="_blank" href="http://127.0.0.1:8080/board/register">Go Register</a>.</p>

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
               <th>#번호</th>
               <th>제목</th>
               <th>작성자</th>
               <th>작성일</th>
               <th>수정일</th>
             </tr>
           </thead>
           <c:forEach items="${list}" var="board">
           	<tr>
           		<td><c:out value="${board.bno}"></c:out></td>
           		<td><c:out value="${board.title}"></c:out></td>
           		<td><c:out value="${board.writer}"></c:out></td>
           		<td><fmt:formatDate pattern="YYYY-MM-dd" value="${board.regdate}"/></td>
           		<td><fmt:formatDate pattern="YYYY-MM-dd" value="${board.update}"/></td>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>
      