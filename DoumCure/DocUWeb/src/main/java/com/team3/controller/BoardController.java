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
		int total = boardService.getTotal(cri);//전체 게시물 수 
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

		//1. 날짜별로 폴더로 관리
		Date date  = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fileLoca = sdf.format(date);
					
		//2. 저장할 폴더
		String uploadPath = "c:\\spring\\upload\\" + fileLoca;
		
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
				
	
	//상세화면과 변경화면이 기능이 같기 때문에 하나로 묶어서 사용합니다. (자유게시판, 건강게시판)
		@RequestMapping(value = {"/freeboardDetail", "/freeboardModify", "bbsDetail", "bbsModify"})
		public void freeModify(@RequestParam("bbsNo") int bbsNo, Model model ) {
			
			//화면으로 넘어갈때 bno기반의 데이터를 가지고 상세화면으로 가도록 getContent()로 처리
			BoardVO vo = boardService.getfreeContent(bbsNo);
			model.addAttribute("vo", vo); //bno게시글에 대한 정보

			//void형 메서드는 요청의 결과가 디스패쳐서블릿으로 return됩니다.
		}
		
		//이미지불러오기
				@RequestMapping("/display/{fileLoca}/{fileName:.+}")
				@ResponseBody
				public ResponseEntity<byte[]> getFile(@PathVariable("fileLoca") String fileLoca,
													@PathVariable("fileName") String fileName) {

				String uploadPath = "c:/spring/upload/" +fileLoca ;
				System.out.println("파일추가:"+fileLoca + fileName);
				//파일 객체 생성
				File file = new File( uploadPath + "\\" + fileName);

				ResponseEntity<byte[]> result = null;

				try {
				    HttpHeaders header = new HttpHeaders();
				    header.add("contehn-Type", Files.probeContentType(file.toPath()));

				byte[] arr =  FileCopyUtils.copyToByteArray(file);

				result = new ResponseEntity<byte[]>(arr, header, HttpStatus.OK);
				} catch (IOException e) {

				e.printStackTrace();

				}

				return result;
				}
		
				//자유게시판 수정 
		@RequestMapping(value = "/freeModiForm", method = RequestMethod.POST)
		public String upload2(
				 @RequestParam("file") MultipartFile file,
				 @RequestParam("bbsNo") int bbsNo,
				 @RequestParam("bbsTitle") String bbsTitle ,
				 @RequestParam("bbsContent") String bbsContent,
				 @RequestParam(value = "bbsOC" , defaultValue = "off") String bbsOC,
				 @RequestParam(value = "bbsCate", defaultValue = "free" ) String bbsCate,
				 @RequestParam("gdsImg1") String gdsImg1,
				 @RequestParam("gdsImg2") String gdsImg2,
				 HttpSession session) {
			
			try {
				
				UserVO userVO = (UserVO)session.getAttribute("userVO");
				String bbsWrite = userVO.getUserId(); //작성자정보

				if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				
				//1. 날짜별로 폴더로 관리
				Date date  = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String fileLoca = sdf.format(date);
				//2. 저장할 폴더
				String uploadPath = "c:\\spring\\upload\\" + fileLoca;
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
								
				//4. 파일 업로드처리
				File saveFile = new File(uploadPath + "\\" + fileName);
				file.transferTo(saveFile); //스프링의 업로드처리
				
				//5. DB에 insert작업
				BoardVO vo = new BoardVO(bbsNo, bbsWrite, bbsTitle, bbsContent, uploadPath, fileLoca, fileName, fileRealName, bbsOC, bbsCate, null);
				boardService.freeupdate(vo); //성공시 true, 실패시 false
				} else {
					BoardVO vo = new BoardVO(bbsNo, null , bbsTitle, bbsContent, null, null, null, null, bbsOC, null, null );
					boardService.freeupdate2(vo);
					
				}
				
				} catch (NullPointerException e) {
//					System.out.println("세션정보가 없음");
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();			
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
		

		
//		=============== 공지사항 컨트롤러======================
		
		//건강정보 목록 화면
//		@RequestMapping(value = "/bbsList")
//		public String bbslist() {
//			
//			return "board/bbsList";
//		}
		
		//건장정보 글 목록
		@RequestMapping("/bbsList")
		public String notiList(Model model, Criteria cri) {	
			//화면으로 넘어갈 때 글정보를 가지고 갈수 있도록 처리 getList()로 조회한 결과를 리스트화면에 출력.
			ArrayList<BoardVO> list = boardService.getnotiList(cri);
			int total = boardService.getTotal2(cri);//전체 게시물 수 
			PageVO pageVO = new PageVO(cri, total);	
			//화면에 전달할 값
			model.addAttribute("list", list);
			model.addAttribute("pageVO", pageVO);
			
			return "board/bbsList";
		}
		
		//건강정보 등록 화면
		@RequestMapping(value = "/bbsRegist")
		public String bbsRegist() {
			
			return "board/bbsRegist";
		}
		
		
		
		//건강정보 글 등록
		@RequestMapping(value = "/registForm", method = RequestMethod.POST)
		public String infoupload1(
				 @RequestParam("file") MultipartFile file,
				 @RequestParam("bbsTitle") String bbsTitle ,
				 @RequestParam("bbsContent") String bbsContent,
				 @RequestParam(value = "bbsCate", defaultValue = "health" ) String bbsCate,
				 HttpSession session) {
			
			try {
			
			UserVO userVO = (UserVO)session.getAttribute("userVO");
			String bbsWrite = userVO.getUserId(); //작성자정보

			//1. 날짜별로 폴더로 관리
			Date date  = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String fileLoca = sdf.format(date);
						
			//2. 저장할 폴더
			String uploadPath = "c:\\spring\\upload\\" + fileLoca;
			
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
			
			//4. 파일 업로드처리
			File saveFile = new File(uploadPath + "\\" + fileName);
			file.transferTo(saveFile); //스프링의 업로드처리
			
			//5. DB에 insert작업
			BoardVO vo = new BoardVO(0, bbsWrite, bbsTitle, bbsContent, uploadPath, fileLoca, fileName, fileRealName, null, bbsCate, null);
			boardService.insertFile2(vo); //성공시 true, 실패시 false

			} catch (NullPointerException e) {
				System.out.println("세션정보가 없음");
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();			
			}
			
			return "redirect:/board/bbsList";
		}
		
		
		
		//건강정보 수정 
		@RequestMapping(value = "/bbsModiForm", method = RequestMethod.POST)
		public String infoupload2(
				 @RequestParam("file") MultipartFile file,
				 @RequestParam("bbsNo") int bbsNo,
				 @RequestParam("bbsTitle") String bbsTitle ,
				 @RequestParam("bbsContent") String bbsContent,
				 @RequestParam(value = "bbsOC" , defaultValue = "off") String bbsOC,
				 @RequestParam(value = "bbsCate", defaultValue = "free" ) String bbsCate,
				 @RequestParam("gdsImg1") String gdsImg1,
				 @RequestParam("gdsImg2") String gdsImg2,
				 HttpSession session) {
			
			try {
				
				UserVO userVO = (UserVO)session.getAttribute("userVO");
				String bbsWrite = userVO.getUserId(); //작성자정보

				if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				
				//1. 날짜별로 폴더로 관리
				Date date  = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String fileLoca = sdf.format(date);
				//2. 저장할 폴더
				String uploadPath = "c:\\spring\\upload\\" + fileLoca;
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
								
				//4. 파일 업로드처리
				File saveFile = new File(uploadPath + "\\" + fileName);
				file.transferTo(saveFile); //스프링의 업로드처리
				
				//5. DB에 insert작업
				BoardVO vo = new BoardVO(bbsNo, bbsWrite, bbsTitle, bbsContent, uploadPath, fileLoca, fileName, fileRealName, bbsOC, bbsCate, null);
				boardService.freeupdate(vo); //성공시 true, 실패시 false
				} else {
					BoardVO vo = new BoardVO(bbsNo, null , bbsTitle, bbsContent, null, null, null, null, bbsOC, null, null );
					boardService.freeupdate2(vo);
					
				}
				
				} catch (NullPointerException e) {
//					System.out.println("세션정보가 없음");
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();			
				}
		
			return "redirect:/board/bbsList";
			
		}
		
		
		//삭제
				@RequestMapping(value = "/bbsdelete")
				public String bbsdelet(@RequestParam("bbsNo") int bbsNo, RedirectAttributes RA) {
					
					int result = boardService.bbsDelete(bbsNo);
					
					if(result == 1) {
						RA.addFlashAttribute("msg", "게시글이 삭제 되었습니다");
					} else {
						RA.addFlashAttribute("msg", "게시글 삭제에 실패했습니다");
					}
					
					return "redirect:/board/bbsList";
				}
		
	}
