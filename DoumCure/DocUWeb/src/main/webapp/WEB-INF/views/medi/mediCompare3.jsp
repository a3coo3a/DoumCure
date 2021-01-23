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
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 right-line">
        <div>
          <h4 class="medi-gray">${vo1.proCom }</h4>
          <h2 class="com-title-size">${vo1.proName }</h2>
        </div>
        <div class="medi-com-img star1">
            <img src="${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png" alt="${vo1.proNo }">
            <div class="medi-com-bm empty-stars"><img src="${pageContext.request.contextPath }/resources/img/medi/empty-stars.png" alt="star"></div>
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
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 right-line">
        <div>
          <h4 class="medi-gray">${vo2.proCom }</h4>
          <h2 class="com-title-size">${vo2.proName }</h2>
        </div>
        <div class="medi-com-img star2">
            <img src="${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png" alt="${vo2.proNo }">
            <div class="medi-com-bm empty-stars"><img src="${pageContext.request.contextPath }/resources/img/medi/empty-stars.png" alt="star"></div>
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
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <div>
          <h4 class="medi-gray">${vo3.proCom }</h4>
          <h2 class="com-title-size">${vo3.proName }</h2>
        </div>
        <div class="medi-com-img star3">
            <img src="${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png" alt="${vo3.proNo }">
            <div class="medi-com-bm empty-stars"><img src="${pageContext.request.contextPath }/resources/img/medi/empty-stars.png" alt="star"></div>
        </div>
        <div class="medi-info-detail">
	
		  <div class="medi-info-box">
            <div class="title-name">보관 방법</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo3.proSave }</div>
          </div>
          
          <div class="medi-info-box">
            <div class="title-name">사용 기한</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo3.proDate }</div>
          </div>

          <div class="medi-info-box">
            <div class="title-name">효능 효과</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo3.proEffi }</div>
          </div>
    
          <div class="medi-info-box">
            <div class="title-name">주성분</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo3.proMain }</div>
          </div>

		  <div class="medi-info-box">
            <div class="title-name">부성분</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${vo3.proSub }</div>
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
	var proNo3 = "${vo3.proNo }";
	
	if(bookmark01 == proNo1 | bookmark02 == proNo1 | bookmark03 == proNo1){
		 if($(".star1").children().hasClass("empty-stars")){
			$(".star1").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
	    	$(".star1").children().addClass("full-stars").removeClass("empty-stars");
		 }
	}else if(bookmark01 == proNo2 | bookmark02 == proNo2 | bookmark03 == proNo2){
		if($(".star2").children().hasClass("empty-stars")){
	       $(".star2").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
	       $(".star2").children().addClass("full-stars").removeClass("empty-stars");
		 }
	}else if(bookmark01 == proNo3 | bookmark02 == proNo3 | bookmark03 == proNo3){
		if($(".star3").children().hasClass("empty-stars")){
		   $(".star3").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
	       $(".star3").children().addClass("full-stars").removeClass("empty-stars");
		 }
	}
})
</script>

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
  				// 3 : 즐겨찾기가 가득차 있음
  				// 2 : 이미 존재하는 즐겨찾기 
  				// 1 : 추가 성공
  				// 0 : 실패
  				if (data == 3){
  					alert("즐겨찾기가 이미 가득찼습니다.");  
  				}else if (data == 2 || data == 1) {
  					if($(".medi-com-img").hasClass("star1")){
  						$(".star1").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
  				    	$(".star1").children().addClass("full-stars").removeClass("empty-stars");
  					 }else if($(".medi-com-img").hasClass("star2")){
  						$(".star2").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
  				    	$(".star2").children().addClass("full-stars").removeClass("empty-stars");
  					 }else if($(".medi-com-img").hasClass("star3")){
  						$(".star3").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
  				    	$(".star3").children().addClass("full-stars").removeClass("empty-stars");
  					 }
  				}else if(data == 0){
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
    			// 3 : 즐겨찾기에 없음.
    			// 1 : 삭제 성공
    			// 0 : 실패
    		if(data == 3 || data == 1){
    			if($(".medi-com-img").hasClass("star1")){
					$(".star1").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/empty-stars.png");
			    	$(".star1").children().addClass("empty-stars").removeClass("full-stars");
				 }else if($(".medi-com-img").hasClass("star2")){
					$(".star2").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/empty-stars.png");
			    	$(".star2").children().addClass("empty-stars").removeClass("full-stars");
				 }else if($(".medi-com-img").hasClass("star3")){
					$(".star3").children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/empty-stars.png");
			    	$(".star3").children().addClass("empty-stars").removeClass("full-stars");
				 }
			}else if(data == 0){
				alert("즐겨찾기 삭제에 실패 했습니다. 관리자에게 문의하세요");
			}
    	 },
    	 error : function(error){
    		 console.log("error"+error);
    		 alert("error:즐겨찾기 삭제에 실패 했습니다. 관리자에게 문의하세요");
    	 }
      });
  
  
	}

  $(".medi-com-img").click(starChange)

</script>