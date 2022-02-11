package com.oracle.BlockBuster.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.BlockBuster.model.SHCommentModel;
import com.oracle.BlockBuster.model.SHGoodModel;
import com.oracle.BlockBuster.model.SHReviewModel;
import com.oracle.BlockBuster.model.SHSearchModel;
import com.oracle.BlockBuster.model.SHTitleModel;

public interface SHService {
	
	//상품페이지에서 넘어 올 때
	List<SHReviewModel> reviewProductList(SHReviewModel SHreviewModel);
	
	
	//게시판 구현
	List<SHReviewModel> reviewList(SHReviewModel SHreviewModel);
	
	int total();
	
	int totalPro(int pno);

	SHReviewModel reviewDetail(int r_no);

	int reviewDelete(int r_no);

	int imgDelete(int r_no);
	
	int ReviewEdit(SHReviewModel SHreviewModel);

	int reviewWrite(SHReviewModel SHreviewModel);

	void reviewHit(int r_no);
	
	String pnoToTitle(int pno);
	
	
	
	//댓글기능 구현
	int commentInsert(SHCommentModel SHcommentModel);

	int c_total(int r_no);

	List<SHCommentModel> commentList(SHCommentModel SHcommentModel);

	List<SHCommentModel> commentUser(List<SHCommentModel> commentList);

	int commentDelete(SHCommentModel SHcommentModel);
	
	
	
	
	//게시판 좋아요 구현
	int totalGood(int r_no);

	int userGood(SHGoodModel SHgoodModel);

	int insertGood(SHGoodModel SHgoodModel);

	int deleteGood(SHGoodModel SHgoodModel);

	
	
	
	//게시판 리스트 검색
	List<SHReviewModel> search(SHSearchModel searchModel);

	List<SHTitleModel> searchTitle();


	int titleToPno(String title);


	int commentEdit(SHCommentModel SHcommentModel);






}
