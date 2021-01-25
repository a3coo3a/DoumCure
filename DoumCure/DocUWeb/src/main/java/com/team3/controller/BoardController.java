package com.team3.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.board.service.BoardService;
import com.team3.command.BoardVO;
import com.team3.command.UserVO;
import com.team3.common.util.Criteria;
import com.team3.common.util.PageVO;



@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	
	//자유게시판 글 목록
	@RequestMapping("/freeboardList")
	public String freeList(Model model, Criteria cri) {
		
		//화면으로 넘어갈 때 글정보를 가지고 갈수 있도록 처리 getList()로 조회한 결과를 리스트화면에 출력.
		
		ArrayList<BoardVO> list = boardService.getfreeList(cri);
		System.out.println(list);
		int total = boardService.getTotal(cri);//전체 게시물 수 
		System.out.println(total);
		PageVO pageVO = new PageVO(cri, total);
			
		//화면에 전달할 값
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);
		
		
		return "board/freeboardList";
	}
	
	
	//글 등록 화면
	@RequestMapping("/freeboardRegist")
	public String freeboardRegist() {
		
		return "board/freeboardRegist";
	}
	
	
	
	//글 등록
//	@RequestMapping(value = "/freeRegistForm", method = RequestMethod.POST)
//	public String registForm(BoardVO vo, RedirectAttributes RA) {
//		
//		boardService.freeRegist(vo); //insert실행
//		RA.addFlashAttribute("msg", "정상적으로 등록처리 되었습니다"); //메시지를 리스트 화면으로 전달
//
//		return "redirect:/board/freeboardList";
//	}

	@RequestMapping(value = "/freeRegistForm", method = RequestMethod.POST)
	public String upload(
			 @RequestParam("file") MultipartFile file,
			 @RequestParam("bbsTitle") String bbsTitle ,
			 @RequestParam("bbsContent") String bbsContent,
			 @RequestParam(value = "bbsOC" , defaultValue = "off") String bbsOC,
			 @RequestParam(value = "bbsCate", defaultValue = "free" ) String bbsCate,
			 HttpSession session) {
		
		try {
		
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		String bbsWrite = userVO.getUserId(); //작성자정보
				
		System.out.println(file);
		System.out.println(bbsContent);
		
		//1. 날짜별로 폴더로 관리
		Date date  = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fileLoca = sdf.format(date);
					
		//2. 저장할 폴더
		String uploadPath = "D:\\spring\\upload\\" + fileLoca;
		
		File folder = new File(uploadPath);
		if(!folder.exists() ) {
			folder.mkdir(); //폴더생성
		}
		
		//3. 서버에 저장할 파일 이름
		String fileRealName = file.getOriginalFilename(); //파일이름 
		Long size = file.getSize(); //파일사이즈
		String fileExtension = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length()); //확장자
					
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replaceAll("-", "");
		
		String fileName = uuids + fileExtension ;//변경해서 저장할 파일이름
		
		System.out.println("=================");
		System.out.println("작성자:" + bbsWrite);
		System.out.println("제목: " + bbsTitle);
		System.out.println("내용:" +  bbsContent);
		System.out.println("비밀글" + bbsOC );
		System.out.println("저장할폴더:" + uploadPath);
		System.out.println("파일실제이름:" + fileRealName);
		System.out.println("파일사이즈:" + size);
		System.out.println("파일확장자:" + fileExtension);
		System.out.println("변경해서저장할파일명:" + fileName);
		System.out.println("카테고리:"+ bbsCate);
		
		//4. 파일 업로드처리
		File saveFile = new File(uploadPath + "\\" + fileName);
		file.transferTo(saveFile); //스프링의 업로드처리
		
		//5. DB에 insert작업
		BoardVO vo = new BoardVO(0, bbsWrite, bbsTitle, bbsContent, uploadPath, fileLoca, fileName, fileRealName, bbsOC, bbsCate, null);
		boardService.insertFile(vo); //성공시 true, 실패시 false

		} catch (NullPointerException e) {
			System.out.println("세션정보가 없음");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();			
		}
		
		return "redirect:/board/freeboardList";
		
	}
				
	

	
	//상세화면과 변경화면이 기능이 같기 때문에 하나로 묶어서 사용합니다.
		@RequestMapping(value = {"/freeboardDetail", "/freeboardModify"})
		public void freeModify(@RequestParam("bbsNo") int bbsNo, Model model ) {
			
			
			//화면으로 넘어갈때 bno기반의 데이터를 가지고 상세화면으로 가도록 getContent()로 처리
			BoardVO vo = boardService.getfreeContent(bbsNo);
			model.addAttribute("vo", vo); //bno게시글에 대한 정보
			
			
			System.out.println(vo.toString());
			//void형 메서드는 요청의 결과가 디스패쳐서블릿으로 return됩니다.
		}
		
	
		//이미지불러오기
				@RequestMapping("/display/{fileLoca}/{fileName:.+}")
				@ResponseBody
				public ResponseEntity<byte[]> getFile(@PathVariable("fileLoca") String fileLoca,
													@PathVariable("fileName") String fileName) {
				System.out.println(fileLoca);
				System.out.println(fileName);

					
					
				String uploadPath = "D:/spring/upload/" +fileLoca ;
				
				//파일 객체 생성
				File file = new File( uploadPath + "\\" + fileName);

				ResponseEntity<byte[]> result = null;

				try {
					if(fileName!=null & fileName.length()!=0) {
						HttpHeaders header = new HttpHeaders();
						header.add("contehn-Type", Files.probeContentType(file.toPath()));
						byte[] arr =  FileCopyUtils.copyToByteArray(file);
						result = new ResponseEntity<byte[]>(arr, header, HttpStatus.OK);
		
					}
				} catch (IOException e) {

				e.printStackTrace();

				}

				return result;
				}
		
//		@RequestMapping("/getList")
//		@ResponseBody
//		public ArrayList<SnsBoardVO> geList(){
//			
//			ArrayList<SnsBoardVO> list = snsBoardService.getList();
//			
//			System.out.println(list.toString());
//			
//			
//			return list;
//			
//		}
//		

	
	
		//글 업데이트
		@RequestMapping(value = "/freeModiForm", method = RequestMethod.POST)
		public String freeUpdate(BoardVO vo, RedirectAttributes RA) {
			
			int result = boardService.freeupdate(vo);		
			
			if(result == 1) { //업데이트 성공
				RA.addFlashAttribute("msg", "정상적으로 수정되었습니다");
			} else { //업데이트 실패
				RA.addFlashAttribute("msg", "수정에 실패했습니다");
			}
			
			return "redirect:/board/freeboardList";
		}
		
		
		
		
		
		//삭제
		@RequestMapping(value = "/freeboardelete")
		public String freeboardelet(@RequestParam("bbsNo") int bbsNo, RedirectAttributes RA) {
			
			int result = boardService.freeDelete(bbsNo);
			
			if(result == 1) {
				RA.addFlashAttribute("msg", bbsNo + "번 게시글이 삭제 되었습니다");
			} else {
				RA.addFlashAttribute("msg", "게시글 삭제에 실패했습니다");
			}
			
			return "redirect:/board/freeboardList";
		}
		

		
		
		
		
//		=====================================
		
		
		@RequestMapping(value = "/bbsList")
		public String bbslist() {
			
			return "board/bbsList";
		}
		
		
		
		
		
		
	}
