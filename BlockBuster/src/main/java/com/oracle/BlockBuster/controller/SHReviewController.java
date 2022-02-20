package com.oracle.BlockBuster.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.BlockBuster.model.SHGoodModel;
import com.oracle.BlockBuster.model.SHReviewModel;
import com.oracle.BlockBuster.model.SHSearchModel;
import com.oracle.BlockBuster.model.SHTitleModel;
import com.oracle.BlockBuster.service.Paging;
import com.oracle.BlockBuster.service.SHService;
import com.oracle.BlockBuster.service.loginCheck;

@Controller
public class SHReviewController {
	private static final Logger logger = LoggerFactory.getLogger(SHReviewController.class);
	
	@Autowired
	private SHService SHservice;
	
	@Autowired
	private loginCheck loginCheck; //ID session 가져오는 module

	
	//게시판 리스트 검색창 3.
	@RequestMapping(value = "search")
	public String search(SHSearchModel searchModel, String currentPage, Model model) {
		logger.info("[STRAT] search 리뷰게시판 통합 검색 시작--------------------");
		System.out.println("controller searchModel : "+searchModel.getSearch_option());

		//Paging 호출
		logger.info("[1-1-1] totalSearch() 시작");
		int total = SHservice.totalSearch(searchModel);
		System.out.println("총 몇개? : "+total);
		
		logger.info("[1-2-1] paging 호출 시작");
		Paging pg = new Paging(total, currentPage);
		searchModel.setStart(pg.getStart());   // 시작시 1
		searchModel.setEnd(pg.getEnd());       // 시작시 10
		
		
		logger.info("[1-3-1] search() 시작");
		List<SHReviewModel> searchResult = SHservice.search(searchModel);
		
		model.addAttribute("pg",pg);
		model.addAttribute("total", total);
		
		if(searchModel.getKeyword() == null) {
			System.out.println("search 결과 : null");
			model.addAttribute("keyword",searchModel.getKeyword());
			
		}else {
			System.out.println("searchModel.getSearch_option() : " +searchModel.getSearch_option() );
			System.out.println("searchModel.getKeyword() : "+ searchModel.getKeyword() );
			System.out.println("searchResult.size() : "+searchResult.size());
			model.addAttribute("list", "정상 검색되었습니다..");
			
			model.addAttribute("reviewList",searchResult); // 심플
			model.addAttribute("keyword",searchModel.getKeyword()); //쉬운방법
			model.addAttribute("boardKind", "검색");
			model.addAttribute("Search_option",searchModel.getSearch_option()); //쉬운방법
		}
		return "Review/reviewListSH";
	}
	
	
	
	
	//게시판 목록(일반)  1
	@RequestMapping(value="reviewList")
	public String reviewList(SHReviewModel SHreviewModel, String currentPage, Model model) {
		logger.info("[STRAT] 전체 reviewList 시작--------------------");
		
		//Paging 호출
		logger.info("[2-1-1] total() 시작");
		int total = SHservice.total();
		
		logger.info("[2-2-1] paging 호출 시작");
		Paging pg = new Paging(total, currentPage);
		SHreviewModel.setStart(pg.getStart());   // 시작시 1
		SHreviewModel.setEnd(pg.getEnd());       // 시작시 10
		
		//list 호출
		logger.info("[2-3-1] reviewList() 시작");
		
		List<SHReviewModel> reviewList = SHservice.reviewList(SHreviewModel);
	    System.out.println("SHReviewController reviewList reviewList.size()->"+reviewList.size());
		model.addAttribute("reviewList", reviewList);
		
		model.addAttribute("pg",pg);
		model.addAttribute("total", total);
		model.addAttribute("boardKind", "일반리뷰");
		
		
		return "Review/reviewListSH";
	}
	

	
	
	//게시판 목록(상품페이지) 2
	@RequestMapping(value="reviewProductList")
	public String reviewProductList(int pno, String currentPage, Model model) {
		logger.info("[STRAT] 상품페이지로부터 reviewProductList 시작--------------------");
		
		System.out.println("상품페이지로부터 온 pno : "+pno);
		
		
		//Paging 호출
		logger.info("[3-1-1] totalPro() 시작");
		int total = SHservice.totalPro(pno);
		
		logger.info("[3-2-1] paging 호출 시작");
		Paging pg = new Paging(total, currentPage);
		
		SHReviewModel SHreviewModel = new SHReviewModel();
		SHreviewModel.setPno(pno);   			 					// 상품 고유번호
		SHreviewModel.setStart(pg.getStart());   					// 시작시 1
		SHreviewModel.setEnd(pg.getEnd());       					// 시작시 10
			
		//list 호출
		logger.info("[3-3-1] reviewProductList() 시작");
		List<SHReviewModel> reviewList = SHservice.reviewProductList(SHreviewModel);
		model.addAttribute("reviewList", reviewList);
		
		logger.info("[3-4-1] pnoToTitle() 시작");
		String title = SHservice.pnoToTitle(pno);
		System.out.println("title 가지고왔잖아? "+title);
		model.addAttribute("title", title);
		
		model.addAttribute("pno", pno); // 리스트에서 번호에 따라 리뷰남기는 방식이다름 
		model.addAttribute("pg",pg);
		model.addAttribute("total", total);
		model.addAttribute("boardKind", "상품페이지");
		
		
		return "Review/reviewListSH";
	}
	
	
	
	
	//게시글 상세 보기
	@GetMapping(value="reviewDetailSH")
	public String reviewDetail(String currentPage, SHGoodModel SHgoodModel, HttpServletRequest request, Model model) {
		logger.info("[STRAT] reviewDetail 시작--------------------");
		
		logger.info("[4-1-1] reviewHit 시작");
		int r_no = SHgoodModel.getR_no();
		SHservice.reviewHit(r_no);
		
		//게시판 상세페이지 불러오기 -----------------------------------------
		logger.info("[4-2-1] reviewDetail 시작");
		SHReviewModel reviewDetail = SHservice.reviewDetail(r_no);
		model.addAttribute("reviewDetail", reviewDetail);
		
		
		//게시판 좋아요 기능 -----------------------------------------
		
		//1. 상세보기 진입 시, 현재 게시글의 추천개수 확인
		logger.info("[4-3-1] totalGood 시작--------------------");
		int totalGood = SHservice.totalGood(r_no);
		model.addAttribute("totalGood", totalGood);
		
		//2. 현재 게시글에 로그인 유저가 좋아요 했는지 여부 확인
		System.out.println("sessionId : "+loginCheck.checkSessionId(request));
		SHgoodModel.setId(loginCheck.checkSessionId(request));
		model.addAttribute("SHgoodModel", SHgoodModel);
		
		logger.info("[4-4-1] userGood 시작"+SHgoodModel.toString());
		int userGood = SHservice.userGood(SHgoodModel);
		model.addAttribute("userGood", userGood);
		
		return "Review/reviewDetailSH";
	}
	
	
	
	
	//게시글 작성하기1 - 작성 view로 이동
	@GetMapping(value="reviewWriteForm")
	public String reviewWriteForm(SHReviewModel SHreviewModel, Model model) {
		logger.info("[STRAT] reviewWriteForm 글작성 양식_전 시작--------------------");
		
		int pno = SHreviewModel.getPno();
		model.addAttribute("pno", pno);
		
		if(pno > 0) {
			logger.info("[5-1-1] pnoToTitle() 시작");
			String title = SHservice.pnoToTitle(pno); 
			model.addAttribute("title", title);
			SHreviewModel.setTitle(title);
			return "Review/reviewProWriteFormSH";
		}
		
		return "Review/reviewWriteFormSH";
	}
	
	
	
	//게시글 작성하기2 - 작성 양식 DB 저장(일반)
	@PostMapping(value="reviewWrite")
	public String reviewWrite(SHReviewModel SHreviewModel, HttpServletRequest request, MultipartFile imgFile, Model model)  throws Exception {
		logger.info("[STRAT] reviewWrite 전체 글작성 양식_후 시작--------------------");
		
		//파일 업로드
		if(imgFile!=null) {
			String uploadPath = request.getSession().getServletContext().getRealPath("/upload/"); // 파일 업로드할 폴더
			
			System.out.println("uploadForm POST Start");
			logger.info("originalName: " + imgFile.getOriginalFilename());// 파일명
		    logger.info("size: " + imgFile.getSize()); //yml에 설정한 사이즈
		    logger.info("contentType: " + imgFile.getContentType()); // image
		    logger.info("uploadPath: " + uploadPath); 
		    
		    //아래 메서드 호출
		    String r_img = uploadFile(imgFile.getOriginalFilename(), imgFile.getBytes(), uploadPath);
		    
		    logger.info("r_img : " + r_img);
		    SHreviewModel.setR_img(r_img);
		}
		
		//게시글 작성
		System.out.println("SHreviewModel : " +SHreviewModel.toString());
		
		System.out.println(SHreviewModel.getTitle());
		int pno = SHservice.titleToPno(SHreviewModel.getTitle());
		SHreviewModel.setPno(pno);
		
		logger.info("[6-1-1] reviewWrite() 시작");
		int WriteResult = SHservice.reviewWrite(SHreviewModel);
		System.out.println("게시글 작성 반영 결과 : "+WriteResult);
		
		if (WriteResult > 0) {
			return "redirect:reviewList";
		} else {
			model.addAttribute("msg","입력 실패 확인해 보세요");
			return "forward:reviewWriteForm";
		}
	}

	
	//게시글 작성하기2 - 작성 양식 DB 저장(상품페이지)
	@PostMapping(value="reviewProWrite")
	public String reviewProWrite(HttpServletRequest request, MultipartFile imgFile, SHReviewModel SHreviewModel, Model model) throws Exception {
		logger.info("[STRAT] reviewProWrite 스파이더맨 글작성 양식_후 시작--------------------");
		
		//파일 업로드
		if(imgFile!=null) {
			String uploadPath = request.getSession().getServletContext().getRealPath("/upload/"); // 파일 업로드할 폴더
			
			System.out.println("uploadForm POST Start");
			logger.info("originalName: " + imgFile.getOriginalFilename());// 파일명
		    logger.info("size: " + imgFile.getSize()); //yml에 설정한 사이즈
		    logger.info("contentType: " + imgFile.getContentType()); // image
		    logger.info("uploadPath: " + uploadPath); 
		    
		    //아래 메서드 호출
		    String r_img = uploadFile(imgFile.getOriginalFilename(), imgFile.getBytes(), uploadPath);
		    
		    logger.info("r_img : " + r_img);
		    SHreviewModel.setR_img(r_img);
		}
		
		//게시글 작성
		logger.info("[7-1-1] Product --> reviewWrite() 시작");
		int WriteResult = SHservice.reviewWrite(SHreviewModel);
		System.out.println("  게시글 작성 반영 결과 : "+WriteResult);
		
		if (WriteResult > 0) {
			return "redirect:reviewList";
		} else {
			model.addAttribute("msg","입력 실패 확인해 보세요");
			return "forward:reviewWriteForm";
		}
	}
	
	
  //일련번호 부여하는 메서드
  private String uploadFile(String originalName, byte[] fileData , String uploadPath) throws Exception {
	  
    UUID uid = UUID.randomUUID();
    // requestPath = requestPath + "/resources/image";
    System.out.println("uploadPath->"+uploadPath);
    
    
    // Directory 생성 
	File fileDirectory = new File(uploadPath);
	if (!fileDirectory.exists()) {  //'uploadPath' directory 존재여부 확인
		fileDirectory.mkdirs(); // 폴더가 없으면 신규생성
		System.out.println("업로드용 폴더 생성 : " + uploadPath);
	}

	String savedName = uid.toString() + "_" + originalName;
    logger.info("savedName: " + savedName);
    
    
    File target = new File(uploadPath, savedName);
    FileCopyUtils.copy(fileData, target);   // org.springframework.util.FileCopyUtils
    
    return savedName;
  }	
	
	
	//게시글 작성하기3 - 검색어로 title 찾기
	@RequestMapping(value="SearchWord")
	@ResponseBody
	public List<SHTitleModel> searchTitle() {
		logger.info("[STRAT] searchTitle 글작성 제목 검색 시작--------------------");
		
		logger.info("[8-1-1] searchTitle() 시작");
		List<SHTitleModel> titleNTotalWd = SHservice.searchTitle(); //제목
		
		return titleNTotalWd;
	}		
		
	
	//게시글 제목 검증하기
	@PostMapping(value="checkTitle")
	@ResponseBody
	public String checkTitle(String title, Model model) {
		logger.info("[STRAT] checkTitle 시작--------------------");
		
		logger.info("[9-1-1] searchTitle() 시작");
		int checkTitle = SHservice.checkTitle(title); 
		System.out.println("게시글 제목 검증 결과 : "+checkTitle);
		
		String checkTitleStr = String.valueOf(checkTitle);
		
		return checkTitleStr;
	}	

	//게시글 수정1
	@GetMapping(value="reviewEditForm")
	public String reviewEditForm(int r_no, Model model) {
		logger.info("[STRAT] reviewEditForm 시작--------------------");
		
			logger.info("[10-1-1] reviewDetail 시작");
			model.addAttribute("editWriteForm", SHservice.reviewDetail(r_no));
			
			return "Review/reviewEditFormSH";
	}
	//게시글 수정2
	@RequestMapping(value="edit")
	public String ReviewEdit(HttpServletRequest request, MultipartFile imgFile, SHReviewModel SHreviewModel, Model model) throws Exception {
		logger.info("[STRAT] ReviewEdit 시작");
		
		//파일 업로드
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/"); // 파일 업로드할 폴더
		
		System.out.println("uploadForm POST Start");
		logger.info("originalName: " + imgFile.getOriginalFilename());// 파일명
	    logger.info("size: " + imgFile.getSize()); //yml에 설정한 사이즈
	    logger.info("contentType: " + imgFile.getContentType()); // image
	    logger.info("uploadPath: " + uploadPath); 
	    
	    //아래 메서드 호출
	    String r_img = uploadFile(imgFile.getOriginalFilename(), imgFile.getBytes(), uploadPath);
	    
	    logger.info("r_img : " + r_img);
	    SHreviewModel.setR_img(r_img);
		
		
		logger.info("[11-1-1] ReviewEdit() 시작");
		int editResult = SHservice.ReviewEdit(SHreviewModel);
		System.out.println("  edit 게시글 수정 반영 결과 : "+editResult);
		
		return "forward:reviewList";
	}
	
	
	
	//게시글 삭제
	@GetMapping(value="delete")
	public String reviewDelete(int r_no, Model model) {
		logger.info("[STRAT] reviewDelete 시작--------------------");
		
		logger.info("12-1-1] reviewDelete() 시작");
		System.out.println("  게시글 삭제 반영 결과 : "+SHservice.reviewDelete(r_no));
		
		return "redirect:reviewList";
	}
	
	//게시글 이미지 
	@GetMapping(value="imgDelete")
	public String imgDelete(int r_no, Model model) {
		logger.info("[STRAT] imgDelete 시작--------------------");
		
		logger.info("[13-1-1] imgDelete() 시작");
		System.out.println("  게시글 삭제 반영 결과 : "+SHservice.imgDelete(r_no));
		
		return "redirect:reviewList";
	}
	
	
}
	

