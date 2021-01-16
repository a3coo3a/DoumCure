<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 카카오지도 로드 -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54f3dc16451dc4bf406f8a9204411943"></script>
  
  <!-- mediStore css -->
  <style>
    /*카카오 지도 css*/
    #map{
      width: 100%;
      height: 400px;
      margin: 0 auto;
    }
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
    .pager li>a, .pager li>span {
      border: none;
      padding: 5px 10px;
      color:  rgba(0, 0, 0, 0.8);
    }
    .pager li>a:focus, .pager li>a:hover{
      background-color: #66e992;
      color: #fff;
    }
    </style>
    
    <section class="medi-area">

  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div id="map"></div>
        <p id="result"></p>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="medi-store-title">
          <h3>약국찾기<img src="../img/medi/medistoreicon.png" alt=""></h3>
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
        <div class="medi-store">
          <h4 class="store-name"><a href="#">우리약국1</a></h4>
          <p>경기도 서울시 강남구 </p>
          <p>02-0000-0000</p>
        </div>

        <div class="medi-store">
          <h4 class="store-name"><a href="#">우리약국2</a></h4>
          <p>경기도 서울시 강남구 </p>
          <p>02-0000-0000</p>
        </div>

        <div class="medi-store">
          <h4 class="store-name"><a href="#">우리약국3</a></h4>
          <p>경기도 서울시 강남구 </p>
          <p>02-0000-0000</p>
        </div>

        <div class="medi-store">
          <h4 class="store-name"><a href="#">우리약국4</a></h4>
          <p>경기도 서울시 강남구 </p>
          <p>02-0000-0000</p>
        </div>
        <!-- 페이지네이션 -->
      <ul class="pager">
        <li><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
        <li><a href="#">1</a></li>
        <li class="active"><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
      </ul>
      </div>  <!--오른쪽end-->
    </div>
  </div>










</section>

<!-- kakao map -->
<script>
	//------------ 지도생성 ----------------------//
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
	  center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	  level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	//*----------- 지역크기별 확대 축소 ----------------------//
	// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'zoom_changed', function() {        
	    
    // 지도의 현재 레벨을 얻어옵니다
    var level = map.getLevel();
    
    var message = '현재 지도 레벨(크기)은 ' + level + ' 입니다';
    $('#result').html(message);  
    
    
});

</script>