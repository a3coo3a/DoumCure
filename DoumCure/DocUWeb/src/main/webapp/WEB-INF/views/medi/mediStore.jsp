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
    
    .map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap {position:relative;width:100%;height:350px;}
	#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
	#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
	#category li.on {background: #eee;}
	#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
	#category li:last-child{margin-right:0;border-right:0;}
	#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
	#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
	#category li .bank {background-position: -10px 0;}
	#category li .mart {background-position: -10px -36px;}
	#category li .pharmacy {background-position: -10px -72px;}
	#category li .oil {background-position: -10px -108px;}
	#category li .cafe {background-position: -10px -144px;}
	#category li .store {background-position: -10px -180px;}
	#category li.on .category_bg {background-position-x:-46px;}
	.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
	.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
	.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
	.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
	.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background:#41bf6d;background: #41bf6d url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.placeinfo .tel {color:#0f7833;}
	.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
    @media (min-width: 1281px) {
      #map{
        height: 600px;
      }
    }
    @media (min-width: 768px) and (max-width: 1280px) {
      #map{
        height: 500px;
      }
    }
    
    </style>
    
    <section class="medi-area">

  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
      	<div class="map_wrap">
        	<div id="map"></div>
	        	<ul id="category">
			        <li id="PM9" data-order="2"> 
			            <span class="category_bg pharmacy"></span>
			            약국
			        </li>  
			        <li id="CS2" data-order="5"> 
			            <span class="category_bg store"></span>
			            편의점
			        </li>      
			    </ul>
      	</div>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="medi-store-title">
          <h3>약국찾기<img src="${pageContext.request.contextPath }/resources/img/medi/medistoreicon.png" alt="약국아이콘"></h3>
        </div>    
        <div class="medi-sel-box">
          <div class="form-group">
            <select class="form-control sel-area " id="do">
              <option>지역</option>
              <option>서울</option>
              <option>경기</option>
              <option>충북</option>
            </select>
          </div>

          <div class="form-group">
            <select class="form-control sel-area" id="gu">
              <option>시/군/구</option>
              <option>서울</option>
              <option>경기</option>
              <option>충북</option>
            </select>
          </div>

          <div class="form-group">
            <select class="form-control sel-area" id="dong">
              <option>읍/면/동</option>
              <option>서울</option>
              <option>경기</option>
              <option>충북</option>
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

<!-- kakao map -->
<script>

	//*----------------지도검색변수 설정--------------------------------*//
	//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

 	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	
	//------------ 지도생성 ---------------------레벨 3,4권장-//
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	//지도를 생성할 때 필요한 기본 옵션
	var options = { 
	  center: new kakao.maps.LatLng(37.6420235483943, 126.633120448477), //지도의 중심좌표.
	  level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	//*----------------장소검색--------------------------------*//
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map); 
	
	// 지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchPlaces);
	
	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
	
	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();
	
	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
	    if (target.addEventListener) {
	        target.addEventListener(type, callback);
	    } else {
	        target.attachEvent('on' + type, callback);
	    }
	}
	
	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
		//console.log(currCategory); 현재 카테고리 분류코드
	    if (!currCategory) {
	        return;
	    }
	    
	    // 커스텀 오버레이를 숨깁니다 
	    placeOverlay.setMap(null);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	    	
	    	
	        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	        displayPlaces(data, pagination);
	        
	     	
	        
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
	    	$(".medi-store-result").html("<h4 class='store-name'>검색결과가 없습니다.</h4>")

	    } else if (status === kakao.maps.services.Status.ERROR) {
	        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
	        $(".medi-store-result").html("<h4 class='store-name'>서비스 에러입니다. 관리자에게 문의 하세요</h4>")
	    }
	}
	
	// 지도에 마커를 표출하는 함수입니다  : 마커 출력
	function displayPlaces(places, pagination) {
		
	    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
	    var order = document.getElementById(currCategory).getAttribute('data-order');	    
	   
	    for ( var i=0; i<places.length; i++ ) {
	    		//console.log(order);
				//console.log(places[i].y, places[i].x);
	            // 마커를 생성하고 지도에 표시합니다
	            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
	           
	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker, place) {
	                kakao.maps.event.addListener(marker, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker, places[i]);
	    			
	    			
	    		
	    		
	    }
	    var storeInfo = "";
	    for(var i = 0; i<(places.length<=5?places.length:5);i++){
	    	storeInfo += "<div class='medi-store'>";
			storeInfo += "<h4 class='store-name'><a href='" + places[i].place_url + "'>" + places[i].place_name + "</a></h4>";
			storeInfo += "<p>" + places[i].road_address_name + " (" + places[i].address_name + ") </p>";
			storeInfo += "<p>" + places[i].phone + "</p>";
			storeInfo += "</div>";
	    }
	    	
	    $(".medi-store-result").html(storeInfo);
	    
	    
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}	
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	function leftPlaceInfo(places, pagination){
		
		
		
		paginationSetting(places,'1', pagination.totalCount);
		
		$(".pager").click(function(e){
			
			paginationSetting(places, e.target.innerHTML, pagination.totalCount);	
			
		});
		
	}
	
	function paginationSetting(places, pageNum, total){
		var pageNum = pageNum;
		var endPage = Math.ceil(pageNum/5.0) * 5;
		var startPage = endPage - 5 + 1
		var realEnd = Math.ceil(total/5.0);
		
		if(endPage > realEnd) {
			endPage = realEnd;
		}
		
		if(startPage > 1){
			var prev = true;
		}
		if(realEnd > endPage){
			var next = true; 
		}
				
		var storeInfo = "";
		
		console.log(pageNum);
		console.log(places);
		
		for ( var i=(pageNum-1)*5; i<(pageNum == 1 && pageNum == realEnd? places.length : ((pageNum-1)*5)+4); i++ ) {
			console.log("i:"+i)
			console.log(places[i].place_url);
			storeInfo += "<div class='medi-store'>";
			storeInfo += "<h4 class='store-name'><a href='" + places[i].place_url + "'>" + places[i].place_name + "</a></h4>";
			storeInfo += "<p>" + places[i].road_address_name + " (" + places[i].address_name + ") </p>";
			storeInfo += "<p>" + places[i].phone + "</p>";
			storeInfo += "</div>";
		}
		
		$(".medi-store-result").html(storeInfo);
		
		
			var pageItem = '';
			
			for(var i = startPage; i <= realEnd; i++){
				if(prev){
					pageItem += '<li><button type="button"><span class="glyphicon glyphicon-chevron-left"></span></button></li>';
				}
				pageItem += '<li><button type="button">'+i+'</button></li>'
		        if(next){
		        	pageItem += '<li><button type="button"><span class="glyphicon glyphicon-chevron-right"></span></button></li>';
		        }
			}
			
	        $(".pager").html(pageItem);
		
	}
	
	
	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo (place) {
	    var content = '<div class="placeinfo">' +
	                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

	    if (place.road_address_name) {
	        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	    }  else {
	        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	    }                
	   
	    content += '    <span class="tel">' + place.phone + '</span>' + 
	                '</div>' + 
	                '<div class="after"></div>';

	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
	    placeOverlay.setMap(map);  
	}


	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
	    var category = document.getElementById('category'),
	        children = category.children;

	    for (var i=0; i<children.length; i++) {
	        children[i].onclick = onClickCategory;
	    }
	}

	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
	    var id = this.id,
	        className = this.className;

	    placeOverlay.setMap(null);

	    if (className === 'on') {
	        currCategory = '';
	        changeCategoryClass();
	        removeMarker();
	    } else {
	        currCategory = id;
	        changeCategoryClass(this);
	        searchPlaces();
	    }
	}
	
	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
	    var category = document.getElementById('category'),
	        children = category.children,
	        i;

	    for ( i=0; i<children.length; i++ ) {
	        children[i].className = '';
	    }

	    if (el) {
	        el.className = 'on';
	    } 
	} 
	//*---------------- my 지도검색--------------------------------*//
	
		// 키워드 검색
	 /* $.ajax({
           url:'https://dapi.kakao.com/v2/local/search/keyword.json?query='+encodeURIComponent('약국'),
           type:'GET',
           headers: {'Authorization' : 'KakaoAK 241d596b1328e91f453496968b0d69bf'},
		   success:function(data){
			   console.log("키워드 성공?")
		       console.log(data);
		   },
		   error : function(e){
			   console.log("키워드 실패?")
		       console.log(e);
		   }
		});
		// 카테고리 검색  (약국 - PM9, 편의점 - CS2, 병원 - HP8)
	 $.ajax({
         url:'https://dapi.kakao.com/v2/local/search/category.json?category_group_code='+encodeURIComponent('PM9')+'&radius='+encodeURIComponent('20000'),
         type:'GET',
         headers: {'Authorization' : 'KakaoAK 241d596b1328e91f453496968b0d69bf'},
		   success:function(data){
			   console.log("카테고리 성공?")
		       console.log(data);
		   },
		   error : function(e){
			   console.log("카테고리 실패?")
		       console.log(e);
		   }
		}); */
	
</script>