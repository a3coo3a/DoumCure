<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 네이버 로그인 -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "j81MALFzCvcyoXYbiyNa",
			
			isPopup: false,
			callbackHandle: true
			/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
		}
	);

	/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
	naverLogin.init();

	/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				var userId = naverLogin.user.getId();
				var userNickName = naverLogin.user.getName();
				if( userId == undefined || userId == null) {
					alert("아이디는 필수정보입니다. 정보제공을 동의해주세요.");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				}
				if( userNickName == undefined || userNickName == null) {
					alert("닉네임은 필수정보입니다. 정보제공을 동의해주세요.");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				}

				
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
</script>