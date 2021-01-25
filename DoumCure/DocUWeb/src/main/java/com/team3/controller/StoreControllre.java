package com.team3.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team3.command.StoreVO;
import com.team3.store.service.StoreService;

@RestController
@RequestMapping("/medi")
public class StoreControllre {
	
	@Autowired
	@Qualifier("StoreService")
	private StoreService storeService;
	
	//구 호출
	@PostMapping("mediStore/getGu")
	public HashMap<String, Object> getGu(@RequestParam("siname") String si) {
		HashMap<String, Object> map = new HashMap();
		ArrayList<String> gu_list = storeService.getGu(si);
		map.put("gu", gu_list);
		return map;
	}
	
	//로 호출
		@PostMapping("mediStore/getRo")
		public HashMap<String, Object> getRo(@RequestBody StoreVO vo) {
			
			HashMap<String, Object> map = new HashMap();
			ArrayList<String> ro_list = storeService.getRo(vo);
			map.put("ro", ro_list);
			return map;
		}
		
	//시변경에 따른 맵 중심좌표변경
		@PostMapping("mediStore/changeMap")
		public HashMap<String, Object> changeMap(@RequestBody StoreVO vo) {
			HashMap<String,	Object> map = new HashMap<>();
			ArrayList<StoreVO> store_list = storeService.getList(vo);
			Double avgX = storeService.avgX(vo);
			Double avgY = storeService.avgY(vo);
			map.put("list", store_list);
			map.put("xCode", avgX);
			map.put("yCode", avgY);
			return map;
		}
		
	//키워드검색(키워드만)
		@PostMapping("mediStore/searchKeyword")
		public HashMap<String, Object> searchKeyword(@RequestParam("keyword") String key) {
			HashMap<String, Object> map = new HashMap();
			ArrayList<StoreVO> vo_list = storeService.searchKeyword(key);
			map.put("key", vo_list);
			return map;
		}
		
	//키워드검색(지역 + 키워드)
		@PostMapping("mediStore/searchKeywordLoca")
		public HashMap<String, Object> searchKeywordLoca(@RequestBody StoreVO vo) {
			HashMap<String,	Object> map = new HashMap<>();
			ArrayList<StoreVO> vo_list = storeService.searchKeywordLoca(vo);
			map.put("key", vo_list);

			return map;
		}
}
