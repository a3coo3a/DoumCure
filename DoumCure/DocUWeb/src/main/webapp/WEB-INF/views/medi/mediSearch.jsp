<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    .seaech-detail-etc,
    .mediConfirm,
    .sendBtn1{
    	display : none;
    }
    .mediConfirm{
    	margin-right : 10px;
    	font-weight: bolder;
    	font-size : 16px;
    }
    </style>
    
    
    
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
                                    <span class="hash-name medi-left">기타</span>
                                </div>
                            </div>
                        
                        
                        <hr>
                        <!-- <span>그 외 증상은 검색을 이용해 주세요</span> -->
                        <div class="seaech-detail-etc">
                           <form action="mediList" method="post">
                            <p class="seaech-detail-etc-tit">OTHER</p>
                            <span class="mediConfirm"></span>
                            <button type="submit" class="btn btn-default sendBtn1">검색</button>
                            <input type="hidden" name="mediSearchData" class="mediSearchData">
                         
                                <div class="col-lg-10 col-md-10 col-sm-10 search-bar form-group">
                                <input type="text" class="form-control mediSearch" placeholder="그 외 증상은 검색을 이용해 주세요">
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 form-group">
                                    <button type="button" class="btn btn-default sendBtn2">확인</button>
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
            
            var head = ["두통","기침","콧물","여드름","발열","기타"];
            var body = ["변비", "위염", "장염", "소화불량", "속쓰림","기타"];
            var arm = ["염증","관절","타박상","멍","근육통","기타"];
            var leg = ["근육통","염증","저림","타박상","관절","기타"]

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
    
    
    <!-- db가져오기 -->
    <script>
    
    	$(".medi-info").click(mediSearch);
    	
    	$(".sendBtn2").click(function(){
    		$(".seaech-detail-etc-tit").hide();
			$(".mediConfirm").show();
			$(".sendBtn1").show();
			$(".mediSearch").hide();
			$(".sendBtn2").hide();
			$(".mediConfirm").html($(".mediSearch").val()).show();
			$(".mediSearchData").val($(".mediSearch").val());
    	});
    	
    
    	function mediSearch(event){    		
    		if(event.target.tagName == "SPAN"){
    			//console.log(event.target.innerHTML);
    			if(event.target.innerHTML == "기타"){		// 기타 누를때만 검색창이 나오게
    				$(".seaech-detail-etc").show();
    				$(".seaech-detail-etc-tit").show();
    				$(".mediConfirm").hide();
    				$(".sendBtn1").hide();
    				$(".mediSearch").show();
    				$(".sendBtn2").show();
    				$(".mediSearch").val("");
    			}else{
    				$(".seaech-detail-etc").show();
    				$(".seaech-detail-etc-tit").hide();
    				$(".mediConfirm").show();
    				$(".sendBtn1").show();
    				$(".mediSearch").hide();
    				$(".sendBtn2").hide();
    				$(".mediConfirm").html(event.target.innerHTML).show();
    				$(".mediSearchData").val(event.target.innerHTML);
    				$(".mediSearch").val("");
    				
    			}
    		}
    	}
    
    </script>
    
    