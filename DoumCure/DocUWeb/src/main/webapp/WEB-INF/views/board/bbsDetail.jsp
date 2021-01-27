<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section>
	<div class="bbs-area">
		<div class="container bbs-list-container  ">
			<div class="row bbs-content-wrap">
				<div class="bbs-list-title-box col-xs-3, col-md-12">
					<p>관리자 게시글 상세보기</p>
				</div>

				<form action="detailForm" method="post" name="detailForm" 	enctype="multipart/form-data">
					<div class="t-control">
						<div>
							<input class="form-control Large input " id="board-title-sel"
								name="title" value="건강정보" readonly>
						</div>

						<div>
							<div class="t-title">NAME</div>
							<div>
								<input class="form-control Large input " name="writer"
									value="${vo.bbsWrite }" readonly>
							</div>
						</div>

						<div>
							<div class="t-title">TITLE</div>
							<div>
								<input class="form-control Large input " name="${vo.bbsTitle}"
									readonly>
							</div>
						</div>

						<div>
							<div class="t-title col-md-12 col-sm-12">COMMNET</div>
							<div class="inner-control  col-md-12 col-sm-12 ">
								<div class="reply-content">
									<div class="fileDiv">
										<!-- 		<img id="fileImg" src="../resources/img/title_icon.png"> -->
									</div>

									<div class="reply-group" style="text-align: center;">
										<%-- <img src="view/fileLoca=${vo.fileLoca}&fileName=${vo.fileName}">	 --%>

										<img class="img-thumbnail"
											src="display/${vo.fileLoca}/${vo.fileName}" >
										<!-- <label for="file">이미지업로드</label> <input type="file" name="file"id="file">  -->
									</div>
	<br>
									<textarea class="form-control" rows="10" name="content"
										id="content" readonly>${vo.bbsContent }</textarea>
									<div class="content-down-l">
									</div>

									<div class="content-down-r">
										<button type="button" class="btn btn-info" id="modifyBtn"
											onclick="location.href='bbsModify?bbsNo=${vo.bbsNo}&writer=${vo.bbsWrite }'">수정하기</button>
										<button class="btn" type="button" onclick="location.href='freeList ">목록</button>
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

      reader.onload = function (event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        document.querySelector("div#image_container").appendChild(img);
      };
      reader.readAsDataURL(event.target.files[0]);
    }

    // <i class="fa fa-unlock-alt"></i>
    // <i class="fa fa-unlock"></i>

    function change(lock) {
      if (document.getElementById(lock).className == "fa fa-unlock") {
        document.getElementById(lock).className = "fa fa-unlock-alt";
        document.getElementById(lock).innerHTML = "잠금하기";
      }
      else {
        document.getElementById(lock).className = "fa fa-unlock";
        document.getElementById(lock).innerHTML = "잠금해제";

      }

    }

  </script>