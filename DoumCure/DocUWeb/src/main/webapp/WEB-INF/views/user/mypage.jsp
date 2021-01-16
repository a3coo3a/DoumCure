<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypage css -->
  <style>
  .user_container a {
    color : #000
  }
  .pager li>a, .pager li>span{
    border: none;
    padding: 5px 10px;
  }
  .pager li>a:focus, .pager li>a:hover{
    background-color: #66e992;
    color: #fff;
  }
  .userid{
    color: rgb(150, 150, 150);
    margin: 5px;
  }
  </style>
  
  <section class="user-area">

  <div class="container user_container">
    <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 profile-box">
            <div class="user-profile-img">
              <img src="../img/user/basic_profile.png" alt="profile">
              <div class="user-profile-emoji">😘</div>
            </div>
            <div class="user-profile-info">
              <div class="nickname">닉네임</div>
              <div class="userid">아이디</div>
              <button type="button">정보수정</button>
            </div>
          
      </div>
      <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 medi-right">
      <div class="product-box">
          <h3><span class="glyphicon glyphicon-bookmark"></span>&nbsp;즐겨찾기</h3>
            <div class="bookmark-product">
              <div class="bookmark-img"><a href="#"><img src="../img/user/bookmarkicon.png" alt="bookmarkicon"></a></div>
              <div class="bookmark-name"><a href="#">제품명01</a></div>
            </div>
            <div class="bookmark-product">
              <div class="bookmark-img"><a href="#"><img src="../img/user/bookmarkicon.png" alt="bookmarkicon"></a></div>
              <div class="bookmark-name"><a href="#">제품명01</a></div>
            </div>
            <div class="bookmark-product">
              <div class="bookmark-img"><a href="#"><img src="../img/user/bookmarkicon.png" alt="bookmarkicon"></a></div>
              <div class="bookmark-name"><a href="#">제품명01</a></div>
            </div>
      </div>
      
        <hr class="user-line product-box">
        
        <div class="product-box">
          <h3><span class="glyphicon glyphicon-sunglasses"></span>&nbsp;최근 본 상품</h3>
          <div class="bookmark-product">
            <div class="bookmark-img"><a href="#"><img src="../img/user/bookmarkicon.png" alt="bookmarkicon"></a></div>
            <div class="bookmark-name"><a href="#">제품명01</a></div>
          </div>
          <div class="bookmark-product">
            <div class="bookmark-img"><a href="#"><img src="../img/user/bookmarkicon.png" alt="bookmarkicon"></a></div>
            <div class="bookmark-name"><a href="#">제품명01</a></div>
          </div>
          <div class="bookmark-product">
            <div class="bookmark-img"><a href="#"><img src="../img/user/bookmarkicon.png" alt="bookmarkicon"></a></div>
            <div class="bookmark-name"><a href="#">제품명01</a></div>
          </div>
        </div>


      </div>
    </div>
    <hr class="user-line">
  <div class="row">
    <div class="col-lg-10 col-md-10 col-sm-12 user-text-bg user-mypage-area">
      <h4 class="user-borad-title"><span class="glyphicon glyphicon-pencil"></span>&nbsp;내가 쓴 글</h4>
     
      <table class="table table-hover user-table">

        <thead>
          <tr>
            <th class="title-align">title</th>
            <th class="date-align">date</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td class="title-align"><a href="#">title01</a></td>
            <td class="date-align date-line">2021-01-12</td>
          </tr>
          <tr>
            <td class="title-align"><a href="#">title02</a></td>
            <td class="date-align date-line">2021-01-12</td>
          </tr>
          <tr>
            <td class="title-align"><a href="#">title03</a></td>
            <td class="date-align date-line">2021-01-12</td>
          </tr>
        </tbody>

      </table>
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
    </div>
  </div>
</div>


</section>