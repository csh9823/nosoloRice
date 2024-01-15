package com.nosolorice.app.hancontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nosolorice.app.domain.businessUser.BusinessNotice;
import com.nosolorice.app.domain.normalUser.Notice;
import com.nosolorice.app.hanservice.NoticeService;

@Controller
public class NoticeCotroller {
	
	private NoticeService noticeService;
	
	
	@Autowired
	public NoticeCotroller(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	@RequestMapping("/noticeList")
	public String noticeList(Model model,@RequestParam(value="pageNum", defaultValue="1")int pageNum) {
		
		Map<String,Object> nList = noticeService.NoticeList(pageNum);
		
		model.addAllAttributes(nList);
		
		Map<String,Object> bList = noticeService.BusinessNoticeList(pageNum);

		model.addAllAttributes(bList);
		

		return "forward:/WEB-INF/views/noticeList.jsp";

		
	}
	
	//일반 공지사항
		@RequestMapping("/noticeNormal")
		public String noticeNormal(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1")int pageNum){
			
			Map<String,Object> noticeNormal = noticeService.NoticeList(pageNum);
			
			model.addAllAttributes(noticeNormal);
			
			return "/noticeNormal";
			
		}
		
	//사업 공지사항
		@RequestMapping("/noticeBusiness")
		public String noticeBusiness(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1")int pageNum){
			
			Map<String,Object> noticeBusiness = noticeService.BusinessNoticeList(pageNum);
			
			model.addAllAttributes(noticeBusiness);
			
			return "forward:/WEB-INF/views/noticeBusiness.jsp";
		}
	
	@RequestMapping("/noticeWrite")
	public String noticeWrite() {
		

		return"forward:WEB-INF/views/noticeWrite.jsp";

	}

	
	@RequestMapping("/noticeWriteProcess")
	public String noticeWriteProcess(Model model,String noticeType,String noticeTitle, String noticeContent) {
		
		Notice notice = new Notice();
		
		notice.setNoticeType(noticeType);
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);
		
		//System.out.println(notice.getNoticeContent());
		
		noticeService.insertNotice(notice);
		
		return"redirect:/noticeList";
		
		
	}
	
	
	@RequestMapping("/noticeUpdate")
	public String noticeUpdate (Model model,int noticeNo,String noticeType) {
			
		Notice notice = noticeService.getNotice(noticeNo);
		
		notice.setNoticeType(noticeType);
	
		model.addAttribute("notice",notice);
		

		return "forward:WEB-INF/views/noticeUpdate.jsp";

	}
	
	
	  @RequestMapping("/noticeUpdateProcess") 
	  public String noticeUpdateProcess(Model model,Notice notice) {
		    
		  	noticeService.updateNotice(notice);
		  	
		  return "redirect:/noticeList";
	  }
	  
	  
	  @RequestMapping("/businessNoticeUpdate")
	  public String BusinessUpdate(Model model, int businessNoticeNo,String businessNoticeType) {
		  
		  
		  
		  BusinessNotice businessNotice = noticeService.getBusinessnotice(businessNoticeNo);
		  
		  businessNotice.setBusinessNoticeType(businessNoticeType);
		  	  
		  model.addAttribute("businessNotice",businessNotice);	
		  

		  return "forward:WEB-INF/views/businessNoticeUpdate.jsp";

		  
	  }
	  
	  @RequestMapping("/businessNoticeUpdateProcess") 
	  public String businessNoticeUpdateProcess(Model model,BusinessNotice businessNotice) {
		    
		  	noticeService.updateBusinessNotice(businessNotice);
		  	
		  return "redirect:/noticeList";
	  }

	
	@RequestMapping("/noticeDelete")
	@ResponseBody
	public Map<String,Boolean> noticeDelete(int noticeNo) {
		
		 Map<String,Boolean> map = new HashMap<>(); 
		
		noticeService.deleteNotice(noticeNo);
		
		map.put("result",true);
		
		return map;
		
	}
	
	@RequestMapping("/businessNoticeDelete")
	@ResponseBody
	public Map<String,Boolean> businessNoticeDelete(int businessNoticeNo) {
		
		 Map<String,Boolean> map = new HashMap<>(); 
		
		noticeService.deleteBusinessNotice(businessNoticeNo);
		
		map.put("result",true);
		
		return map;
		
	}
	
	
	
	

}
