<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<!-- 카카오지도 로드 -->
  	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f675bbed4a924fcd1b82f8b844535d2&libraries=services"></script>
    
  <!-- mediStore css -->
  <style>
    /* medistore css */
    .form-group{
      display: inline;
    }
    .sel-area{
      width: 30%;
      height: 30px;
      font-size: 12px;
      display: inline;
    }
    .medi-sel-box{
      margin-bottom: 10px;
    }
    .medi-search-size{
      width: 80%;
      height: 30px;
      font-size: 12px;
      display: inline;
    }
    .medi-search-btn{
      height: 30px;
      font-size: 12px;
      position: relative;
      top: -3px;
    }
    .medi-store-title img{
      width: 25px;
      margin-left: 10px;
      position: relative;
      top: -4px;
    }
    .store-name{
      font-weight: bolder;
    }
    .medi-store{
      margin: 20px;
      border-bottom: 1px solid #dddddd;
    }
    .medi-store p {
      margin-bottom: 0;
    }
    .medi-store a{
      color:  rgba(0, 0, 0, 0.8);
    }
    .medi-store a:hover{
      color : ;
    }
    .pager li>button, .pager li>span {
      border: none;
      border-radius : 100%;
      padding: 5px 10px;
      color:  rgba(0, 0, 0, 0.8);
    }
    .pager li>button:focus, .pager li>button:hover{
      background-color: #66e992;
      color: #fff;
    }
    
    /*카카오 지도 css*/
    #map{
      width: 100%;
      height: 400px;
      margin: 0 auto;
    }
   
    
    </style>
    
    <section class="medi-area">

  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
      	<div class="map_wrap">
        	<div id="map"></div>
      	</div>
      </div>
      
      
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="medi-store-title">
          <h3>약국찾기<img src="${pageContext.request.contextPath }/resources/img/medi/medistoreicon.png" alt="약국아이콘"></h3>
        </div>    
        <div class="medi-sel-box">
          <div class="form-group">
            <select class="form-control sel-area " id="si" style="text-align: center">
            </select>
            
          </div>

          <div class="form-group">
            <select class="form-control sel-area" id="gu">
			<option>- 시, 군, 구 -</option>
            </select>
          </div>

          <div class="form-group">
            <select class="form-control sel-area" id="ro">
			<option>- 길, 로 -</option>
            </select>
          </div>

        </div>  <!--sel-box end-->
  
        <div>
          <input type="text" class="form-control medi-search-size" placeholder="약국명으로 검색하세요">    
          <button type="button" class="btn medi-search-btn"><span class="glyphicon glyphicon-search"></span></button>
        </div>

        <hr>

        <!-- 검색후 나오는 매장 데이터 -->
        <div class="medi-store-result">
	        
        </div>
        
        <!-- 페이지네이션 -->
      <!-- <ul class="pager">
        <li><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
        <li><a href="#">1</a></li>
        <li class="active"><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
      </ul> -->
      
       <ul class="pager">
        
      </ul>
      
      </div>  <!--오른쪽end-->
    </div>
  </div>





</section>

<script>
	function createSi(){
	    var si_list = new Array("경기", "강원", "경남", "경북", "광주",
	                            "대구", "대전", "부산", "서울", "세종시",
	                            "울산", "인천", "전남", "전북", "제주", "충남", "충북");
	    si_list.sort(); //정렬
	    si_list.unshift("- 시, 도 -"); //앞에 추가
	
	    var si = document.querySelector("#si")
	    for(var i in si_list){
	        var option = document.createElement("option"); //option엘리먼트 생성
	        option.innerHTML = si_list[i]; //엘리먼트에 문자추가
	
	        si.appendChild(option); //자식으로 추가
	    }
	};
	
	//즉시실행
	(function(){
        createSi();
    })();

	
	//변경에 따른 출력
	$("#si").change(getGu); //시 -> 구변경
	$("#gu").change(getRo); //구 -> 로변경
	
	
	
	function getGu() {

		var si = $("#si").val();
	
		$.ajax({
			url: "mediStore/getGu",
			type: "POST",
			dataType: "json",
			data: "siname="+si,
			success: function(data){
				
			    var gu = document.querySelector("#gu")
				var gu_list = new Array();
				//옵션제거
				$("#gu option").remove();
			    //배열에 데이터요소 추가
				for(var i in data.gu){
					gu_list.push(data.gu[i]);
				}
				
				//옵션추가
				gu_list.sort(); //정렬
			    gu_list.unshift("- 시, 군, 구 -"); //앞에 추가
			
			    for(var i in gu_list){
			        var option = document.createElement("option"); //option엘리먼트 생성
			        option.innerHTML = gu_list[i]; //엘리먼트에 문자추가
			
			        gu.appendChild(option); //자식으로 추가
			    }
			},
			error: function (error){
				alert(error);
			}
			});

	}
	
	function getRo() {

		var gu = $("#gu").val();

		$.ajax({
			url: "mediStore/getRo",
			type: "POST",
			dataType: "json",
			data: "guname="+gu,
			success: function(data){
				
			    var ro = document.querySelector("#ro")
				var ro_list = new Array();
				//옵션제거
				$("#ro option").remove();
			    //배열에 데이터요소 추가
				for(var i in data.ro){
					ro_list.push(data.ro[i]);
				}
				
				//옵션추가
				ro_list.sort(); //정렬
			    ro_list.unshift("- 길, 로 -"); //앞에 추가
			
			    for(var i in ro_list){
			        var option = document.createElement("option"); //option엘리먼트 생성
			        option.innerHTML = ro_list[i]; //엘리먼트에 문자추가
			
			        ro.appendChild(option); //자식으로 추가
			    }
			},
			error: function (error){
				alert(error);
			}
		});

	}
	
</script>


<script>

	/* 접속자 현재위치정보 생성 */
	$(document).ready(function() {
        
        function myPosition() {
            navigator.geolocation.getCurrentPosition(success, fail);
        }
        
        function success() {
            const lat = position.coords.latitude;
            const lng = position.coords.longitude;
            console.log(lat, lng);
        }

        function fail() {
            alert("내 위치가 전송되지 못했습니다");
            return;
        }
		
		mapinit(lat, lng);
		
		/* 카카오 지도생성 */
		function mapinit() {
			console.log(lat);
			console.log(lng);
			
		}
	});

	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>
