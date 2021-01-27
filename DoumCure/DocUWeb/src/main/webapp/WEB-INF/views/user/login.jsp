<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 카카오 로그인  -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!-- 네이버 로그인 -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    
    <!-- 쿠키 다루는 라이브러리 -->
    <script src="${pageContext.request.contextPath }/resources/js/js.cookie.js"></script>
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
  
  .user-right{
	float : right;
	position: relative;
    top: 5px;
    right : 5px;
  }
  .form-group a{
  	color: rgba(0, 0, 0, 0.8);
    text-decoration: none;
  }
  #check {
  	color : red;
  }
  #naverIdLogin a {
  	display : block; 
  	width : 100%; 
  	height : 100%
  } 

  </style>
  
  <section class="user-bg user-area">
        <div class="container user_container">
          <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-12 user-text-bg user-text-area">
            	<div align="center" id="join-sccess">
            		<h2>
            			<span id="nickname_Y">${joinMsg.userNickName} 님, 환영합니다!</span>
            			<span id="nickname_N">가입을 축하드립니다! </span>
            			
            		</h2>
            		<img src="${pageContext.request.contextPath }/resources/img/user/welcome.png" alt="welcome">
            		<hr/>
            	</div>
            	
              <h4 align="center">로그인</h4>
              <br/>
              
              <form action="loginForm" method="post" id="loginForm">
              
              	<input type="hidden" name="userNickName" id="userNickName">
                <div class="form-group">
                  <input type="text" name="userId" class="form-control" id="userId" placeholder="ID" onkeyup="checkId()">
                </div>
                <div class="form-group">
                    <input type="password" name="userPw" class="form-control" id="userPw" placeholder="PASSWORD" onkeyup="checkPw()">
                </div> 
                <div class="form-group">
                  <input type="checkbox" id="idSaveCheck"> <label for="idSaveCheck">ID 기억하기</label> 
                  <!-- <a href='#' class="user-right">ID / PW찾기</a> -->
                </div> 
                <div class="form-group">
                    <p id="check">${msg }</p>
                    <button type="button" class="btn btn-lg user-btn btn-block" onclick="check()">로그인</button>
                    <button type="button" class="btn btn-lg user-join-btn btn-block" onclick="location.href='id_pwJoin'">회원가입</button>
                </div>
                <hr class="user_line">
                <div class="form-group" >
                    <button type="button" class="btn btn-lg btn-block kakao-user-btn" id="custom-login-btn" onclick="location.href='javascript:loginWithKakao()'"><img src="${pageContext.request.contextPath }/resources/img/user/kakaolink_btn_small.png">카카오로그인</button>               
                    
                   	<!-- 
                    <button type="button" class="btn btn-lg btn-block naver-user-btn" >
                    	<div id="naverIdLogin" style="position:relative; top:-3px;"></div>
                    	네이버로그인
                    </button>
                    -->
                </div>
                	
              </form>
              
              <form action="kakaoLoginForm" id="kakaoLoginForm">
              	<input type="hidden" id="kakaoId" name="kakaoId">
              	<input type="hidden" id="kakaoPw" name="kakaoPw">
              	<input type="hidden" id="kakaoNickName" name="kakaoNickName">
              </form>
            </div>
          </div>
        </div>
        
        
</section>

<!-- 가입실패시 메세지 -->
<script>
$(document).ready(function(){
	var joinMsg = '${joinMsg}';
	console.log(joinMsg.userNickName);
	if(joinMsg){
		if(joinMsg.userNickName === undefined){
			$("#nickname_Y").hide();
			$("#nickname_N").show();
		}else{
			$("#nickname_Y").show();
			$("#nickname_N").hide();
		}
		$("#join-sccess").show();
		$(".user-join-btn").hide();
		$(".user_line").hide();
		$(".kakao-user-btn").hide();
		$(".naver-user-btn").hide();	
	}else{
		$("#join-sccess").hide();
	}
})
</script>

<!-- id/pw 로그인 -->
<script>
	var chid = false;
	var chpw = false;
	
	function checkId(){
    var id = $("#userId").val().replace(/\s/gi, "");
		if( id.length <= 0){
      		//console.log(id.length);
      		$("#check").html('아이디를 입력해주세요');
      		chid = false;
		}else if(id.length > 0){
      		//console.log(id.length);
			$("#check").html("");
     		chid = true;
		}
	}
	
	function checkPw(){
		if($('#userPw').val() == ""){
			
			$('#check').html('비밀번호를 입력해주세요');
      		chpw = false;
		}else if($("#userPw").val() != "") {
			
			$('#check').html("");
      		chpw = true;
    	}
	}
	
	function check(){
    	checkId();
		if(chid){
      		checkPw();
    	}
		if(chid && chpw){
      		$("#loginForm").submit();
		}
	}
</script>

<!-- 아이디 기억하기 -->
<!-- https://gbsb.tistory.com/99 : 참고사이트-->
<script>
	$("#userId").val(Cookies.get('key'));   
	
	if($("#userId").val() != ""){   // 쿠키에서 꺼내온 아이디가 공백이 아니면 존재한다는 이야기 
    	$("#idSaveCheck").attr("checked", true);   // 체크박스를 체크드로 변경
	}
	
	$("#idSaveCheck").change(function(){
		if($("#idSaveCheck").is(":checked")){
		    Cookies.set('key', $("#userId").val());   // 아이디 기억하기가 체크되어 있다면 쿠키를 key라는 이름으로 세팅하여라
		}else{
		    Cookies.remove('key');  // 그렇지 않다면 (체크되어 있지 않다면) 쿠키의 key를 삭제하여라
		}
	});
	 
	$("#userId").keyup(function(){   // userId에 키를 떼었을때 ,
	if($("#idSaveCheck").is(":checked")){   //  아이디 기억하기가 체크되어 있다면
	    Cookies.set('key', $("#userId").val());   // key라는 이름으로 세팅하여라
	}
	});
</script>

<!-- 카카오로그인 -->
<script type="text/javascript">
//SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
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
		//console.log(Kakao.Auth.getAccessToken());  // 어세스 토큰 확인
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
        // console.log(JSON.stringify(res));   // 문자열로 확인
        //console.log(res);    // 제이슨으로 확인
        // id
        //console.log(res.id);
        // 닉네임
        //console.log(res.properties.nickname);
        
      	$("#kakaoId").val(res.id);
      	$("#kakaoPw").val(res.id);
      	$("#kakaoNickName").val(res.properties.nickname);
      	$("#kakaoLoginForm").submit();
        
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

<!-- 네이버 로그인 -->
<!-- 참고사이트 : https://m.blog.naver.com/PostView.nhn?blogId=yongyos&logNo=221542684624&proxyReferer=https:%2F%2Fwww.google.com%2F -->
<!-- <script type="text/javascript">
	// 버튼을 클릭해서 팝업창이 뜨게 설정
	$(".naver-user-btn").click(function(){
		$("#naverIdLogin")[0].children[0].click();
	})
	
	


	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "j81MALFzCvcyoXYbiyNa",
			callbackUrl: "naver-callback",
			isPopup: true, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 1, height: 40}
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
	
	
	</script> -->