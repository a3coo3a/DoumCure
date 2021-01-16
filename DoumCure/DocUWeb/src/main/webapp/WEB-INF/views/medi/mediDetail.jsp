<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="medi-area">

<div class="container medi_container">
  <div class="row">
    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 medidetail-box">
          <div class="medi-prod-img">
            <img src="../img/user/bookmarkicon.png" alt="medi">
            <div class="medi-bookmark empty-stars"><img src="../img/medi/empty-stars.png" alt="star"></div>
          </div>
          <div class="medi-price">
            <div class="medi-prod-sm-name">price</div>
            <button type="button" class="medi-btn">비교함담기</button>
          </div>
        
    </div>
    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 medi-right">
      <div class="medi-info">
        
        <div class="medi-prod-sm-name"><h6>업체명</h6></div>
        <div class="medi-prod-sm-name">분류</div>
        <div class="medi-prod-name"><h4>제품명</h4></div>
        <p class="hash-name medi-left">#감기</p>
        <p class="hash-name medi-left">#기침</p>
        <p class="hash-name medi-left">#목아픔</p>
      </div>
    </div>
  </div>
    
  <hr>

  <div class="row">
    <div class="col-lg-10 col-md-10 col-sm-12 medi-info-detail">
      
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

</section>


<!-- mediDetail script -->
<script>
  
  function starChange(){
    if($(".medi-bookmark").hasClass("empty-stars")){
      $(".medi-bookmark img").attr("src","../img/medi/full-stars.png");
      $(".medi-bookmark").addClass("full-stars").removeClass("empty-stars");
    }else if($(".medi-bookmark").hasClass("full-stars")){
      $(".medi-bookmark img").attr("src","../img/medi/empty-stars.png");
      $(".medi-bookmark").addClass("empty-stars").removeClass("full-stars");
    }
  }

  $(".medi-prod-img").click(starChange)
  $(".medi-prod-sm-name").click(starChange)
  
</script>