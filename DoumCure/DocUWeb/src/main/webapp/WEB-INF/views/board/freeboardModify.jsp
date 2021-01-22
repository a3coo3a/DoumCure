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
    
            <form action="freeModiForm" method="post" name="freeModiForm">
    
                <div class="container">
                    <div class="container-inner row">
    
                        <div class="innertitle col-md-3 col-sm-12">
                            NAME
                        </div>
                        <!-- <td><input class="form-control input-sm" name="writer" value="${sessionScope.userVO.userId }" readonly><span id="msgId"></span></td> -->
                        <div class="inner-control col-md-7 col-sm-12 ">
                            <input class="form-control Large input " name="writer"  value="${sessionScope.userVO.userId }" readonly>
                        </div>
    
    
                        <div class="innertitle col-md-3 col-sm-12">
                            TITLE</div>
                        <div class="inner-control  col-md-7 col-sm-12 ">
                            <input class="form-control Large input " name="title"  value=""><span id="msgTitle">
                        </div>
    
                        	<div class="innertitle col-md-3 col-sm-12">COMMNET</div>
					<div class="inner-control  col-md-7 col-sm-12 ">
						<div class="reply-content">
							<div class="fileDiv">
								<img id="fileImg" src="../resources/img/title_icon.png">
							</div>

							<div class="reply-group">
								<img src="view?fileLoca=폴더경로&filename=파일명">
								<!-- <label for="file">이미지업로드</label> <input type="file" name="file"id="file"> -->
							</div>

							<textarea class="form-control" rows="10" name="content"
								id="content" readonly>${vo.bbsContent }</textarea>
							<div class="content-down-l">
								<input type="checkbox" id="bbsCO" name="bbsOC"> 비밀글

							</div>

							<div class="content-down-r">
								<button type="button" class="btn btn-warning" id="uploadBtn"
									onclick="location.href='freeboardModify?bbsNo=${vo.bbsNo}&writer=${vo.bbsWrite }' ">수정하기</button>
								<button class="btn" type="button"
									onclick="location.href='freeList' ">목록</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</form>

	</div>
</section>

<script> 
    window.onload = function() {
		 if(history.state === '' ) return;
		 
		 var msg = "${msg}"; //컨트롤러에서 넘어온 메시지
		 if(msg !== '') {
			 alert(msg);
			 //브라우저의 기록을 새롭게 변경(데이터, 페이지제목, 변경할주소)
			 //이렇게 변경된 기록정보는 history.state 객체를 통해서 확인이 가능합니다.
			 history.replaceState('', null, null); 
		 }
		     
	    
	    
	}



  /*   $(document).ready(function () {
      $("#uploadBtn").click(regist);

      function regist() {

        //회원만 등록 가능하도록 처리
        var writer = "${sessionScope.userVO.userId}";
        var file = $("#file").val();

        //파일 확장자체크
        file = file.substring(file.lastIndexOf('.') + 1, file.length).toLowerCase();
        console.log(file);

        if (file != "jpg" && file != "png" && file != "jpeg") {
          alert("이미지(jpg,png,jpeg)만 등록이 가능합니다")
          return;
        }
        else if (writer == '') { //세션이 없다면
          alert("로그인 필요한 서비스입니다")
          return;
        }
        document.freeRegistForm.submit(); //서브밋
      }; //등록 end  		

    });
 */
    
    //비밀글 체크 여부
	  var bbsOC = "off";
	  //태그.is(":속성") 체크여부 true/false
	  if( $("#bbsOC").is(":checked")){
		  bbsOC ="on";
		  
	  }
    
    

    </script>