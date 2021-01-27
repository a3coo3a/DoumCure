<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
html {
  scroll-behavior: smooth;
}
    
    <!-- 슬라이드 -->
    <section class="main_slider">
        <div id="carousel-main" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-main" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-main" data-slide-to="1"></li>
                <li data-target="#carousel-main" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="https://cdn.docdocdoc.co.kr/news/photo/202006/1081643_1139071_272.jpg" alt="...">

                </div>
                <div class="item">
                    <img src="http://dw.nemc.or.kr/nemcMonitoring/newdesign/img/main_img.png" alt="...">
                </div>
                <div class="item">
                    <img src="https://cdn.eroun.net/news/photo/202004/11126_33987_545.jpg" alt="...">
                </div>

            </div>

            <!-- Controls -->
            <!-- <a class="left carousel-control" href="#carousel-main" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-main" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a> -->
        </div>
    </section>

     <!-- 검색창 -->
    <section class="search-section" style="background-attachment:fixed">
        <div class="container">
            <div class="row search-div">
                <div class="col-md-12">
                    <h2>당신의 증상을 알려주세요</h2>
                    <h2>Let me know your symptoms</h2>
                </div>

            </div>
            <div class="row main-search-input">
                <form>
                    <div class="inner-form">
                        <div class="input-field first-wrap">
                            <div class="svg-wrapper">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                    <path
                                        d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z">
                                    </path>
                                </svg>
                            </div>
                            <input id="search" type="text" placeholder="What are you looking for?" />
                        </div>
                        <div class="input-field second-wrap">
                            <button class="btn-search" type="button">SEARCH</button>
                        </div>
                    </div>
                    <span class="info">ex. 두통, 복통, 멀미</span>
                </form>
            </div>
        </div>
    </section>

    <!-- 증상별 데이터 카운트 -->
    <section class="drug-count">
        <!-- 스크롤 애니메이션 처리 -->
        <div data-aos="fade-up" data-aos-duration="1000">

            <div class="container">
                <div class="row">
                    <!-- Head -->
                    <div class="col-md-2 col-lg-2 col-sm-12 count">
                        <div class="drug-text">
                            <!-- 추후 파라미터값 변경예정 -->
                            <strong class="number head">2721</strong>
                        </div>
                        <div class="text">
                            <span>Head</span>
                        </div>
                    </div>

                    <!-- nose -->
                    <div class="col-md-2 col-lg-2 col-sm-12 count">
                        <div class="drug-text">
                            <!-- 추후 파라미터값 변경예정 -->
                            <strong class="number nose">1452</strong>
                        </div>
                        <div class="text">
                            <span>Nose</span>
                        </div>
                    </div>

                    <!-- Stomach -->
                    <div class="col-md-2 col-lg-2 col-sm-12 count">
                        <div class="drug-text">
                            <!-- 추후 파라미터값 변경예정 -->
                            <strong class="number stomach">3224</strong>
                        </div>
                        <div class="drug-text">
                            <span>Stomach</span>
                        </div>
                    </div>

                    <!-- Muscle -->
                    <div class="col-md-2 col-lg-2 col-sm-12 count">
                        <div class="drug-text">
                            <!-- 추후 파라미터값 변경예정 -->
                            <strong class="number muscle">1196</strong>
                        </div>
                        <div class="text">
                            <span>Muscle</span>
                        </div>
                    </div>

                    <!-- Tooth -->
                    <div class="col-md-2 col-lg-2 col-sm-12 count">
                        <div class="drug-text">
                            <!-- 추후 파라미터값 변경예정 -->
                            <strong class="number tooth">4009</strong>
                        </div>
                        <div class="text">
                            <span>Tooth</span>
                        </div>
                    </div>

                    <!-- etc -->
                    <div class="col-md-2 col-lg-2 col-sm-12 count">
                        <div class="drug-text">
                            <!-- 추후 파라미터값 변경예정 -->
                            <strong class="number etc">95874</strong>
                        </div>
                        <div class="text">
                            <span>etc</span>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </section>

    <!-- 공지사항 보드(이미지보드) -->
    <section class="main-board">

        <div class="container">
            <div class="row main-board-list">

                <div data-aos="fade-up" data-aos-anchor-placement="bottom-bottom">
                    <div class="col-md-3 col-lg-3 col-xs-12">
                        <div class="main-list-small">
                            <div class="main-board-img">
                                <img src="${pageContext.request.contextPath }/resources/img/title_icon.png" alt="">
                            </div>
                            <div class="main-board-title">
                                <p>게시글 1</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div data-aos="fade-up" data-aos-anchor-placement="bottom-bottom">
                    <div class="col-md-3 col-lg-3 col-xs-12">
                        <div class="main-list-small">
                            <div class="main-board-img">
                                <img src="${pageContext.request.contextPath }/resources/img/title_icon.png" alt="">
                            </div>
                            <div class="main-board-title">
                                <p>게시글 2</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div data-aos="fade-up" data-aos-anchor-placement="bottom-bottom">
                    <div class="col-md-3 col-lg-3 col-xs-12">
                        <div class="main-list-small">
                            <div class="main-board-img">
                                <img src="${pageContext.request.contextPath }/resources/img/title_icon.png" alt="">
                            </div>
                            <div class="main-board-title">
                                <p>게시글 3</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div data-aos="fade-up" data-aos-anchor-placement="bottom-bottom">
                    <div class="col-md-3 col-lg-3 col-xs-12">
                        <div class=" main-list-small more" onclick="location.href = '${pageContext.request.contextPath }/board/bbsList'" style="cursor: pointer;"> 
                            <i class="fa fa-arrow-right" aria-hidden="true"> MORE</i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>

    <!-- 방문자 카운트 -->
    <section class="custom-count">
        <div data-aos="fade-up cus-count" data-aos-duration="1000">
            <div class="container-fluid cus-count">
                <div class="row ">
                    <!-- TODAY -->
                    <div class="col-md-4 col-lg-4 col-sm-12 count">
                        <div class="text">
                            <!-- 추후 파라미터값 변경예정 -->
                            <strong class="number today">${day }</strong>
                        </div>
                        <div class="text">
                            <span>TODAY</span>
                        </div>
                    </div>
                    <!-- TOTAL -->
                    <div class="col-md-4 col-lg-4 col-sm-12 count">
                        <div class="text">
                            <!-- 추후 파라미터값 변경예정 -->
                            <strong class="number total">${total }</strong>
                        </div>
                        <div class="text">
                            <span>TOTAL</span>
                        </div>
                    </div>
                    <!-- DATA COUNT -->
                    <div class="col-md-4 col-lg-4 col-sm-12 count">
                        <div class="text">
                            <!-- 추후 파라미터값 변경예정 -->
                            <strong class="number data-count">657856</strong>
                        </div>
                        <div class="text">
                            <span>DATA COUNT</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
	
	<div id = "about"></div>
    <!-- 소배너 -->
    <section class="ben">
        <span>COMMENT</span>
        <div data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine">
            <div class="container comment-top">
                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="benner-list">
                            <li class="ben-img">
                                <img src="${pageContext.request.contextPath }/resources/img/main/imoge_young.png" alt="">
                            </li>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-6 comment-div">
                        <div class="benner-list">
                            <span class="comment-title">Young</span>
                            <p class="comment-content">
                            <br/>
                            오늘도 건강하신가요? <br/>
                            언제나 건강한 오늘과 내일을 바래 봅니다.<br/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine">
            <div class="container comment-top">
                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="benner-list">
                            <li class="ben-img">
                                <img src="${pageContext.request.contextPath }/resources/img/main/imoge_rin.png" alt="">
                            </li>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-6 comment-div">
                        <div class="benner-list">
                            <span class="comment-title">Rin</span>
                            <p class="comment-content">
                                	안녕하십니까 ?</br>
                                	코로나가 끝나지 않은 이 시기에 <br/>
                                	작은 증상으로 병원가기도 불안불안😥<br/> 
                                	저희 사이트가 작고 예쁜 사이트가 도움이 되었으면 좋겠네요<br/>
                                	여러모로 아쉬운 것이 많은 디자인이지만 이쁘게 봐주시길 바라고 있어요  😘   <br/>
                                	3명이서 정말정말 열심히 했다구요 👩‍💻👩‍💻👩‍💻                   
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine">
            <div class="container comment-top">
                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="benner-list">
                            <li class="ben-img">
                                <img src="${pageContext.request.contextPath }/resources/img/main/imoge_ohso.png" alt="">
                            </li>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-6 comment-div">
                        <div class="benner-list">
                            <span class="comment-title">Ohso</span>
                            <p class="comment-content">
                            안녕하세요 ?<br>
                                	저는 만성 알레르기라 시도 때도 없이 콧물 재체기 간지러움을 동반해서 병원을 잘 갔었는데..<br> 
                                	이시에 병원가기 참 눈치보이더라구요(머쓱)<br> 
                                	급한데로 집에 있는 비상약을 챙겨먹는데 무슨 약인지도 모르겠고<br>
                                	타00놀 먹으면 될려나 할수도 있지만 <br>
                                	간지러움을 줄여주는 역할은 하지 않죠;ㅅ;<br>
                                	이런 증상에 맞는 약인지 알려주면 웹사이트 입니다. <br>
                                	아무래도 절 위한 사이트 같아요 :D <br>
                                	열심히만들었으니 이용해주세요~<br>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    


<script>
	function more() {
		location.href = "${pageContext.request.contextPath }/board/bbsList";
	}

	function getCookie(name){
	    var cookies = document.cookie.split("; "); //쿠키자르기
	
	    //쿠키확인
	    for(var i in cookies){
	        if(cookies[i].search(name) != -1){ //쿠키를 탐색
	            return true;
	        }
	    }
	
	}
    
    $(document).ready(function () {

		//팝업띄우기
    	//mainpop쿠키가 없는 경우에 팝업창을 실행
        if(!getCookie("mainPop")){ //false -- 쿠키없음
            
            //open(팝업창경로, 이름, 옵션(문자열한줄로!))
        	var url = "${pageContext.request.contextPath }/popup";
            var name = "popup test";
            var option = "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width = 350px, height = 370px, top = 120px, left = 200";
            
            window.open(url, name, option);

        }


        //콤마작업
        function comma(str) {
            str = String(str);
            return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        }

        var d = document.querySelectorAll(".drug-text strong");
        var t = document.querySelectorAll(".text strong");
       //console.log(t);
        change_comma(d);
        change_comma(t);

        function change_comma(a) {

            for (var i = 0; i < a.length; i++) {
                var num = comma(a[i].innerHTML);
                a[i].innerHTML = num;
            }
        }



    });



</script>


<!-- 탈퇴시 성공 메시지 -->
<script>
var deleteMsg = "${deleteMsg}";
if(deleteMsg){
	alert("${deleteMsg}");
}
</script>

<script>
	$(".btn-search").click(function(){
		var search = $("#search").val();
		
		if(search === ""){
			alert("검색어를 입력해주세요");
		}else{
		console.log(search);
		location.href = "${pageContext.request.contextPath }/medi/mediList?mediSearchData="+search;	
		}
	})
</script>


    <!-- AOS 초기화 -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>

    