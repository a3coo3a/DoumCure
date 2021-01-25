<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>

.medi-info-box .line{
	color : #C2E8CA;
}
.medi-info-box .content{
	font-size: 12px;
}
</style>
<section class="medi-area">

  <div class="container medi_container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 right-line">
        <div>
          <h4 class="medi-gray">${vo1.proCom }</h4>
          <h5 class="medi-gray">${vo1.proNo }</h5>
          <h2>${vo1.proName }</h2>
        </div>
        <div class="medi-com-img star1 ${vo1.proNo }">
            <img src="" alt="${vo1.proNo }"  id="vo1">
            <div class="medi-com-bm empty-stars"><img src="${pageContext.request.contextPath }/resources/img/medi/empty-stars.png" alt="star1"></div>
        </div>
        <div class="medi-info-detail">

          <div class="medi-info-box">
            <div class="title-name">보관 방법</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo1.proSave }</div>
          </div>
          
          <div class="medi-info-box">
            <div class="title-name">사용 기한</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo1.proDate }</div>
          </div>

          <div class="medi-info-box">
            <div class="title-name">효능 효과</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo1.proEffi }</div>
          </div>
    
          <div class="medi-info-box">
            <div class="title-name">주성분</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo1.proMain }</div>
          </div>

		  <div class="medi-info-box">
            <div class="title-name">부성분</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo1.proSub }</div>
          </div>

        </div>
      </div>

      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
        <div>
          <h4 class="medi-gray">${vo2.proCom }</h4>
          <h5 class="medi-gray">${vo2.proNo }</h5>
          <h2>${vo2.proName }</h2>
        </div>
        <div class="medi-com-img star2 ${vo2.proNo }">
            <img src="" alt="${vo2.proNo }"  id="vo2">
            <div class="medi-com-bm empty-stars"><img src="${pageContext.request.contextPath }/resources/img/medi/empty-stars.png" alt="star2"></div>
        </div>
        
        <div class="medi-info-detail">

         <div class="medi-info-box">
            <div class="title-name">보관 방법</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo2.proSave }</div>
          </div>
          
          <div class="medi-info-box">
            <div class="title-name">사용 기한</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo2.proDate }</div>
          </div>

          <div class="medi-info-box">
            <div class="title-name">효능 효과</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo2.proEffi }</div>
          </div>
    
          <div class="medi-info-box">
            <div class="title-name">주성분</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo2.proMain }</div>
          </div>

		  <div class="medi-info-box">
            <div class="title-name">부성분</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo2.proSub }</div>
          </div>


        </div>

      </div>
    </div>
  </div> 

 <!-- 목록으로 -->
        <div>
			<button type="button" class="btn medi-com-btn" onclick="history.go(-1)"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;뒤로...</button>        
        </div>

</section>


<!-- 이미 즐겨찾기 되어 있으면 별 색칠하기 -->
<script>
$(document).ready(function(){
	
	var bookmark01 = "${userVO.userBookMark01}";
	var bookmark02 = "${userVO.userBookMark02}";
	var bookmark03 = "${userVO.userBookMark03}";
	var proNo1 = "${vo1.proNo }";
	var proNo2 = "${vo2.proNo }";
	
	if(bookmark01 == proNo1 | bookmark02 == proNo1 | bookmark03 == proNo1){
		 if($(".star1").children().hasClass("empty-stars")){
			$(".star1").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
	    	$(".star1").children().addClass("full-stars").removeClass("empty-stars");
		 }
	}
	if(bookmark01 == proNo2 | bookmark02 == proNo2 | bookmark03 == proNo2){
		if($(".star2").children().hasClass("empty-stars")){
			$(".star2").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
	    	$(".star2").children().addClass("full-stars").removeClass("empty-stars");
		 }
	}

})
</script>

<!-- 이미지 출력 -->
<script>
$(document).ready(function(){
	
	if("${vo1.proNo}" != '' && "${vo1.proImg }" == ''){
		$("#vo1").attr("src","${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png");
	}else {
		$("#vo1").attr("src","${vo1.proImg }");
	}
	
	if("${vo2.proNo}" != '' && "${vo2.proImg }" == '' ){
		$("#vo2").attr("src","${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png");
	}else {
		$("#vo2").attr("src","${vo2.proImg }");
	}
});
</script>




<!-- 별 클릭시 색칠 -->
<script>

function starChange(){
	var userVO = "${sessionScope.userVO}"
		if(userVO == ''){
				alert("회원만 이용가능합니다.");   
				return;
		}
	
	if($(this).children().hasClass("empty-stars")){
		var proNo = $(this).children().attr("alt");
		console.log(proNo);
  		$.ajax({
  			url : "addBookmark",
  			type : "POST",
  			data : {"proNo":proNo},
  			success : function(data){
  				if (data == 3){// 3 : 즐겨찾기가 가득차 있음
  					alert("즐겨찾기가 이미 가득찼습니다.");  
  				}else if (data == 2 || data == 1) { // 2 : 이미 존재하는 즐겨찾기   // 1 : 추가 성공
  					if($(".medi-com-img").hasClass(proNo)){
  						console.log($("."+proNo+""));
  						$("."+proNo+"").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
  						$("."+proNo+"").children().addClass("full-stars").removeClass("empty-stars");
  					 }
  				}else if(data == 0){  // 0 : 실패
  					alert("즐겨찾기 추가에 실패 했습니다. 관리자에게 문의하세요");
  				}
  			},
  	    	 error : function(error){
  	    		console.log("error"+error);
  	    		alert("error:즐겨찾기 추가에 실패 했습니다. 관리자에게 문의하세요");
  	    	 }
  		});
	}else if($(this).children().hasClass("full-stars")){
		var proNo = $(this).children().attr("alt");
      // 북마크 삭제
      $.ajax({
    	 url : "rmBookmark",
    	 type : "POST",
    	 data : {"proNo": proNo},
    	 success : function(data){
    		if(data == 3 || data == 1){// 3 : 즐겨찾기에 없음. // 1 : 삭제 성공
    			if($(".medi-com-img").hasClass(proNo)){
					console.log($("."+proNo+""));
					$("."+proNo+"").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/empty-stars.png");
					$("."+proNo+"").children().addClass("empty-stars").removeClass("full-stars");
				}
			}else if(data == 0){ // 0 : 실패
				alert("즐겨찾기 삭제에 실패 했습니다. 관리자에게 문의하세요");
			}
    	 },
    	 error : function(error){
    		 console.log("error"+error);
    		 alert("error:즐겨찾기 삭제에 실패 했습니다. 관리자에게 문의하세요");
    	 }
      });
  
  
	}
  }

  $(".medi-com-img").click(starChange)
</script>