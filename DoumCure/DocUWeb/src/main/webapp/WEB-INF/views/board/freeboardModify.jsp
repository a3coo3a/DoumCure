<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
        <div class="BLQA-area">
            <div class="container board_list_container ">
                <div class="row content-wrap">
                    <div class="qa_blr_title_box col-lg-12 ">
                        <p>Q&A 수정하기</p>
                    </div>
                </div>
            </div>
    
            <form action="qaModiForm" method="post" name="qaModiForm">
    
                <div class="container">
                    <div class="container-inner row">
    
                        <div class="innertitle col-md-3 col-sm-12">
                            NAME
                        </div>
                        <!-- <td><input class="form-control input-sm" name="writer" value="${sessionScope.userVO.userId }" readonly><span id="msgId"></span></td> -->
                        <div class="inner-control col-md-7 col-sm-12 ">
                            <input class="form-control Large input " name="writer" value="작성자" readonly >
                        </div>
    
    
                        <div class="innertitle col-md-3 col-sm-12">
                            TITLE</div>
                        <div class="inner-control  col-md-7 col-sm-12 ">
                            <input class="form-control Large input " name="title" ><span id="msgTitle">
                        </div>
    
                        <div class="innertitle col-md-3 col-sm-12">
                            COMMNET
                        </div>
                        <div class="inner-control  col-md-7 col-sm-12 ">
                            <div class="reply-content">
                                <!-- accept="image/* 모든 타입의 확장자 파일 허용 -->
                                <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" />
                                <div id="image_container"></div>
                                <textarea class="form-control" rows="10" name="content" id="content" ></textarea>
                            </div>
                        </div>
                    </div>
    
                    <div class="titlefoot row">
                        <div class="blq-right-btn  col-sm-6 ">
    
                            <i id="lock" class="fas fa-lock-open" onclick="change('lock')" aria hidden="true">공개글</i>
                            <button type="button" class="btn btn-info" id="modifyBtn">확인</button>
                            <button class="btn" type="button" onclick="location.href='freeList' ">목록</button>
                            <button type="button" class="btn btn-danger" id="deleteBtn">삭제</button>

                            <!-- <i id="lock" class="fa fa-unlock " onclick="change('lock')" aria hidden="true">"잠금하기"</i>
                                                    <button type="button" class="btn btn-info btn-block" id="uploadBtn">등록하기</button>
                                                    <button class="btn btn-block" type="button" onclick="location.href='freeList' ">목록</button> -->
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </section>
    
    <!-- section script -->
    <script> 
    function setThumbnail(event) {
            var reader = new FileReader();

            reader.onload = function (event) {
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                document.querySelector("div#image_container").appendChild(img);
            };
            reader.readAsDataURL(event.target.files[0]);
        } 
    
// <i class="fa fa-unlock-alt"></i>
// <i class="fa fa-unlock"></i>

    function change (lock){
        if(document.getElementById(lock).className == "fa fa-unlock"){
            document.getElementById(lock).className = "fas fa-lock-open";
            document.getElementById(lock).innerHTML = "공개글";
        }
        else{
            document.getElementById(lock).className = "fa fa-unlock";
            document.getElementById(lock).innerHTML = "비공개글";

        }
        
    }

    </script>