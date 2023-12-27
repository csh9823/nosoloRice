package com.nosolorice.app.hancontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String noticeList(Model model) {
		
		List<Notice> nList = noticeService.NoticeList();
		
		model.addAttribute("nList",nList);
				
		return "/noticeList";
		
	}
	
	@RequestMapping("/noticeBusiness")
	public String noticeBusiness(Model model) {
		
		List<BusinessNotice> bList = noticeService.BusinessNoticeList();

		model.addAttribute("bList",bList);
		
		return "/noticeBusiness";
	}
	
	
	@RequestMapping("/noticeDetail")
	public String noticeDetail(Model model,int noticeNo) {
		
		Notice notice = noticeService.getNotice(noticeNo);
		
		model.addAttribute("notice",notice);
		
		return "/noticeDetail";
	}
	
	
	@RequestMapping("/noticeWrite")
	public String noticeWrite() {
		
		return"/noticeWrite";
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
		

			//System.out.println(noticeNo  + noticeType);
		Notice notice = noticeService.getNotice(noticeNo);
		
		notice.setNoticeType(noticeType);
	
		model.addAttribute("notice",notice);
		
		return "/noticeUpdate";
	}
	
	
	  @RequestMapping("/noticeUpdateProcess") 
	  public String noticeUpdateProcess(Model model,Notice notice) {
		    
		  	noticeService.updateNotice(notice);
		  	
		  return "redirect:/noticeList";
	  }
	 
	
	
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(int noticeNo) {
		
		
		noticeService.deleteNotice(noticeNo);
		
		return"redirect:noticeList";
	}
	
	/*
	 * @ReqeustMapping("/businessDeleteList") public STring bsuinessDelete(int )
	 * 
	 */
	
	

}
