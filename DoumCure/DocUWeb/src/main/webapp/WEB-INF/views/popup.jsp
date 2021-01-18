<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>코로나 예방수칙을 지켜주세요</title>

    <!-- 개인 디자인 추가 -->
    <!-- <link rel="stylesheet" href="css/reset.css" /> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_header_footer.css" />
</head>

<style>
.pop-img img{
	cursor: default;
}
.pop-img a{
	
}
</style>

<body>
    <div class=" pop-img">
        <img src="https://www.cdc.go.kr/html/a2/namoimage/images/000018/200225_%EA%B5%AD%EB%AF%BC%EC%98%88%EB%B0%A9%ED%96%89%EB%8F%99%EC%88%98%EC%B9%99(%EC%B9%B4%EB%93%9C%EB%89%B4%EC%8A%A4)_1.png"
            alt="">
    </div>

    <div class="pop-btn">
        <input type="checkbox">
        <span>오늘 하루만 이 창을 닫습니다</span>
        <a class="popupClose" href="#">닫기 </a>
    </div>
    
    <script>
    var box = document.querySelector("input[type='checkbox']");
    var a = document.querySelector(".popupClose");
    
    box.onclick = function(){
        
        if(box.checked){ //체크O
            createCookie("mainPop");
            window.close(); //팝업창 종료
        }
    }
    
    function createCookie(name){
        var date = new Date();
        date.setDate( date.getDate() + 1 ); //1일 설정

        var cookie = "";
        cookie += name + "=true;"; //쿠키 이름, 값 설정
        cookie += "expires=" + date.toUTCString(); //시간설정

        document.cookie = cookie;
    }

    
    a.onclick = function() {
    	 window.close();
	}
    
    </script>

</body>

</html>