<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- medisearch css -->
    <style>
        .medi-area {
            display: block;
            text-align: center;
        }
        .medi-area strong{
            font-family: 'GmarketSansBold';
            font-size: 40px;
        }

        .line-left {
            border: 1px solid #41bf6d;
            border-radius: 30px;
        }

        .line-left > p{
            margin-top: 30px;
            font-family: 'GmarketSansMedium';
            font-size: 25px;
        }

        .line-left img{
            max-width: 100%;
        }

        .medi-info {
            float: none;
            margin: 0 auto;
            overflow: hidden;
        }

        .medi-info span {
            text-align: center;
        }

        .medi-info .hash-name {
            border: 1px solid #41bf6d;
            border-radius: 100px 50px;
            margin: 8px;
            padding: 5px 15px;
        }

        .medi-left {
            display: inline-block;
        }

        .medi-hash-center {
            margin: 0 auto;
            max-width: 100%;
            text-align: center;
        }
        .medi-info .hash-name:hover{
            background-color: #41bf6d;
            color: white;
        }

        .search-detail{
            padding: 30px;
        }

        .search-detail img{
            max-width: 100%;
            height: 250px;
        }

        .search-detail-etc{
            margin: 0 auto;
        }
        
        .seaech-detail-etc p,
        .line-right p{
            font-family: 'GmarketSansMedium';
            font-size: 15px;
        }
        
        .search-detail-etc form .form-group{
            max-width: 100%;
            text-align: center;
            padding-right: 5px;
        }


        .search-detail-view{
            display: none;
        }
        
        .search-detail-default{
            margin-top: 250px;
        }

        .search-detail-default{
            font-family: 'GmarketSansMedium';
            padding: 20px;
            font-size: 20px;
            background-color: #f2ab27;
            color: white;
            border-radius: 40px;
        }
        

    </style>
    
    <section class="medi-area">
        <strong>증상별 검색</strong>
        <hr>
    
        <div class="container">
            <div class="row justify-content-center line">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 line-left">
                    <p>부위를 선택해주세요</p>
                    <img src="../img/medi/human-all.png" alt="" usemap="#imgmap" id="human">
                    <!-- 이미지맵 -->
                    <map id="imgmap" name="imgmap">
                        <area shape="circle" coords="140,106,26" href="#" onfocus="this.blur()" class="search-head" onmouseover="if(document.images) human.src = '../img/medi/human-head.png'" onmouseout = "if(document.images) human.src = '../img/medi/human-all.png' "  />
                        <area shape="rect" coords="109,146,171,269" href="#" onfocus="this.blur()" class="search-body" onmouseover="if(document.images) human.src = '../img/medi/human-body.png'" onmouseout = "if(document.images) human.src = '../img/medi/human-all.png' " />
                        <area shape="rect" coords="78,146,100,268"  href="#" onfocus="this.blur()" class="search-arm" onmouseover="if(document.images) human.src = '../img/medi/human-arm.png'" onmouseout = "if(document.images) human.src = '../img/medi/human-all.png' " />
                        <area shape="rect" coords="179,146,202,268" href="#" onfocus="this.blur()" class="search-arm"onmouseover="if(document.images) human.src = '../img/medi/human-arm.png'" onmouseout = "if(document.images) human.src = '../img/medi/human-all.png' " />
                        <area shape="rect" coords="108,292,136,400" href="#" onfocus="this.blur()" class="search-leg" onmouseover="if(document.images) human.src = '../img/medi/human-leg.png'" onmouseout = "if(document.images) human.src = '../img/medi/human-all.png' " />
                        <area shape="rect" coords="146,293,172,401" href="#" onfocus="this.blur()" class="search-leg" onmouseover="if(document.images) human.src = '../img/medi/human-leg.png'" onmouseout = "if(document.images) human.src = '../img/medi/human-all.png' " />
                        <!-- Created by Online Image Map Editor (http://www.maschek.hu/imagemap/index) -->
                    </map>
                </div>

                
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 line-right" >
                    <div class="search-detail-default">
                        <span>부위를 선택해 주세요 :)</span>
                    </div>
                    <div class="search-detail-view">
                        <div class="search-detail">
                            <img src="../img/medi/detail3.png" alt="">
                        </div>
                        <p>주요 증상</p>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 medi-info">
                                <div class="medi-hash-center">
                                    <span class="hash-name medi-left">두통</span>
                                    <span class="hash-name medi-left">기침</span>
                                    <span class="hash-name medi-left">여드름</span>
                                    <span class="hash-name medi-left">콧물</span>
                                    <span class="hash-name medi-left">미열</span>
                                </div>
                            </div>
                        
                        
                        <hr>
                        <!-- <span>그 외 증상은 검색을 이용해 주세요</span> -->
                        <div class="seaech-detail-etc">
                            <p>OTHER</p>
                            <form>
                                <div class="col-lg-10 col-md-10 col-sm-10 search-bar form-group">
                                <input type="text" class="form-control" placeholder="그 외 증상은 검색을 이용해 주세요">
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 form-group">
                                    <button type="submit" class="btn btn-default">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </section>
    
    <script src="../js/jquery.rwdImageMaps.js"></script>
    <script>
        $(document).ready(function(e){
            $("img[usemap]").rwdImageMaps();
        })
    </script>

    <!-- Search script -->
    <script>
        $(document).ready(function(){
            var map = document.querySelector("#imgmap");
            var detail = $(".search-detail")[0].childNodes[1];
            var hash = document.querySelectorAll(".hash-name");
            
            var head = ["두통","기침","콧물","여드름","발열"];
            var body = ["변비", "위염", "장염", "치질", "속쓰림"];
            var arm = ["염증","관절","타박상","멍","근육통"];
            var leg = ["근육통","염증","저림","타박상","관절"]

            map.addEventListener("click", function(){
                $(".search-detail-view").css('display','block');
                $(".search-detail-default").css('display', 'none');

                
                var classList = event.target.classList
                if(classList.value === "search-head"){
                    detail.src = "../img/medi/detail3.png"
                    for(var i in hash){
                        hash[i].innerHTML = head[i];
                    }
                }else if(classList.value === "search-arm"){
                    detail.src = "../img/medi/detail1.png"
                    for(var i in hash){
                        hash[i].innerHTML = arm[i];
                    }
                }else if(classList.value === "search-body"){
                    detail.src = "../img/medi/detail4.png"
                    for(var i in hash){
                        hash[i].innerHTML = body[i];
                    }
                }else if(classList.value === "search-leg"){
                    detail.src = "../img/medi/detail2.png"
                    for(var i in hash){
                        hash[i].innerHTML = leg[i];
                    }
                }



            })



        })
    </script>
    