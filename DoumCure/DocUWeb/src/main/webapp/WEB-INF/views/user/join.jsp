<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- join css -->
  <style>
	  .btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn:active:focus, .btn:focus{
	    outline: none;
	  } 
  </style>
  
  <section class="user-area user-bg">
        <div class="container user_container">
          <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-12 user-text-bg user-text-area">
              <h3 align="center">회원가입</h3>
              <br/>
              <div class="form-group">
                <button type="button" class="btn btn-lg btn-block kakao-user-btn"><img src="${pageContext.request.contextPath }/resources/img/user/kakaolink_btn_small.png">카카오로그인</button>
                <button type="button" class="btn btn-lg btn-block naver-user-btn"><img src="${pageContext.request.contextPath }/resources/img/user/navericon.PNG">네이버로그인</button>
              </div>
              <hr class="user_line">
              <div class="form-group">
                <button type="button" class="btn btn-lg btn-block user-btn" onclick="location='login.user'">ID / PW 로그인</button>
              </div>
            </div>
          </div>
        </div>
</section>
