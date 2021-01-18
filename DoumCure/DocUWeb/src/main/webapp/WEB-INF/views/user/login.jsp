<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 카카오 로그인  -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
                    <button type="button" class="btn btn-lg btn-block kakao-user-btn" id="custom-login-btn" onclick="location.href='javascript:loginWithKakao()'"><img src="${pageContext.request.contextPath }/resources/img/user/kakaolink_btn_small.png">카카오로그인</button>
                    <button type="button" class="btn btn-lg btn-block naver-user-btn"><img src="${pageContext.request.contextPath }/resources/img/user/navericon.PNG">네이버로그인</button>
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

<!-- 카카오로그인 -->
<script>
// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('8f675bbed4a924fcd1b82f8b844535d2');

// SDK 초기화 여부를 판단합니다.
//console.log(Kakao.isInitialized());   // 성공시 true
Kakao.isInitialized()

/* 3. 사용방법을 확인하고, 코드를 해석해서 로그인 가능 */
  function loginWithKakao() {
    Kakao.Auth.login({
      success: function(authObj) {  // 카카오계정을 통한 로그인성공시
        // 접근권한 - 어세스 토큰 저장
        Kakao.Auth.setAccessToken(authObj.access_token);

        /* 4. 사용자 계정 정보를 여는 함수를 호출 */
        getInfo();

      },
      fail: function(err) {  // 실패시 에러 메세지 출력
        alert(JSON.stringify(err))
      },
    })
  }

  // 4. 사용자 계정 정보 얻는 기능
  function getInfo(){
    Kakao.API.request({   // 해당함수가 다시한번 카카오 서버로 요청을 해서 필요한 사용자 정보르 콜백함수로 얻어옵니다.
      url: '/v2/user/me',
      success: function(res) {   // 성공시 얻어오는 사용자 정보
        //console.log(JSON.stringify(res));   // 문자열로 확인
        console.log(res);    // 제이슨으로 확인

        // 1. email 정보 추출
        //console.log(res.kakao_account.email);
        // 2. 프로필 이미지 추출
        //console.log(res.properties.profile_image);
        // 3. 닉네임
        //console.log(res.properties.nickname);
      },
      fail: function(error) {   // 실패시 에러 메세지 출력
        alert(
          'login success, but failed to request user information: ' +
            JSON.stringify(error)
        )
      },
    })
  }



</script>