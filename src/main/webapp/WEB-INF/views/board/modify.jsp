<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">

$(function(){
	var formObj = $("form");
	$('button').on("click", function(e){
		
		e.preventDefault();
		console.log("preventEvent : ", e.preventDefault());
		
		var operation = $(this).data("oper");
		
		if (operation === 'remove') {
			formObj.attr("action", "/board/remove");
			
		} else if(opertaion === 'list') {
			formObj.attr("action", "/board/list").attr("method", "get");
			formObj.submit();
		}
		
		formObj.submit();
	});
});

</script>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Get Content!</h1>
              </div>
              <form action="/board/modify" method="post">
	               <div class="form-group">
	                 <label>Bno</label>
	                 <input type="text" class="form-control form-control-user" name="bno" value="<c:out value='${board.bno}'/>"  readonly="readonly">
	               </div>
	               <div class="form-group">
	                 <label>Title</label>
	                 <input type="text" class="form-control form-control-user" name="title" value="<c:out value='${board.title}'/>" >
	               </div>
	               <div class="form-group">
	                 <label>Text Area</label>
	                 <input type="text" class="form-control form-control-user" name="content" value="<c:out value='${board.content}'/>" >
	               </div>
	               <div class="form-group">
	                  <label>Writer</label>
	                  <input type="text" class="form-control form-control-user" name="writer" value="<c:out value='${board.writer}'/>" readonly="readonly">
	                </div>
	                <div class="form-group">
	                  <label>Update</label>
	                  <input class="form-control" name="update" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.update}"/>' readonly="readonly">
	                </div>
	                <div class="form-group">
	                  <label>RegDate</label>
	                  <input class="form-control" name="regDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}" />' readonly="readonly">
	                </div>
                </form>
                
                <button data-oper="modify" class="btn-btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">Modify</button>
                <button data-oper="remove" class="btn-btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">Remove</button>
                <button data-oper="list" class="btn-btn-default" onclick="location.href='/board/list'">List</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/js/sb-admin-2.min.js"></script>

</body>

<%@ include file="../include/footer.jsp" %>
      