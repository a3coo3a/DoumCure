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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
		public HashMap<String, Object> getRo(@RequestParam("guname") String gu) {
			
			HashMap<String, Object> map = new HashMap();
			ArrayList<String> ro_list = storeService.getRo(gu);
			map.put("ro", ro_list);
			return map;
		}
}
