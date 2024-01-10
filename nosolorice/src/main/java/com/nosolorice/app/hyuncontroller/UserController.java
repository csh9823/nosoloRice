package com.nosolorice.app.hyuncontroller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingUserList;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.businessUser.Menu;
import com.nosolorice.app.domain.normalUser.BlockHistory;
import com.nosolorice.app.domain.normalUser.ChatHistory;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;
import com.nosolorice.app.domain.normalUser.UserInquiry;
import com.nosolorice.app.hyunservice.UserService;

@Controller
public class UserController {
	
	private UserService userService;
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping("mainPage")
	public String mainPage(@RequestParam(value="introduce", required=false) boolean introduce, Model model) {
		model.addAttribute("introduce", introduce);
		return "mainPage";
	}
	
	@RequestMapping("userInquiry")
	public String userInquiry(Model model) {
		return "userInquiry";
	}
	
	@RequestMapping("userInquiryList")
	public String userInquiryList(Model model, @RequestParam(required=false, defaultValue="1") int pageNum, HttpSession session) {
		
		/*
		 * BusinessUser bUser = (BusinessUser)session.getAttribute("businessUser");
		 * String businessId = bUser.getBusinessId();
		 */
		
		String normalId = "testNormalId";
		
		model.addAllAttributes(userService.getUserInquiryList(pageNum, normalId));
		
		return "userInquiryList";
	}
	
	@RequestMapping("writeUserInquiry")
	public String writeUserInquiry(Model model, UserInquiry userInquiry, 
			@RequestParam(value="file1", required=false)MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException {
		String defaultPath = "/resources/upload/";	
		
		if(!multipartFile.isEmpty()) {
			String filePath = 
					request.getServletContext().getRealPath(defaultPath);

			UUID uid = UUID.randomUUID();
			String saveName = 
					uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);		

			multipartFile.transferTo(file);

			userInquiry.setInquiryPicture(saveName);
		}
		userService.writeUserInquiry(userInquiry);
		return "redirect:/userInquiryList";
	}
	
	@RequestMapping("matching")
	public String matching() {
		return "matching";
	}
	
	@RequestMapping("chating")
	public String chating() {
		return "chating";
	}
	
	@RequestMapping("matchingComplete")
	@ResponseBody
	public Map<String, Boolean> matchingComplete(@RequestBody Map<String, Object> requestMap, HttpSession session){
		NormalUser userInfo = (NormalUser)session.getAttribute("NormalUser");		
		requestMap.put("id", userInfo.getNormalId());
		userService.addChatRoom(requestMap);
		userService.addChatMember(requestMap);
		
		Map<String, Boolean> map = new HashMap<>();
		map.put("success", true);
		return map;
	}
	
	@RequestMapping("chatMemberCheck")
	@ResponseBody
	public Map<String, Object> chatMemberCheck(String id){
		return userService.chatMemberCheck(id);
	}
	
	@RequestMapping("addChatMessage")
	@ResponseBody
	public Map<String, Boolean> addChatMessage(ChatHistory chatHistory){
		userService.addChatMessage(chatHistory);
		Map<String, Boolean> map = new HashMap<>();
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("chatImgUpload")
	@ResponseBody
	public Map<String, String> chatImgUpload(@RequestParam(value="image") MultipartFile mf, HttpServletRequest request) throws IllegalStateException, IOException{
		Map<String, String> map = new HashMap<>();
		
		if(! mf.isEmpty()) {
			String filePath = request.getServletContext().getRealPath("/resources/upload/");					
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + mf.getOriginalFilename();
			File file = new File(filePath, saveName);
			mf.transferTo(file);
			map.put("fileName", saveName);
		}
		
		return map;
	}
	
	@RequestMapping("isMatchingCheck")
	@ResponseBody
	public Map<String, Boolean> isMatchingCheck(String id){
		Map<String, Boolean> map = new HashMap<>();
		boolean result = userService.isMatchingCheck(id);
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping("getStoreListByMap")
	@ResponseBody
	public List<BusinessUser> getStoreListByMap(double lat, double lng, 
			@RequestParam(value="sortType", required=false, defaultValue="distance") String sortType){
		return userService.getStoreListByMap(lat, lng, sortType);
	}
	
	@RequestMapping("getStoreListByAddress")
	@ResponseBody
	public List<BusinessUser> getStoreListByAddress(String address, 
			@RequestParam(value="sortType", required=false, defaultValue="regdate") String sortType){
		return userService.getStoreListByAddress(address, sortType);
	}
	
	@RequestMapping("searchStoreListByMap")
	@ResponseBody
	public List<BusinessUser> searchStoreListByMap(double lat, double lng, String keyword, 
			@RequestParam(value="sortType", required=false, defaultValue="distance") String sortType){
		return userService.searchStoreListByMap(lat, lng, keyword, sortType);
	}
	
	@RequestMapping("searchStoreListByAddress")
	@ResponseBody
	public List<BusinessUser> searchStoreListByAddress(String address, String keyword, 
			@RequestParam(value="sortType", required=false, defaultValue="regdate") String sortType){
		return userService.searchStoreListByAddress(address, keyword, sortType);
	}
	
	@RequestMapping("getChatStoreReviewList")
	@ResponseBody
	public List<Review> getReviewList(String businessId){
		return userService.getReviewList(businessId);
	}
	
	@RequestMapping("getChatStoreMenuList")
	@ResponseBody
	public List<Menu> getMenuList(String businessId){
		return userService.getMenuList(businessId);
	}
	
	@RequestMapping("getReviewWriterInfo")
	@ResponseBody
	public NormalUser getReviewWriterInfo(String normalId) {
		return userService.getReviewWriterInfo(normalId);
	}
	
	@RequestMapping("getBusinessUserInfo")
	@ResponseBody
	public BusinessUser getBusinessUserInfo(String businessId) {
		return userService.getBusinessUserInfo(businessId);
	}
	
	@RequestMapping("getNormalUserInfo")
	@ResponseBody
	public NormalUser getNormalUserInfo(String normalId) {
		return userService.getNormalUserInfo(normalId);
	}
	
	
	@RequestMapping("addChatMemberReport")
	@ResponseBody
	public Map<String, Boolean> addChatMemberReport(ReportDetails report) {
		userService.addChatMemberReport(report);
		Map<String, Boolean> map = new HashMap<>();
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("addChatMemberBlock")
	@ResponseBody
	public Map<String, Boolean> addChatMemberBlock(BlockHistory block) {
		userService.addChatMemberBlock(block);
		Map<String, Boolean> map = new HashMap<>();
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("getBlockList")
	@ResponseBody
	public List<BlockHistory> getBlockList(String blocker){
		return userService.getBlockList(blocker);
	}
	
	@RequestMapping("addBooking")
	@ResponseBody
	public Map<String, Integer> addBooking(
			@RequestParam("bookingCount") int bookingCount, 
			@RequestParam("bookingRequest") String bookingRequest, 
			@RequestParam("bookingTime") String bookingTime, 
			@RequestParam("bookingState") String bookingState, 
			@RequestParam("businessId") String businessId, 
			@RequestParam("deposit") int deposit, 
			@RequestParam("bookingChatName") String bookingChatName) throws ParseException{
		
		System.out.println("여기부터 booking객체 출력 시작");
		System.out.println(bookingCount);
		System.out.println(bookingRequest);
		System.out.println(bookingTime);
		System.out.println(bookingState);
		System.out.println(deposit);
		System.out.println(businessId);
		System.out.println(bookingChatName);
		System.out.println("여기부터 booking객체 출력 끝");


        // SimpleDateFormat을 이용하여 시간 형식을 해석
        SimpleDateFormat format = new SimpleDateFormat("a hh시mm분");
        Date parsedDate;

            parsedDate = format.parse(bookingTime);
            LocalDateTime currentDateTime = LocalDateTime.now();
            currentDateTime = currentDateTime.withHour(parsedDate.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalTime().getHour())
                                             .withMinute(parsedDate.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalTime().getMinute())
                                             .withSecond(0)
                                             .withNano(0);
            Timestamp timestamp = Timestamp.valueOf(currentDateTime);
            System.out.println("변환된 Timestamp: " + timestamp);

		Booking booking = new Booking();
		booking.setBookingCount(bookingCount);
		booking.setBookingRequest(bookingRequest);
		booking.setBookingTime(timestamp);
		booking.setBookingState(bookingState);
		booking.setDeposit(deposit);
		booking.setBusinessId(businessId);
		booking.setBookingChatName(bookingChatName);
		int bookNo = userService.addBooking(booking);
		Map<String, Integer> map = new HashMap<>();
		map.put("bookNo", bookNo);
		System.out.println("반환된 bookNo : " + bookNo);
		return map;
	} 
	
	@RequestMapping("deleteBooking")
	@ResponseBody
	public Map<String, Boolean> deleteBooking(String businessId, int bookingBookNo){
		System.out.println("컨트롤러에서 deleteBooking businessId : " + businessId);
		System.out.println("컨트롤러에서 deleteBooking bookingBookNo : " + bookingBookNo);
		userService.deleteBooking(businessId, bookingBookNo);
		Map<String, Boolean> map = new HashMap<>();
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("deleteChatMember")
	@ResponseBody
	public Map<String, Boolean> deleteChatMember(String normalId){
		System.out.println("컨트롤러에서 normalId : " + normalId);
		userService.deleteChatMember(normalId);
		Map<String, Boolean> map = new HashMap<>();
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("addBookingUserList")
	@ResponseBody
	public Map<String, Boolean> addBookingUserList(String businessId, String normalId, @RequestParam("bookNo") int bookNo){
		BookingUserList bul = new BookingUserList();
		bul.setBusinessId(businessId);
		bul.setNormalId(normalId);
		System.out.println("컨트롤러에서 bul : " + bul);
		System.out.println("컨트롤러에서 bookNo : " + bookNo);
		userService.addBookingUserList(bul, bookNo);
		Map<String, Boolean> map = new HashMap<>();
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("deleteBookingUserList")
	@ResponseBody
	public Map<String, Boolean> deleteBookingUserList(String normalId){
		userService.deleteBookingUserList(normalId);
		Map<String, Boolean> map = new HashMap<>();
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("payWithPoint")
	@ResponseBody
	public Map<String, Boolean> payWithPoint(String normalId, int deposit){
		userService.payWithPoint(normalId, deposit);
		Map<String, Boolean> map = new HashMap<>();
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("getBookingUserList")
	@ResponseBody
	public List<NormalUser> getBookingUserList(int bookingNo){
		List<NormalUser> nickNames = userService.getBookingUserList(bookingNo);
		return nickNames;
	}
	
}
