<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- join css -->
  <style>
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

    .form-control[name=userId],
    .form-control[name=userAddrZipNum]{
      display: inline;
      width: 60%;
    }
    .form-group > .sel {
        width: 30%;
        display: inline-block;
        box-sizing: border-box;
    }
    .mini-btn{
      display: inline;
      width: 30%;
      margin-left: 10px;
      font-size: 12px;
      padding: 12px 6px 9px 6px;
    }
    .form-control:focus {
      border-color: #66e992;
      outline: 0;
      -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 233, 152, 0.6);
      box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 233, 130, 0.6);
  }
  </style>
  

<section class="user-area user-bg">
  <div class="container user_container">
    <div class="row">
        <div class="col-lg-9 col-md-9 col-sm-12 user-text-bg user-text-area">
            <h2 align="center">회원가입</h2>
            <br/>
            <form name="joinForm" action="joinForm" method="post" id="joinForm">
              <div class="form-group">
                <input type="text" name="userId" class="form-control" id="userId" placeholder="* ID (영문포함 4자 이상)" onkeyup="checkId()">
                <button type="button" class="btn btn-lg btn-info mini-btn" name="idCheck" id="idCheck">ID중복확인</button>
                <p id="checkIdMsg"></p>
              </div>
                <div class="form-group">
                    <input type="password" name="userPw" class="form-control" id="userPw" placeholder="* PASSWORD (영 대/소문자, 숫자 조합 6자 이상)" onkeyup="checkPw()">
                  <p id="checkPwMsg"></p>
                </div>
                <div class="form-group">
                    
                    <input type="password"  name="pwCheck" class="form-control" id="password-confrim" placeholder="* 비밀번호를 확인해주세요." onkeyup="matchCheckPw()">
                    <span id="matchCheckPw"></span>
                </div>
                <br/>
                <div class="form-group">
                    <input type="text" name="userNickName" class="form-control" id="userNickName" placeholder="NickName을 적어주세요" >
                  <p id="checkPwMsg"></p>
                </div>
                <div class="form-group">
                      <input type="hidden" name="userPhoneNum" id="userPhoneNum">
                      <input name="phoneNum1" class="form-control sel" placeholder="010" onKeyPress="return checkNum(event)" > -
                      <input name="phoneNum2" class="form-control sel" placeholder="xxxx" onKeyPress="return checkNum(event)" > -
                      <input name="phoneNum3" class="form-control sel" placeholder="xxxx" onKeyPress="return checkNum(event)" >
                    <br/>
                <p id="checkNum"></p>
                </div>
                <br/>                
                <div class="form-group">
                    <div class="form-group">
                      <input type="text" name="userAddrZipNum" class="form-control" id="userAddrZipNum" placeholder="우편번호" readonly>
                      <button type="button" class="btn btn-lg btn-info mini-btn" name="addSearch" id="addSearch" onclick="goPopup()">주소찾기</button>
                    </div>
                    <input type="text" name="userAddrBasic" class="form-control" id="userAddrBasic" placeholder="기본주소">
                </div>
                <div class="form-group">
                    <input type="text" name="userAddrDetailL" class="form-control" id="userAddrDetailL" placeholder="상세주소">
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-lg btn-success btn-block" onclick="check()">회원가입</button>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-lg btn-info btn-block" onclick="location.href='login'">로그인</button>
                </div>
            </form>
        </div>
    </div>
</div>

</section>

<!-- id 중복확인 서밋 -->
<script>

$("#idCheck").click(function(){
	if($("#userId").val() === ''){
		alert("아이디를 작성해 주세요");
		$("#userId").focus();
		return;
	}
	
	var userId = $("#userId").val();
	$.ajax({
		type : "POST",
		url : "idCheck",
		data : JSON.stringify({"userId":userId}),
		contentType : "application/json; charset=utf-8",
		success : function(data){
			if( data === 0){
				$("#idCheck").hide();
				$("#checkIdMsg").css("color","blue");
				$("#checkIdMsg").html("사용가능한 아이디 입니다.");
				
			}else{
				$("#checkIdMsg").html("존재하는 아이디 입니다.");
				$("#userId").focus();
			}
		},
		error : function(status, error){
			console.log("상태 : " + status);
			console.log("에러 : " + error)
		}
	});   // ajax end
	
	
})


</script>

<!-- 주소찾기 -->
<script>
	function goPopup(){
		var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 콜백으로 받아온 데이터를 가입폼에 입력
		$("#userAddrZipNum").val(zipNo);
		$("#userAddrBasic").val(roadAddrPart1);
		$("#userAddrDetail").val(addrDetail);
		
	}
</script>
   
   
<!-- 가입실패시 메세지 -->
<script>
$(document).ready(function(){
	var joinMsg = '${joinMsg}';
	if(joinMsg){
		alert(joinMsg);
	}
})
</script>

<!-- 작성확인 및 서밋 -->
<script>
	var chid = false;
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
	
	function checkId(){
		var idReg = /^(?=.*[A-Za-z])[가-힣A-Za-z0-9]{4,}$/;
		
		$("#idCheck").show();
		if(!idReg.test($("#userId").val())){
	      $("#checkIdMsg").html("아이디는 (영문포함 4자 이상)이어야 합니다.")
	      $("#checkIdMsg").css("color","red");
	      $("#userId").focus();
	      chid = false;
	      return chid;
		}else if(idReg.test($("#userId").val())){
		  $("#checkIdMsg").html("");
	      chid = true;
	      return chid;
		}
	}
	
	function checkPw(){
		var pwReg = /^(?=.*[A-Za-z])(?=.*\d)[가-힣A-Za-z\d@$!%*#?&]{6,}$/;
		
		if(!pwReg.test($('#userPw').val())){
		  $('#checkPw').html('비밀번호 (영 대/소문자, 숫자 조합 6자 이상)여야 합니다.');
	      $('#checkPwMsg').css("color","red");
	      $("#userPw").focus();
	      chpw = false;
      return chpw;
		}else if(pwReg.test($("#userPw").val())) {
			$('#checkPwMsg').html("");
	      chpw = true;
	      return chpw;
   	 	}
	}
	
	function matchCheckPw(){
	    if($('#userPw').val() == ""){
	      chpwma = false;
	      return chpwma;
	    }else if($('#userPw').val() != $('#password-confrim').val()){
			  $('#matchCheckPw').html('비밀번호가 다릅니다');
		      $('#matchCheckPw').css("color","red");
		      $("#password-confrim").focus();
		      chpwma = false;
		      return chpwma;
		}else if($('#userPw').val() == $('#password-confrim').val()){
	     	  $('#matchCheckPw').html('비밀번호가  같습니다');
		  $('#matchCheckPw').css("color","blue");
	      chpwma = true;
	      return chpwma;
		}
	}
	
	function check(){
	
       	$("#userPhoneNum").val($(".sel[name=phoneNum1]").val() + "-" + $(".sel[name=phoneNum2]").val() + "-" + $(".sel[name=phoneNum3]").val());
       console.log(	$("#idCheck").css("display") )
       	if($("#idCheck").css("display") !== "none"){
       		alert("아이디 중복확인은 필수 입니다.");
       		$("#userId").focus();
       		return;
       	}
       	
		if(checkId()){
	      if(checkPw()){
	        if(matchCheckPw()){
	          $("#joinForm").submit();
	        }else{
	          $("#password-confrim").focus();
	        }
	      }else{
	        $("#userPw").focus();
	      }
	    }else{
	      $("#userId").focus();
	    }
	}
</script>