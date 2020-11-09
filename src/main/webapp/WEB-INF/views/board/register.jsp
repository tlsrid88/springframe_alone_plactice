<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">



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
                <h1 class="h4 text-gray-900 mb-4">Create an Content!</h1>
              </div>
              <form class="user" action="/board/register" method="post">
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" name="title" id="bulletinTitle" placeholder="Title">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" name="content" id="bulletinTextArea" placeholder="TextArea">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" name="writer" id="bulletinWriter" placeholder="Writer">
                </div>
                
                <button type="submit" class="btn btn-primary btn-user btn-block">submit Button</button>
                <hr>
                
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="forgot-password.html">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="login.html">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>

<%@ include file="../include/footer.jsp" %>
      