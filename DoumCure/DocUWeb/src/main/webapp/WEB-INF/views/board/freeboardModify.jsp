<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<section>
        <div class="BLQA-area">
            <div class="container board_list_container ">
                <div class="row content-wrap">
                    <div class="qa_blr_title_box col-lg-12 ">
                        <p>자유게시판 수정하기</p>
                    </div>
                </div>
            </div>
    
            <form action="freeModiForm" method="post" name="freeModiForm" enctype="multipart/form-data">
    
                <div class="container">
                    <div class="container-inner row">
                    
                    <div class="innertitle col-md-3 col-sm-12">NUM</div>
					<div class="inner-control col-md-7 col-sm-12 ">
						<input class="form-control  " name="num"
							value="${vo.bbsNo}"readonly>
					</div>
    
                        <div class="innertitle col-md-3 col-sm-12">
                            NAME
                        </div>
                        <!-- <td><input class="form-control input-sm" name="writer" value="${sessionScope.userVO.userId }" readonly><span id="msgId"></span></td> -->
                        <div class="inner-control col-md-7 col-sm-12 ">
                            <input class="form-control " name="writer"  
                          value="${vo.bbsWrite}" readonly>
                        </div>
    
    
                        <div class="innertitle col-md-3 col-sm-12">
                            TITLE</div>
                        <div class="inner-control  col-md-7 col-sm-12 ">
                            <input class="form-control Large input " name="title" value="${vo.bbsTitle}">
                        </div>
    
                        	<div class="innertitle col-md-3 col-sm-12">COMMNET</div>
					<div class="inner-control  col-md-7 col-sm-12 ">
						<div class="reply-content">
							<div class="fileDiv">
								<img id="fileImg" src="../resources/img/title_icon.png">

							</div>
								<div class="reply-group">
								<img class="img-thumbnail" src="display/${vo.fileLoca}/${vo.fileName}"><br>			
								<label for="file">이미지업로드</label>
							 <input type="file" name="file"id="file"> 
							</div>

								<textarea class="form-control" rows="10" name="content"
								id="content" >${vo.bbsContent }</textarea>
							<div class="content-down-l">
								<input type="checkbox" id="bbsCO" name="bbsOC" value="${vo.bbsOC }" checked="checked" > 비밀글 
							</div>


							<div class="content-down-r">
								<button type="button" class="btn btn-danger" id="deleteBtn" onclick="location.href='freeboardelete?bbsNo=${vo.bbsNo}' ">삭제하기</button>
								<button type="button" class="btn btn-danger" id="updateBtn" onclick="location.href='freeboardModify?bbsNo=${vo.bbsNo}' ">수정완료</button>
							<button  type="button"  class="btn" onclick="location.href='freeboardList' ">목록</button>
								</div>
						</div>
					</div>

				</div>
			</div>
		</form>

	</div>
</section>

<script> 

/* var updateBtn = document.getElementById("updateBtn");
updateBtn.onclick = function () {
	if(document.freeModiForm.title.value === ''){
		alert("제목은 필수입니다.")
		document.freeModiForm.title.focus();
	}else if (document.freeModiForm.content.value === '' ){
		alert("제목은 필수입니다.")
		document.freeModiForm.content.focus();
	} else {
		
	}
}



var deleteBtn = document.getElementById("deleteBtn");
deleteBtn.onclick = function () {

}
*/
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