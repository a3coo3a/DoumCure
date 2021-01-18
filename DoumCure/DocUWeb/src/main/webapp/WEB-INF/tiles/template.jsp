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

    <!-- AOS -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">  

</head>

<body style="overflow-x:hidden; overflow-y:auto;">
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
</body>
</html>