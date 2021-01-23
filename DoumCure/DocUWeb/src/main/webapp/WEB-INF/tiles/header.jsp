<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
 

 <header>
        <script src="https://kit.fontawesome.com/bd2222aea4.js" crossorigin="anonymous"></script>
        <!-- sns -->
        <div class="container-fluid">
            <div class="row title-top">
                <div class="col-lg-6 col-md-6 col-xs-6 title">
                    <img src="${pageContext.request.contextPath }/resources/img/title_icon.png" alt="title_icon">
                    <span>Do.cU(Cure yourself)</span>

                </div>

                <div class="col-lg-6 col-md-6 col-xs-6 sns">
                    <img id="kakao" src="${pageContext.request.contextPath }/resources/img/main/kakao.png" style="cursor: pointer;">
                    <i class="fab fa-instagram insta"></i>
                    <i class="fab fa-twitter twitter"></i>
                </div>
            </div>
        </div>

        <!-- 네비바 -->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid nav-menu">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <img src="${pageContext.request.contextPath }/resources/img/title_icon.png" alt="">
                    <a class="navbar-brand" href="${pageContext.request.contextPath }">Do.cU</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath }">HOME</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">BOARD
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath }/board/bbsList">공지사항</a></li>
                                <li><a href="${pageContext.request.contextPath }/board/freeboardList">자유게시판</a></li>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath }/medi/mediSearch">SEARCH</a></li>
                    </ul>

                    <c:choose>
                    <c:when test="${sessionScope.userVO == null }">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${pageContext.request.contextPath }/user/join">JOIN</a></li>
                        <li><a href="${pageContext.request.contextPath }/user/login">LOGIN</a></li>
                    </ul>                    
                    </c:when>
                    <c:otherwise>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${pageContext.request.contextPath }/user/mypage">MYPAGE</a></li>
                        <li><a href="${pageContext.request.contextPath }/user/logout">LOGOUT</a></li>
                    </ul> 
                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>

        <!-- 사이드바 -->
        <div id="rightSide">
            <div id="right_zzim">
                <li class="seach-place" onclick="location.href = '${pageContext.request.contextPath }/medi/mediStore'" style="cursor: pointer;" >약국찾기</li>
                <li class="like">즐겨찾기</li>
               <!--  <li class="recTit">최근본약품</li> -->

                <c:choose>
				<c:when test="${sessionScope.userVO == null}">
                    <ul style="margin-top: 70%; text-align: center;"><a href=${pageContext.request.contextPath }/user/login>로그인 후<br/>이용가능합니다</a> </ul>
				
				</c:when>                
        		<c:otherwise>
	                <!-- 데이터 지정 후 구현예정-->
                    <ul>
                    	<li><img src=""></li>
                    	<li><img src=""></li>
                    	<li><img src=""></li>
                    </ul>
                            		
        		</c:otherwise>
                </c:choose>
                
            </div>
            <!-- top버튼(브라우저용) -->
            <div id="top-btn" style="cursor: pointer;" onclick="window.scrollTo(0,0);">
                <i class="fas fa-arrow-circle-up"></i>
                <li>TOP</li>
            </div>
        </div>

        <!-- top버튼(모바일용) -->
        <div id="top-btn-m" id="top-btn" style="cursor: pointer;" onclick="window.scrollTo(0,0);">
            <i class="fas fa-arrow-circle-up"></i>
            <li>TOP</li>
        </div>

    </header>


    