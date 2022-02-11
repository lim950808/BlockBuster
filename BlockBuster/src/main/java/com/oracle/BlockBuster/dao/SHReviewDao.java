package com.oracle.BlockBuster.dao;

import java.util.List;
import java.util.Map;

import com.oracle.BlockBuster.model.SHCommentModel;
import com.oracle.BlockBuster.model.SHGoodModel;
import com.oracle.BlockBuster.model.SHReviewModel;
import com.oracle.BlockBuster.model.SHSearchModel;
import com.oracle.BlockBuster.model.SHTitleModel;

public interface SHReviewDao {

	//상품페이지에서 넘어 올 때
	List<SHReviewModel> reviewProductList(SHReviewModel sHreviewModel);
	
	String pnoToTitle(int pno);
	
	
	
	
	//게시판 기능 구현
	List<SHReviewModel> reviewList(SHReviewModel SHreviewModel);

	int total();
	
	int totalPro(int pno);

	SHReviewModel reviewDetail(int r_no);

	int reviewDelete(int r_no);
	
	int imgDelete(int r_no);

	int ReviewEdit(SHReviewModel SHreviewModel);

	int reviewWrite(SHReviewModel SHreviewModel);

	void reviewHit(int r_no);
	
	
	

	//댓글 기능 구현
	int commentInsert(SHCommentModel SHcommentModel);

	int c_total(int r_no);

	List<SHCommentModel> commentList(SHCommentModel SHcommentModel);

	List<SHCommentModel> commentUser(List<SHCommentModel> commentList);

	int commentDelete(SHCommentModel SHcommentModel);
	
	
	
	
	//게시판 추천 기능
	int totalGood(int r_no);

	int userGood(SHGoodModel SHgoodModel);

	int insertGood(SHGoodModel SHgoodModel);

	int deleteGood(SHGoodModel SHgoodModel);

	
	
	//게시판 리스트 검색 기능
	List<SHReviewModel> search(SHSearchModel searchModel);

	List<SHTitleModel> searchTitle();

	int titleToPno(String title);

	int commentEdit(SHCommentModel SHcommentModel);











	


	//파일 업로드 구현


}
