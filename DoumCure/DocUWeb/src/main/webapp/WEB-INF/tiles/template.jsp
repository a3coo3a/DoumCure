<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Do.cU(Cure yourself)</title>

    <!-- 부트스크랩 참조파일 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <!-- 파비콘 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/title_icon.png">

    <!-- 개인 디자인 추가 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_header_footer.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style(addSearch).css" />
	<script src="${pageContext.request.contextPath }/resources/js/kakaoSDK.js"></script>

    <!-- AOS -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">  
    
    <!-- 카카오공유 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('fbb4d33c4d104dfee8ff11bced9882b7');

        // SDK 초기화 여부를 판단합니다.
        //console.log(Kakao.isInitialized());
    </script>
    
    <!-- 페이스북 공유 -->
    <!-- You can use Open Graph tags to customize link previews.
	Learn more: https://developers.facebook.com/docs/sharing/webmasters -->
	<meta property="og:url"           content="http://http://localhost:8282/docuweb/home" />
	<meta property="og:type"          content="website" />
	<meta property="og:title"         content="Do.cU(Cure yourself)" />
	<meta property="og:description"   content="증상에 맞는 약을 찾을때는 Do.cU !" />
	<meta property="og:image"         content="${pageContext.request.contextPath }/resources/img/title_icon.png" />

</head>

<body style="overflow-x:hidden; overflow-y:auto;">
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
</body>
</html>