<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section>
	<div class="bbs-area">
		<div class="container bbs-list-container  ">
			<div class="row bbs-content-wrap">
				<div class="bbs-list-title-box col-xs-3, col-md-12">
					<p>관리자 게시글 수정하기</p>
				</div>

				<form action="detailForm" method="post" name="detailForm"
					enctype="multipart/form-data">
					<div class="t-control">
						<div>
							<input class="form-control Large input " id="board-title-sel"
								name="title" value="건강정보" readonly>
						</div>
						<div>
							<div class="t-title">NAME</div>
							<div>
								<input class="form-control Large input " name="writer"
									value="${sessionScope.userVO.userId }" readonly>
							</div>
						</div>

						<div>
							<div class="t-title">TITLE</div>
							<div>
								<input class="form-control Large input " name="bbsTitle">
							</div>
						</div>
						<div>
							<div class="t-title col-md-12 col-sm-12">COMMNET</div>
							<div class="inner-control  col-md-12 col-sm-12 ">
								<div class="reply-content">
									<div class="fileDiv"></div>
									<div class="reply-group" style="text-align: center;">
										<img class="img-thumbnail"
											src="display/${vo.fileLoca}/${vo.fileName}">
									</div>
									<br>
									<textarea class="form-control" rows="10" name="content"
										id="content">${vo.bbsContent }</textarea>
									<div class="content-down-l"></div>
									<div class="content-down-r">
										<button type="button" class="btn btn-danger" id="deletBtn"
										onclick="location.href='bbsdelete?bbsNo=${vo.bbsNo}' ">삭제하기</button>
										<button type="button" class="btn btn-info" id="updateBtn">수정완료</button>
										<button type="button" class="btn"
											onclick="location.href='bbsList' ">목록</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>


<script>
	function setThumbnail(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	
	
	

	$(document).ready(function () {

	    $("#updateBtn").click(regist);

	    function regist() {

	      //회원만 등록 가능하도록 처리
	      var writer = "${sessionScope.userVO.userId}";
	      var file = $("#file").val();

	      //파일 확장자체크
	      file = file.substring(file.lastIndexOf('.') + 1, file.length).toLowerCase();
	      console.log(file);

	     /*  if (file != "jpg" && file != "png" && file != "jpeg") {
	        alert("이미지(jpg,png,jpeg)만 등록이 가능합니다")
	        return;
	      }
	      else */
	    	  if (writer == '') { //세션이 없다면
	        alert("로그인 필요한 서비스입니다")
	        return;
	      }
	      document.freeModiForm.submit(); //서브밋
	    }; //등록 end  		

	    
	  });




	
	
	
	
	
	
	
	
	
	
	
</script>