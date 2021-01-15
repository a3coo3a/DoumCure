<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <header>
        <script src="https://kit.fontawesome.com/bd2222aea4.js" crossorigin="anonymous"></script>
        <!-- sns -->
        <div class="container-fluid">
            <div class="row title-top">
                <div class="col-lg-6 col-md-6 col-xs-6 title">
                    <img src="img/title_icon.png" alt="title_icon">
                    <span>Do.cU(Cure yourself)</span>

                </div>

                <div class="col-lg-6 col-md-6 col-xs-6 sns">
                    <img src="img/main/kakao.png" alt="sns_kakao">
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-twitter"></i>
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

                    <img src="img/title_icon.png" alt="">
                    <a class="navbar-brand" href="#">Do.cU</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="#">HOME</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">BOARD
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">자유게시판</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">SEARCH
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">증상별 검색</a></li>
                                <li><a href="#">성분별 검색</a></li>
                            </ul>
                        </li>
                    </ul>

                    <!-- 창크기가 980미만으로 가면 2줄로 생기는 문제가 발생하여 검색창 생략

                        <form class="navbar-form navbar-left" action="/action_page.php">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                    -->
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">JOIN</a></li>
                        <li><a href="#">LOGIN</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- 사이드바 -->
        <div id="rightSide">
            <div id="right_zzim">
                <li class="seach-place">약국찾기</li>
                <li class="like">즐겨찾기</li>
                <li class="recTit">최근본약품</li>

                <!-- 데이터 지정 후 구현예정
                    <ul> --본 상품이 뿌려질 부분-- </ul>
        
                    <div id="paging"><a class="btn_prev" style="cursor:pointer">이전</a><span id="currentPage"></span><span
                            id="totalPageCount"></span><a class="btn_next" style="cursor:pointer">다음</a></div>
                    
                -->
            </div>
            <!-- top버튼(브라우저용) -->
            <div id="top-btn">
                <i class="fas fa-arrow-circle-up"></i>
                <li>TOP</li>
            </div>
        </div>

        <!-- top버튼(모바일용) -->
        <div id="top-btn-m">
            <i class="fas fa-arrow-circle-up"></i>
            <li>TOP</li>
        </div>

    </header>