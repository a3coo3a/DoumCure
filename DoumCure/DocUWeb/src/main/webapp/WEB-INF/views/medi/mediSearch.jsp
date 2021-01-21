<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <section class="medi-area">
        <strong>증상별 검색</strong>
        <hr>
    
        <div class="container">
            <div class="row justify-content-center line">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 line-left">
                    <p>부위를 선택해주세요</p>
                    <img src="${pageContext.request.contextPath }/resources/img/medi/human-all.png" alt="" usemap="#imgmap" id="human">
                    <!-- 이미지맵 -->
                    <map id="imgmap" name="imgmap">
                        <area shape="circle" coords="140,106,26" onfocus="this.blur()" class="search-head" onmouseover="if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-head.png'" onmouseout = "if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-all.png' "  />
                        <area shape="rect" coords="109,146,171,269" onfocus="this.blur()" class="search-body" onmouseover="if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-body.png'" onmouseout = "if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-all.png' " />
                        <area shape="rect" coords="78,146,100,268"  onfocus="this.blur()" class="search-arm" onmouseover="if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-arm.png'" onmouseout = "if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-all.png' " />
                        <area shape="rect" coords="179,146,202,268" onfocus="this.blur()" class="search-arm"onmouseover="if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-arm.png'" onmouseout = "if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-all.png' " />
                        <area shape="rect" coords="108,292,136,400" onfocus="this.blur()" class="search-leg" onmouseover="if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-leg.png'" onmouseout = "if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-all.png' " />
                        <area shape="rect" coords="146,293,172,401" onfocus="this.blur()" class="search-leg" onmouseover="if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-leg.png'" onmouseout = "if(document.images) human.src = '${pageContext.request.contextPath }/resources/img/medi/human-all.png' " />
                        <!-- Created by Online Image Map Editor (http://www.maschek.hu/imagemap/index) -->
                    </map>
                </div>

                
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 line-right" >
                    <div class="search-detail-default">
                        <span>부위를 선택해 주세요 :)</span>
                    </div>
                    <div class="search-detail-view">
                        <div class="search-detail">
                            <img src="${pageContext.request.contextPath }/resources/img/medi/detail3.png" alt="">
                        </div>
                        <p>주요 증상</p>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 medi-info">
                                <div class="medi-hash-center">
                                    <span class="hash-name medi-left">두통</span>
                                    <span class="hash-name medi-left">기침</span>
                                    <span class="hash-name medi-left">여드름</span>
                                    <span class="hash-name medi-left">콧물</span>
                                    <span class="hash-name medi-left">미열</span>
                                </div>
                            </div>
                        
                        
                        <hr>
                        <!-- <span>그 외 증상은 검색을 이용해 주세요</span> -->
                        <div class="seaech-detail-etc">
                            <p>OTHER</p>
                            <form>
                                <div class="col-lg-10 col-md-10 col-sm-10 search-bar form-group">
                                <input type="text" class="form-control" placeholder="그 외 증상은 검색을 이용해 주세요">
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 form-group">
                                    <button type="submit" class="btn btn-default">확인</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </section>
    
    <script src="${pageContext.request.contextPath }/resources/js/jquery.rwdImageMaps.js"></script>
    <script>
        $(document).ready(function(e){
            $("img[usemap]").rwdImageMaps();
        })
    </script>

    <!-- Search script -->
    <script>
        $(document).ready(function(){
            var map = document.querySelector("#imgmap");
            var detail = $(".search-detail")[0].childNodes[1];
            var hash = document.querySelectorAll(".hash-name");
            
            var head = ["두통","기침","콧물","여드름","발열"];
            var body = ["변비", "위염", "장염", "소화불량", "속쓰림"];
            var arm = ["염증","관절","타박상","멍","근육통"];
            var leg = ["근육통","염증","저림","타박상","관절"]

            map.addEventListener("click", function(){
                $(".search-detail-view").css('display','block');
                $(".search-detail-default").css('display', 'none');

                
                var classList = event.target.classList
                if(classList.value === "search-head"){
                    detail.src = "${pageContext.request.contextPath }/resources/img/medi/detail3.png"
                    for(var i in hash){
                        hash[i].innerHTML = head[i];
                    }
                }else if(classList.value === "search-arm"){
                    detail.src = "${pageContext.request.contextPath }/resources/img/medi/detail1.png"
                    for(var i in hash){
                        hash[i].innerHTML = arm[i];
                    }
                }else if(classList.value === "search-body"){
                    detail.src = "${pageContext.request.contextPath }/resources/img/medi/detail4.png"
                    for(var i in hash){
                        hash[i].innerHTML = body[i];
                    }
                }else if(classList.value === "search-leg"){
                    detail.src = "${pageContext.request.contextPath }/resources/img/medi/detail2.png"
                    for(var i in hash){
                        hash[i].innerHTML = leg[i];
                    }
                }



            })



        })
    </script>
    
    
    <!-- 데이터 가져오기 -->
    <script>
    /* 참고사이트
    	http://www.tcpschool.com/ajax/ajax_server_response
    	https://www.w3schools.com/xml/xml_http.asp
    	
    	onreadystatechange 상태의 의미
    	readyState 프로퍼티
    	 1. UNSENT (숫자 0) : XMLHttpRequest 객체가 생성됨.
	   	 2. OPENED (숫자 1) : open() 메소드가 성공적으로 실행됨.
    	 3. HEADERS_RECEIVED (숫자 2) : 모든 요청에 대한 응답이 도착함.
    	 4. LOADING (숫자 3) : 요청한 데이터를 처리 중임.
    	 5. DONE (숫자 4) : 요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨.
    	status 프로퍼티
    	 - 200 : 서버에 문서가 존재함.
    	 - 404 : 서버에 문서가 존재하지 않음.
    	
    */
    
    // 클릭할때마다 아래 실행될수 있게 작성
    // 요청
    var xhttp = new XMLHttpRequest();   // 객체생성
    xhttp.onreadystatechange = function() {     // onreadystatechange : readyState 프로퍼티 값이 변할때마다 자동 호출, 총 5번 호출, 응답의 도착순간을 특정할 수 있음.
        if (this.readyState == 4 && this.status == 200) {
           // Typical action to be performed when the document is ready:
           document.getElementById("demo").innerHTML = xhttp.responseText;     //responseText : 텍스트 문자열로 반환
        }
    };
    xhttp.open("GET", "filename", true);
    xhttp.send();  
    
    
    // 응답
    xmlDoc = xhttp.responseXML;
	txt = "";
	x = xmlDoc.getElementsByTagName("ARTIST");
	for (i = 0; i < x.length; i++) {
	  txt += x[i].childNodes[0].nodeValue + "<br>";
	  }
	document.getElementById("demo").innerHTML = txt;
	xhttp.open("GET", "cd_catalog.xml", true);
	xhttp.send();
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	
	</script>
    