<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 카카오지도 로드 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f675bbed4a924fcd1b82f8b844535d2&libraries=services"></script>

<!-- mediStore css -->
<style>
/* medistore css */
.form-group {
	display: inline;
}

.sel-area {
	width: 30%;
	height: 30px;
	font-size: 12px;
	display: inline;
}

.medi-sel-box {
	margin-bottom: 10px;
}

.medi-search-size {
	width: 80%;
	height: 30px;
	font-size: 12px;
	display: inline;
}

.medi-search-btn {
	height: 30px;
	font-size: 12px;
	position: relative;
	top: -3px;
}

.medi-store-title img {
	width: 25px;
	margin-left: 10px;
	position: relative;
	top: -4px;
}


.medi-store {
	margin: 20px;
	border-bottom: 1px solid #dddddd;
}

.medi-store p {
	margin-bottom: 0;
}

.medi-store a {
	color: rgba(0, 0, 0, 0.8);
}

.medi-store a:hover {
	color:;
}

.medi-store-result {
	height: 320px;
	overflow-x:hidden;
}

.storeName {
	font-weight: bolder;
	font-size: 25px;
	padding: 5px
}

.storeName span{
	cursor: pointer;
}

/*카카오 지도 css*/
#map {
	width: 100%;
	height: 500px;
	margin: 0 auto;
}

.wrap {position: absolute;left: 0;bottom: 40px;width: 200px;height: 132px;margin-left: -98px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 200px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;white-space: normal;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 35px;background: #41bf6d;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold; color: white;}
    .info .close {position: absolute;top: 10px;right: 20px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .ellipsis {overflow: hidden;text-overflow: ellipsis; padding: 5px;}
    .jibun {font-size: 11px;color: #888;margin-top: -2px;padding: 5px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}

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
					<h3>
						약국찾기<img
							src="${pageContext.request.contextPath }/resources/img/medi/medistoreicon.png"
							alt="약국아이콘">
					</h3>
				</div>
				<div class="medi-sel-box">
					<div class="form-group">
						<select class="form-control sel-area " id="si"
							style="text-align: center">
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

				</div>
				<!--sel-box end-->

				<div>
					<input type="text" class="form-control medi-search-size"
						placeholder="약국명으로 검색하세요">
					<button type="button" class="btn medi-search-btn">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</div>

				<hr>

				<!-- 검색후 나오는 매장 데이터 -->
				<div class="medi-store-result"></div>

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

			</div>
			<!--오른쪽end-->
		</div>
	</div>





</section>

<script>
	function createSi() {
		var si_list = new Array("경기", "강원", "경남", "경북", "광주", "대구", "대전", "부산",
				"서울", "세종시", "울산", "인천", "전남", "전북", "제주", "충남", "충북");
		si_list.sort(); //정렬
		si_list.unshift("- 시, 도 -"); //앞에 추가

		var si = document.querySelector("#si")
		for ( var i in si_list) {
			var option = document.createElement("option"); //option엘리먼트 생성
			option.innerHTML = si_list[i]; //엘리먼트에 문자추가

			si.appendChild(option); //자식으로 추가
			
		}
	};

	//즉시실행
	(function() {
		createSi();
	})();

	//변경에 따른 출력
	$("#si").change(getGu); //시 -> 구변경
	$("#gu").change(getRo); //구 -> 로변경

	function getGu() {

		var si = $("#si").val();

		if(si === "- 시, 도 -"){
			$("#gu").val("- 시, 군, 구 -");
			$("#ro").val("- 길, 로 -");
			basicloca();
			setCenter();
			$(".medi-store-result").html("");
			setMarkers(null);	
			return;
		}
		
		$.ajax({
			url : "mediStore/getGu",
			type : "POST",
			dataType : "json",
			data : "siname=" + si,
			success : function(data) {
				var gu = document.querySelector("#gu")
				var gu_list = new Array();
				//옵션제거
				$("#gu option").remove();
				//배열에 데이터요소 추가
				for ( var i in data.gu) {
					gu_list.push(data.gu[i]);
				}

				//옵션추가
				gu_list.sort(); //정렬
				gu_list.unshift("- 시, 군, 구 -"); //앞에 추가

				for ( var i in gu_list) {
					var option = document.createElement("option"); //option엘리먼트 생성
					option.innerHTML = gu_list[i]; //엘리먼트에 문자추가

					gu.appendChild(option); //자식으로 추가
				}
			},
			error : function(error) {
				alert(error);
			}
		});

	}

	function getRo() {

		var si = $("#si").val();
		var gu = $("#gu").val();
		
		

		$.ajax({
			url : "mediStore/getRo",
			type : "POST",
			data : JSON.stringify({
				"si" : si,
				"gu" : gu
			}),
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				var ro = document.querySelector("#ro")
				var ro_list = new Array();
				//옵션제거
				$("#ro option").remove();
				//배열에 데이터요소 추가
				for ( var i in data.ro) {
					ro_list.push(data.ro[i]);
				}

				//옵션추가
				ro_list.sort(); //정렬
				ro_list.unshift("- 길, 로 -"); //앞에 추가

				for ( var i in ro_list) {
					var option = document.createElement("option"); //option엘리먼트 생성
					option.innerHTML = ro_list[i]; //엘리먼트에 문자추가

					ro.appendChild(option); //자식으로 추가
				}
			},
			error : function(error) {
				alert(error);
			}
		});

	}
</script>




<!-- 지도생성 -->
<script>
	
	var lat; //y좌표
	var lon; //x좌표
	var info; //데이터배열
	var markers = []; //마커제어할 변수
	var overlays = []; //오버레이제어할 변수
	
	//지도생성
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	function setCenter() {
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(lat, lon);

		// 지도 중심을 이동 시킵니다
		map.setCenter(moveLatLon);
	}
	
	
	//초기위치설정
	function basicloca(){
		if (navigator.geolocation) {
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
				lat = position.coords.latitude; // 위도
				lon = position.coords.longitude; // 경도
				setCenter();
			});
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			alert("현재 위치를 찾을 수 없습니다.");
		}
	
	}
	
	
	basicloca(); //초기위치부여
	setCenter(); //중심위치변경

	function makeMark(info) {
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(24,35);

		for (var i = 0; i < info.length; i++) {
			var markLat = info[i].ycode;
			var markLon = info[i].xcode;
			var title = info[i].storeName;

            // 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : new kakao.maps.LatLng(markLat,markLon), // 마커를 표시할 위치
				title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage// 마커 이미지 

			});
			
		    //오버레이생성
		    var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + title + 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' +
            '                <div class="ellipsis">' + info[i].addr +'</div>' + 
            '                <div class="jibun ellipsis">'+ info[i].tel +'</div>' +  
            '        </div>' + 
            '    </div>' +    
            '</div>';
            
		    var overlay = new kakao.maps.CustomOverlay({
		        content: content,
		        map: null,
		        position: marker.getPosition()       
		    });
		    
		 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    (function(marker, overlay) {
		        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		        kakao.maps.event.addListener(marker, 'click', function() {
		        	overlay.setMap(map);
		        });

		        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		        kakao.maps.event.addListener(marker, 'mouseout', function() {
		        	overlay.setMap(null);
		        });
		    })(marker, overlay);
			
			// 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);
			
		    
		    // 생성된 마커를 배열에 추가합니다
		    markers.push(marker);
		    overlays.push(overlay);
		}

	}	
	
	
	
	//마커, 오버레이 표시
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	        overlays[i].setMap(map);
	    }            
	}
	
	//약국리스트 출력
	function makeList(info) {
		var strAdd = "";
		for (var i = 0; i < info.length; i++) {
			strAdd += "<ul class='storeInfo'>"
			strAdd += "<li class='storeName'><span onclick='storeChack("+ i +")'>" + info[i].storeName+ "</span></li>"
			strAdd += "<li class='storeAddr'>"+ info[i].addr + "</li>"
			strAdd += "<li class='storeTel'>"+ info[i].tel + "</li>"
			strAdd += "</ul><hr/>"
		}
		$(".medi-store-result").html(strAdd); //엘리먼트 추가
	}
	
	//타이틀 클릭시 좌표이동
	function storeChack(i) {
		lon = info[i].xcode;
		lat = info[i].ycode;
		setCenter();
	}
	
	
	
	

	//셀렉트전환에 따른 맵 변경
	$("#ro").change(function() {
		var si = $("#si option:selected").val();
		var gu = $("#gu option:selected").val();
		var ro = $("#ro option:selected").val();
		
		if(si === "- 시, 도 -" || gu === "- 시, 군, 구 -" || ro === "- 길, 로 -"){	
			basicloca();
			setCenter();
			$(".medi-store-result").html("");
			setMarkers(null);
			
			return;
		}
		
		$.ajax({
			url : "mediStore/changeMap",
			type : "POST",
			data : JSON.stringify({"si" : si, "gu" : gu, "ro" : ro}),
			contentType : "application/json; charset=utf-8",
			success : function(data) {
			
				
				//데이터분해
				info = []; //배열초기화
				lon = data.xCode;
				lat = data.yCode;
				for ( var i in data.list) {
					info.push(data.list[i]);
				}
				
				//리스트작성
				makeList(info);
		
				//지도 중심위치변경
				setCenter();
				
				//마커, 오버레이 배열초기화
				setMarkers(null);				
				
				//마커표기
				makeMark(info);

		},
		error : function(error) {
			alert(error);
		}

		});//end ajax
	}); //and change function
	
	

	//키워드 검색
	$(".medi-search-btn").click(function() {
		var si = $("#si option:selected").val();
		var gu = $("#gu option:selected").val();
		var ro = $("#ro option:selected").val();
		var keyword = $(".medi-search-size").val();
		
		
		//지역이 없을경우
		if(si === "- 시, 도 -" || gu === "- 시, 군, 구 -" || ro === "- 길, 로 -"){
			
			$.ajax({
				url : "mediStore/searchKeyword",
				type : "POST",
				dataType : "json",
				data : "keyword=" + keyword,
				success : function(data) {
					if(data.key.length === 0){
						alert("'"+ keyword +"'이(가) 포함된 약국이 없습니다.");
						return
					}
					//데이터분해
					info = []; //배열초기화
					for ( var i in data.key) {
						info.push(data.key[i]);
					}
					
					//리스트작성
					makeList(info);
					
					makeMark(info);
					
					
				},
				error : function(error) {
					alert(error);
				}
			});
			
			
		}else{
			//지역이 있을경우
			$.ajax({
				url : "mediStore/searchKeywordLoca",
				type : "POST",
				data : JSON.stringify({"si" : si, "gu" : gu, "keyword" : keyword}),
				contentType : "application/json; charset=utf-8",
				success : function(data) {	
					if(data.key.length === 0){
						alert("'"+ keyword +"'이(가) 포함된 약국이 없습니다.");
						return
					}
					//데이터분해
					info = []; //배열초기화
				
					for ( var i in data.key) {
						info.push(data.key[i]);
					}
					
					//리스트작성
					makeList(info);
			
				},
				error : function(error) {
					alert(error);
				}
			});
		}
		
		
		
	});//end click function
	
	
	
	

	
</script>
