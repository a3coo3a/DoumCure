<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- AOS 초기화 -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>

<!-- Footer -->
   <footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-4 col-sm-12">
                <h2 class="footer-heading">Petsitting</h2>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
            </div>

            <div class="col-md-6 col-lg-4 col-sm-12">
                <h2 class="footer-heading">Quick Links</h2>
                <ul class="list-unstyled">
                    <li><a href="#" class="py-2 d-block">Home</a></li>
                    <li><a href="#" class="py-2 d-block">About</a></li>
                    <li><a href="#" class="py-2 d-block">Board</a></li>
                    <li><a href="#" class="py-2 d-block">Seach</a></li>
                </ul>
            </div>
            <div class="col-md-6 col-lg-4 col-sm-12">
                <h2 class="footer-heading">Have a Questions?</h2>
                <div class="block-23 mb-3">
                    <ul>
                        <span>The 11th and 12th floors of the 16th J-Stower in Gangnam-gu, Seoul</span>
                        <li><span>+82 010 1111 2222</span></li>
                        <li><span>jhr1494@gmail.com</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-12 text-center">

            <p class="copyright">
                Copyright &copy;
                <script>document.write(new Date().getFullYear());</script> All rights reserved | This template
                is made with <i class="fa fa-heart" aria-hidden="true"></i> by 3Team(Do.cU)
            </p>
        </div>
    </div>
  </div>
</footer>




<script>

// 팝업띄우기
function popup() {
    var url = "popup.html";
    var name = "popup test";
    var option = "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width = 350px, height = 370px, top = 120px, left = 200";
    
    window.open(url, name, option);
}
popup();


$(document).ready(function () {




    //콤마작업
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    var d = document.querySelectorAll(".drug-text strong");
    var t = document.querySelectorAll(".text strong");
    console.log(t);
    change_comma(d);
    change_comma(t);

    function change_comma(a) {

        for (var i = 0; i < a.length; i++) {
            var num = comma(a[i].innerHTML);
            a[i].innerHTML = num;
        }
    }



});



</script>