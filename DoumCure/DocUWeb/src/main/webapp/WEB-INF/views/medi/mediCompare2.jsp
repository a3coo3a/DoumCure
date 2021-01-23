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
          <h2>${vo1.proName }</h2>
        </div>
        <div class="medi-com-img">
            <img src="${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png" alt="medi">
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
          <h2>${vo2.proName }</h2>
        </div>
        <div class="medi-com-img">
            <img src="${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png" alt="medi">
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
			<button type="button" class="btn medi-com-btn" onclick="history.go(-1)"><span class="glyphicon glyphicon-list"></span>&nbsp;뒤로...</button>        
        </div>

</section>

<script>

function starChange(){
    if($(this).children().hasClass("empty-stars")){
      $(this).children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/full-stars.png");
      $(this).children().addClass("full-stars").removeClass("empty-stars");
    }else if($(this).children().hasClass("full-stars")){
      $(this).children().children().attr("src","${pageContext.request.contextPath }/resources/img/medi/empty-stars.png");
      $(this).children().addClass("empty-stars").removeClass("full-stars");
    }
  }

  $(".medi-com-img").click(starChange)
</script>