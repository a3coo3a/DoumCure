package com.team3.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file,
			 @RequestParam("bbsTitle") String bbsTitle ,
			 @RequestParam("bbsContent") String bbsContent ,
			 @RequestParam("lock") String bbsOC,
			 HttpSession session) {
		
		try {
		
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		String bbsWriter = userVO.getUserId(); //작성자정보
		
		
		//System.out.println(file);
		//System.out.println(content);
		
		//1. 날짜별로 폴더로 관리
		Date date  = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fileLoca = sdf.format(date);
					
		//2. 저장할 폴더
		String upLoadPath = "D:\\spring\\upload\\" + fileLoca;
		
		File folder = new File(upLoadPath);
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
		System.out.println("저장할폴더:" + upLoadPath);
		System.out.println("파일실제이름:" + fileRealName);
		System.out.println("파일사이즈:" + size);
		System.out.println("파일확장자:" + fileExtension);
		System.out.println("변경해서저장할파일명:" + fileName);
		
		//4. 파일 업로드처리
		File saveFile = new File(upLoadPath + "\\" + fileName);
		file.transferTo(saveFile); //스프링의 업로드처리
		
		//5. DB에 insert작업
		BoardVO vo = new BoardVO(0, bbsWriter, bbsTitle, bbsContent, upLoadPath, fileLoca, fileName, fileRealName, bbsOC, null, null);
		boolean result = boardService.insertFile(vo); //성공시 true, 실패시 false
		
		if(result) { //성공
			return "redirect:/board/freeboardList";
		} else {
			return "fail";
		}


		} catch (NullPointerException e) {
			System.out.println("세션정보가 없음");
			return "fail";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		
	}
			
		
		
	
	
	
	//글 상세 
	
	//글 변경화면
	
	
	//글 업뎃
	
	
	//글 삭제
	
	
	
	
}
