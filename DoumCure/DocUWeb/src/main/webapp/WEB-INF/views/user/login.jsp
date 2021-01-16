<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login css -->
  <style>
    .btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn:active:focus, .btn:focus{
      outline: none;
    } 
  .btn-success{
    background-color: #41BF6D;
  }
  input[type='checkbox']{
    appearance: checkbox;
    position: relative;
    top: 1.5px;
  }
  input[type='checkbox']:checked{
    appearance:checkbox;
  }
  label[for=rememberId]{
    position: relative;
    top: -1.5px;
  }
  </style>
  
  <section class="user-bg user-area">
        <div class="container user_container">
          <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-12 user-text-bg user-text-area">
              <h4 align="center">로그인</h4>
              <br/>
              <form name="loginForm" action="loginForm.user" method="post" id="loginForm">
                <div class="form-group">
                  <input type="text" name="id" class="form-control" id="id" placeholder="ID" onkeyup="checkId()">
                </div>
                <div class="form-group">
                    <input type="password" name="pw" class="form-control" id="password" placeholder="PASSWORD" onkeyup="checkPw()">
                </div> 
                <div class="form-group">
                  <input type="checkbox" id="rememberId"> <label for="rememberId">Remember ID</label> 
                </div> 
                <div class="form-group">
                    <p id="check"></p>
                    <button type="button" class="btn btn-lg user-btn btn-block" onclick="check()">로그인</button>
                </div>
                <hr class="user_line">
                <div class="form-group">
                    <button type="button" class="btn btn-lg btn-block kakao-user-btn"><img src="../img/user/kakaolink_btn_small.png">카카오로그인</button>
                    <button type="button" class="btn btn-lg btn-block naver-user-btn"><img src="../img/user/navericon.PNG">네이버로그인</button>
                </div>
              </form>
            </div>
          </div>
        </div>
</section>

<script>
	var chid = false;
	var chpw = false;
	
	function checkId(){
    var id = $("#id").val().replace(/\s/gi, "");
		if( id.length <= 0){
      		console.log(id.length);
      		$("#check").html('아이디를 입력해주세요');
			$("#check").css("color","red");
      		chid = false;
		}else if(id.length > 0){
      		console.log(id.length);
			$("#check").html("");
     		chid = true;
		}
	}
	
	function checkPw(){
		if($('#password').val() == ""){
			$('#check').html('비밀번호를 입력해주세요');
			$('#check').css("color","red");
      		chpw = false;
		}else if($("#password").val() != "") {
			$('#check').html("");
      		chpw = true;
    	}
	}
	
	function check(){
    	checkId();
		if(chid){
      		checkPw();
    	}
		if(chid && chpw && chpwma){
      		$("#loginForm").submit();
		}
	}
</script>