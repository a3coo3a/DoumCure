<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- user_update css -->
  <style>
    .form-control[name=zip-code]{
      display: inline;
      width: 60%;
      margin-right: 15px;
    }
    .form-group #del-ok{
      display: inline;
      width: 40%;
      float: right;
      display: none;
      height: 38.8px;
    }
    .del-btn{
      background-color: #F24B6A;
      color: #ffffff;
      float: right;
      margin-left: 5px;
      display: none;
    }    
    @media (max-width: 700px){
      .del-btn{
        padding: 10px 5px;
      }
    } 
    .form-group > .sel {
        width: 30%;
        display: inline-block;
        box-sizing: border-box;
    }
    .btn-success{
      background-color: #41BF6D;
    }
    .btn-info{
      background-color: #73bf41;
      border-color: #68ac68;
    }
    .btn-info.active, .btn-info.focus, .btn-info:active, .btn-info:focus, .btn-info:hover, .open>.dropdown-toggle.btn-info {
      background-color: #599432;
      border-color: #68ac68;
    }
    .btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn:active:focus, .btn:focus{
      outline: none;
    } 
    .update-mini-btn{
      display: inline;
      width: 30%;
      padding: 12px 6px 9px 6px;
    }
    .form-control:focus {
      border-color: #66e992;
      outline: 0;
      -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 233, 152, 0.6);
      box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 233, 130, 0.6);
    }
    .user-btn-half{
      display: inline;
      width: 49.3%;
    }
  </style>
  
  <section class="user-area user-bg">
    <div class="container user_container">
      <div class="row">
          <div class="col-lg-9 col-md-9 col-sm-12 user-text-bg user-text-area">
              <h3 align="center">회원정보수정</h3>
              <br/>
              <form name="userUpdateForm" action="userUpdateForm.user" method="post" id="userUpdateForm">
                <div class="form-group">
                  <input type="text" name="id" class="form-control" id="id">
                </div>
                <div class="form-group">
                  <input type="password" name="pw" class="form-control" id="password" placeholder="* PASSWORD (영 대/소문자, 숫자, 특수문자 3종류 이상 조합 6자 이상)" onkeyup="checkPw()">
                  <p id="checkPw"></p>
                </div>
                <div class="form-group">
                  <input type="password"  name="pwCheck" class="form-control" id="password-confrim" placeholder="* 비밀번호를 확인해주세요." onkeyup="matchCheckPw()">
                  <span id="matchCheckPw"></span>
                </div>
                <br/>
                <!--input2탭의 input-addon을 가져온다 -->
                <div class="form-group">
                  <input name="phoneNum1" class="form-control sel" placeholder="010" onKeyPress="return checkNum(event)" /> -
                  <input name="phoneNum2" class="form-control sel" placeholder="xxxx" onKeyPress="return checkNum(event)" /> -
                  <input name="phoneNum3" class="form-control sel" placeholder="xxxx" onKeyPress="return checkNum(event)" />
                  <br/>
                <p id="checkNum"></p>
                </div>
                <br/>                
                <div class="form-group">
                  <div class="form-group">
                    <input type="text" name="zip-code" class="form-control" id="zip-code" placeholder="우편번호" >
                    <button type="button" class="btn btn-lg btn-info update-mini-btn" name="addSearch" id="addSearch">주소찾기</button>
                  </div>
                  <input type="text" name="basicAddress" class="form-control" id="addr-basic" placeholder="기본주소" onkeyup="checkBaAdd()">
                </div>
                <div class="form-group">
                  <input type="text" name="detailAddress" class="form-control" id="addr-detail" placeholder="상세주소" onkeyup="checkDeAdd()">
                </div>
                <div class="form-group">
                  <button type="button" class="btn btn-lg btn-success user-btn-half" onclick="check()">회원정보수정</button>
                  <button type="button" class="btn btn-lg btn-info user-btn-half" onclick="location.href='mypage.user'">취소</button>
                </div>
                <hr class="user_line"/>
                <div class="form-group">
                  <button type="button" class="btn btn-lg update-mini-btn user-hide-btn" id="del-btn">회원탈퇴</button>
                  <button type="button" class="btn btn-lg del-btn">확인</button>
                  <input type="text" id="del-ok" class="form-control" placeholder="* PASSWORD" >
                </div>
              </form>
          </div>
      </div>
  </div>
</section>

<script>
	var chpw = false;
	var chpwma = false;
	
	function checkNum(e){
		var keyVal = event.keyCode;
		
        if(((keyVal >= 48) && (keyVal <= 57))){
          $("#checkNum").html("");
            return true;
        }
        else{
          $("#checkNum").html("숫자만 입력할 수 있습니다");
          $("#checkNum").css("color","red");
          return false;
        }
	}
	
	function checkPw(){
		var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[가-힣A-Za-z\d@$!%*#?&]{6,}$/;
		
		if(!pwReg.test($('#password').val())){
			$('#checkPw').html('비밀번호 (영 대/소문자, 숫자, 특수문자 3종류 이상 조합 6자 이상)여야 합니다.');
      $('#checkPw').css("color","red");
      $("#password").focus();
      chpw = false;
      return chpw;
		}else if(pwReg.test($("#password").val())) {
			$('#checkPw').html("");
      chpw = true;
      return chpw;
    }
	}
	
	function matchCheckPw(){
    if($('#password').val() == ""){
      chpwma = false;
      return chpwma;
    }else if($('#password').val() != $('#password-confrim').val()){
			$('#matchCheckPw').html('비밀번호가 다릅니다');
      $('#matchCheckPw').css("color","red");
      $("#password-confrim").focus();
      chpwma = false;
      return chpwma;
		}else if($('#password').val() == $('#password-confrim').val()){
      $('#matchCheckPw').html('비밀번호가  같습니다');
			$('#matchCheckPw').css("color","blue");
      chpwma = true;
      return chpwma;
		}
	}
	
	function check(){	
      if(checkPw()){
        if(matchCheckPw()){
          $("#userUpdateForm").submit();
        }else{
          $("#password-confrim").focus();
        }
      }else{
        $("#password").focus();
      }
  }
  
  $("#del-btn").click(function(){
    if($(this).hasClass("user-hide-btn")){
      $(".del-btn").show();
      $("#del-ok").show();
      $(".user-hide-btn").addClass("user-show-btn").removeClass("user-hide-btn");
    }else if($(this).hasClass("user-show-btn")){
      $(".del-btn").hide();
      $("#del-ok").hide();
      $(".user-show-btn").addClass("user-hide-btn").removeClass("user-show-btn");
    }
  })

</script>