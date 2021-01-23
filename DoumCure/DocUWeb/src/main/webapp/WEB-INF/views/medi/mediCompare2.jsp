<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>

.medi-info-box .line{
	color : #C2E8CA;
}
</style>
<section class="medi-area">

  <div class="container medi_container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 right-line">
        <div>
          <h4 class="medi-gray">업체명</h4>
          <h2>제품명</h2>
        </div>
        <div class="medi-com-img">
            <img src="${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png" alt="medi">
            <div class="medi-com-bm empty-stars"><img src="${pageContext.request.contextPath }/resources/img/medi/empty-stars.png" alt="star1"></div>
        </div>
        <div class="medi-info-detail">

          <div class="medi-info-box">
            <div class="title-name">효능 효과</div>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit.</div>
          </div>
    
          <div class="medi-info-box">
            <div class="title-name">용법 용량</div>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit.</div>
          </div>
    
          <div class="medi-info-box">
            <div class="title-name">성분</div>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit.</div>
            <br/>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit.</div>
          </div>
    
          <div class="medi-info-box">
            <div class="title-name">주의 사항</div>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit.</div>
          </div>

        </div>
      </div>

      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
        <div>
          <h4 class="medi-gray">업체명</h4>
          <h2>제품명</h2>
        </div>
        <div class="medi-com-img">
            <img src="${pageContext.request.contextPath }/resources/img/user/bookmarkicon.png" alt="medi">
            <div class="medi-com-bm empty-stars"><img src="${pageContext.request.contextPath }/resources/img/medi/empty-stars.png" alt="star2"></div>
        </div>
        <div class="medi-info-detail">

          <div class="medi-info-box">
            <div class="title-name">효능 효과</div>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit.</div>
          </div>
    
          <div class="medi-info-box">
            <div class="title-name">용법 용량</div>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit.</div>
          </div>
    
          <div class="medi-info-box">
            <div class="title-name">성분</div>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit.</div>
            <br/>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit.</div>
          </div>
    
          <div class="medi-info-box">
            <div class="title-name">주의 사항</div>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit.</div>
          </div>

        </div>

      </div>
    </div>
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