<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- join css -->
  <style>
  .btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn:active:focus, .btn:focus{
    outline: none;
  } 
  </style>
  
  <!-- section -->
<section class="user-area user-bg">
        <div class="container user_container">
          <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-12 user-text-bg user-text-area">
              <h3 align="center">회원가입</h3>
              <br/>
              <div class="form-group">
                <button type="button" class="btn btn-lg btn-block kakao-user-btn"><img src="../img/user/kakaolink_btn_small.png">카카오로그인</button>
                <button type="button" class="btn btn-lg btn-block naver-user-btn"><img src="../img/user/navericon.PNG">네이버로그인</button>
              </div>
              <hr class="user_line">
              <div class="form-group">
                <button type="button" class="btn btn-lg btn-block user-btn" onclick="location='login.user'">ID / PW 로그인</button>
              </div>
            </div>
          </div>
        </div>
</section>

<!-- join script -->
<script>
$(document).ready(function () {
    //콤마작업
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    var d = document.querySelectorAll(".drug-text strong");
    console.log(d);
    change_comma();

    function change_comma() {

        for (var i = 0; i < d.length; i++) {
            var num = comma(d[i].innerHTML);
            d[i].innerHTML = num;
        }


    }


    // 상단 카운트
    var today = Number($(".today").html());
    var total = Number($(".total").html());
    var dataCount = Number($(".data-count").html());

    $(function () {
        var count0 = count1 = count2 = 0;
        timeCounter();

        function timeCounter() { //today
            id0 = setInterval(count0Fn, 80);
            function count0Fn() {
                count0++;
                if (count0 > 40) {
                    clearInterval(id0);
                    var str = comma(today)
                    $(".today").html(str)
                } else {
                    $(".number").eq(0).text(count0);
                }
            }

            id1 = setInterval(count1Fn, 30);

            function count1Fn() { //total
                count1++;
                if (count1 > 100) {
                    clearInterval(id1);
                    var str = comma(total)
                    $(".total").html(str)
                } else {
                    $(".number").eq(1).text(count1);
                }
            }

            id2 = setInterval(count2Fn, 30);

            function count2Fn() { //data-total
                count2++;
                if (count2 > 100) {
                    clearInterval(id2);
                    var str = comma(dataCount)
                    $(".data-count").html(str)
                } else {
                    $(".number").eq(2).text(count2);
                }
            }
        }
    });

});



</script>