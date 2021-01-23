<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.medi-info-box .content{
	font-size : 15px;
}
.medi-info-box .line{
	color : #C2E8CA;
}
</style>
<section class="medi-area">

  <div class="container medi_container">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div>
          <h4 class="medi-gray">${mediVO.proCom }</h4>
           <h5 class="medi-gray">${mediVO.proNo }</h5>
          <h2>${mediVO.proName }</h2>
        </div>
        <div class="medi-com-img">
            <img src="${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png" alt="medi">
            <div class="medi-com-bm empty-stars"><img src="${pageContext.request.contextPath }/resources/img/medi/empty-stars.png" alt="star1"></div>
        </div>
        <div class="medi-info-detail">
        
          <div class="medi-info-box">
            <div>${userVO.userBookMark01 }</div>
            <div class="title-name">보관 방법</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${mediVO.proSave }</div>
          </div>
          
          <div class="medi-info-box">
            <div class="title-name">사용 기한</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${mediVO.proDate }</div>
          </div>

          <div class="medi-info-box">
            <div class="title-name">효능 효과</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${mediVO.proEffi }</div>
          </div>
    
          <div class="medi-info-box">
            <div class="title-name">주성분</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${mediVO.proMain }</div>
          </div>

		  <div class="medi-info-box">
            <div class="title-name">부성분</div>
            <div class="line">－－－－－－－</div>
            <div class="content">${mediVO.proSub }</div>
          </div>
          
        </div>
      </div>
      
</section>


<!-- mediDetail script -->
<script>
  
function starChange(){
    if($(this).children().hasClass("empty-stars")){
      $(this).children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
      $(this).children().addClass("full-stars").removeClass("empty-stars");
    
      $.ajax({
    	 url:"addBookmark",
    	 data : {"proNo":"${mediVO.proNo }"},
    	 success: function(data){
    		 // 0 : 회원없음
    		 // 1 : 이미 존재
    		 // 2 : 추가
    		 // 3 : 실패
    		 
    		 console.log(data);
    	 }, 
    	 error : function(error){
    		 console.log(error);
    	 } 
      });
      
    }else if($(this).children().hasClass("full-stars")){
      $(this).children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/empty-stars.png");
      $(this).children().addClass("empty-stars").removeClass("full-stars");
      
      
      
      
    }
  }

  $(".medi-com-img").click(starChange)
  
</script>