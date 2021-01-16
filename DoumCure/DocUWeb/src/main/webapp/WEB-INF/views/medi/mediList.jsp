<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- section -->
<section class="medi-area">
  <div class="container medi_container">
    <div class="row">
      <div class="col-lg-12 col-xs-12">
        
        <div class="medi-borad-title">#두통</div>
        <button type="button" class="medi-right medi-com-btn">비교하기</button>
        <table class="table table-hover medi-table">
  
          <thead>
            <tr>
              <th class="sm-area">비교</th>
              <th class="sm-area"></th>
              <th class="sm-area">no</th>
              <th class="lg-area">제품명</th>
              <th class="lg-area">효과 / 효능</th>
              <th class="sm-area"></th>
            </tr>
          </thead>
  
          <tbody>
            <tr>
              <td class="sm-area">
                <input type="checkbox" class="medi-checkbox" name="" id="" >
              </td>
              <td class="sm-area"></td>
              <td class="sm-area">1</td>
              <td class="lg-area"><a href="#">제품01</a></td>
              <td class="lg-area">효능01</td>
              <td class="sm-area empty-stars">
                  <img src="../img/medi/empty-stars.png" alt="stars">
              </td>
            </tr>
            <tr>
              <td class="sm-area">
                <input type="checkbox" class="medi-checkbox" name="" id="" >
              </td>
              <td class="sm-area"></td>
              <td class="sm-area">2</td>
              <td class="lg-area"><a href="#">제품02</a></td>
              <td class="lg-area">효능02</td>
              <td class="sm-area empty-stars"><img src="../img/medi/empty-stars.png" alt="stars"></td>
            </tr>
            <tr>
              <td class="sm-area">
                <input type="checkbox" class="medi-checkbox" name="" id="" >
              </td>
              <td class="sm-area"></td>
              <td class="sm-area">3</td>
              <td class="lg-area"><a href="#">제품03</a></td>
              <td class="lg-area">효능03</td>
              <td class="sm-area empty-stars"><img src="../img/medi/empty-stars.png" alt="stars"></td>
            </tr>
            <tr>
              <td class="sm-area">
                <input type="checkbox" class="medi-checkbox" name="" id="" >
              </td>
              <td class="sm-area"></td>
              <td class="sm-area">4</td>
              <td class="lg-area"><a href="#">제품04</a></td>
              <td class="lg-area">효능04</td>
              <td class="sm-area empty-stars"><img src="../img/medi/empty-stars.png" alt="stars"></td>
            </tr>
          </tbody>
  
        </table>






      <!-- 페이지네이션 -->
      <div class="medi-more-list">
        <button type="button"><span class="glyphicon glyphicon-chevron-down"></span> 더보기</button>
      </div>
      </div>
    </div>
  </div>
</section>

<script>
  $(document).ready(function(){
    $("tbody").children('tr:eq(0)').children('td:eq(1)').html("<img src='../img/medi/no1.png' alt='no1'>")
    $("tbody").children('tr:eq(1)').children('td:eq(1)').html("<img src='../img/medi/no2.png' alt='no2'>")
    $("tbody").children('tr:eq(2)').children('td:eq(1)').html("<img src='../img/medi/no3.png' alt='no3'>")
    
  })
  
  function starChange(event){
    if($(this).hasClass("empty-stars")){
      $(this).children().attr("src","../img/medi/full-stars.png");
      $(this).addClass("full-stars").removeClass("empty-stars");
    }else if($(this).hasClass("full-stars")){
      $(this).children().attr("src","../img/medi/empty-stars.png");
      $(this).addClass("empty-stars").removeClass("full-stars");
    }
  }

  $(".sm-area").click(starChange)
</script>