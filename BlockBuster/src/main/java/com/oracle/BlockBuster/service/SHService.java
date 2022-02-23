package com.oracle.BlockBuster.service;


import java.util.HashMap;
import java.util.List;

import com.oracle.BlockBuster.model.SHProcedureVO;
import com.oracle.BlockBuster.model.SHCommentModel;
import com.oracle.BlockBuster.model.SHGoodModel;
import com.oracle.BlockBuster.model.SHReviewModel;
import com.oracle.BlockBuster.model.SHSearchModel;
import com.oracle.BlockBuster.model.SHTitleModel;

public interface SHService {
	
	//게시판 리스트 검색창
	List<SHReviewModel> search(SHSearchModel searchModel);
	
	int totalSearch(SHSearchModel searchModel);
	
	
	//게시판 리스트(일반)
	int total();
	
	List<SHReviewModel> reviewList(SHReviewModel SHreviewModel);
	
	//게시글 리스트(상품페이지)
	int totalPro(int pno);
	
	List<SHReviewModel> reviewProductList(SHReviewModel SHreviewModel);
	
	

	//게시판 상세보기
	void reviewHit(int r_no);
	
	SHReviewModel reviewDetail(int r_no);
	
	//좋아요 기능
	int totalGood(int r_no);

	int userGood(SHGoodModel SHgoodModel);

	int insertGood(SHGoodModel SHgoodModel);

	int deleteGood(SHGoodModel SHgoodModel);
	
	

	//게시글 작성하기
	
	String pnoToTitle(int pno); /* 상품페이지에서 넘어올 때, pno로 title 확인 */ 	
	
	int titleToPno(String title); /* 영상제목 검색하여 제목 입력 시, title로 pno 확인 */ 
	
	int reviewWrite(SHReviewModel SHreviewModel);
	
	List<SHTitleModel> searchTitle();
	
	//게시글 제목 검증하기
	int checkTitle(String title);
	
	
	//게시글 수정
	int ReviewEdit(SHReviewModel SHreviewModel);
	
	
	
	//게시글 삭제
	int reviewDelete(int r_no);
	
	//게시글 이미지 삭제
	int imgDelete(int r_no);

	
	
	//댓글기능 구현
	int commentInsert(SHCommentModel SHcommentModel);

	int c_total(int r_no);

	List<SHCommentModel> commentList(SHCommentModel SHcommentModel);

	int commentDelete(SHCommentModel SHcommentModel);
	
	int commentEdit(SHCommentModel SHcommentModel);

	void insertProcedure(SHProcedureVO SHprocedureVO);

	int cursorListSize();

	void cursorList(HashMap<String, Object> map);



	
	


	
}
