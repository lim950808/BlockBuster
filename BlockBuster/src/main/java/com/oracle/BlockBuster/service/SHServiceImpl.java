package com.oracle.BlockBuster.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.BlockBuster.dao.SHReviewDao;
import com.oracle.BlockBuster.model.SHCommentModel;
import com.oracle.BlockBuster.model.SHGoodModel;
import com.oracle.BlockBuster.model.SHReviewModel;
import com.oracle.BlockBuster.model.SHSearchModel;
import com.oracle.BlockBuster.model.SHTitleModel;

@Service
public class SHServiceImpl implements SHService {
	private static final Logger logger = LoggerFactory.getLogger(SHService.class);
	
	@Autowired
	SHReviewDao SHReviewDao;

	
//상품페이지에서 넘어 올 때 게시판 기능 구현-----------------------------------------------------------------------------	
	
	@Override
	public List<SHReviewModel> reviewProductList(SHReviewModel SHreviewModel) {
		logger.info("[*-*-2] reviewProductList() 상품페이지 -> 통합게시판 list 확인");
		
		List<SHReviewModel> reviewList = SHReviewDao.reviewProductList(SHreviewModel);

		
		return reviewList;
	}
	

	@Override
	public String pnoToTitle(int pno) {
		logger.info("[*-*-2] pnoToTitle() 상품페이지 -> 게시글작성 title 확인");
		
		String pnoToTitle = SHReviewDao.pnoToTitle(pno);
		
		return pnoToTitle;
	}


	
//게시판 기능 구현------------------------------------------------------------------------------------------------
	
	@Override
	public List<SHReviewModel> reviewList(SHReviewModel SHreviewModel) {
		logger.info("[*-*-2] reviewList() 통합게시판 list 확인");
		
		List<SHReviewModel> reviewList = SHReviewDao.reviewList(SHreviewModel);

		
		return reviewList;
	}

	@Override
	public int total() {
		logger.info("[*-*-2] total() paging 호출 시 필요한 totalPage 확인");
		
		int total = SHReviewDao.total();
		
		return total;
	}
	
	@Override
	public int totalPro(int pno) {
		logger.info("[*-*-2] totalPro() paging 호출 시 필요한 totalPage 확인 <-- 상품페이지 ver.");
		
		int totalPro = SHReviewDao.totalPro(pno);
		
		return totalPro;
	}

	@Override
	public SHReviewModel reviewDetail(int r_no) {
		logger.info("[*-*-2] reviewDetail() 게시글 상세보기");
		
		SHReviewModel reviewDetail = SHReviewDao.reviewDetail(r_no);
		
		return reviewDetail;
	}

	@Override
	public int reviewDelete(int r_no) {
		logger.info("[*-*-2] reviewDelete() 게시글 삭제");
		
		int reviewDelete = SHReviewDao.reviewDelete(r_no);
		
		return reviewDelete;
	}
	

	@Override
	public int imgDelete(int r_no) {
		logger.info("[*-*-2] imgDelete() 게시글 이미지 삭제");
		
		int imgDelete = SHReviewDao.imgDelete(r_no);
		
		return imgDelete;
	}


	@Override
	public int ReviewEdit(SHReviewModel SHreviewModel) {
		logger.info("[*-*-2] ReviewEdit() 게시글 수정 반영");
		
		int editResult = SHReviewDao.ReviewEdit(SHreviewModel);
		
		return editResult;
	}

	@Override
	public int reviewWrite(SHReviewModel SHreviewModel) {
		logger.info("[*-*-2] reviewWrite() 게시글 작성 insert 반영");
		
		int WriteResult = SHReviewDao.reviewWrite(SHreviewModel);
		
		return WriteResult;
	}


	
	
	
//게시판 댓글 기능 구현------------------------------------------------------------------------------------------------
	
	@Override
	public int commentInsert(SHCommentModel SHcommentModel) {
		logger.info("[*-*-2] commentInsert() 댓글 입력 진행");
		
		int insertResult = SHReviewDao.commentInsert(SHcommentModel);
		
		return insertResult;
		
	}

	@Override
	public int c_total(int r_no) {
		logger.info("[*-*-2] c_total() 게시글의 댓글 개수 확인");
		
		int c_totalResult = SHReviewDao.c_total(r_no);
		
		return c_totalResult;
	}

	@Override
	public List<SHCommentModel> commentList(SHCommentModel SHcommentModel) {
		logger.info("[*-*-2] commentList() 게시글의 댓글 리스트 출력");
		
		List<SHCommentModel> commentList = SHReviewDao.commentList(SHcommentModel);
		
		return commentList;
	}

	@Override
	public void reviewHit(int r_no) {
		logger.info("[*-*-2] reviewHit() 게시글 조회수 증가");
		
		SHReviewDao.reviewHit(r_no);
	}

	

	@Override
	public List<SHCommentModel> commentUser(List<SHCommentModel> commentList) {
		logger.info("[*-*-2] commentUser() 게시글의 댓글 작성한 user의 댓글 정보 출력");
		
		List<SHCommentModel> commentUser = SHReviewDao.commentUser(commentList);
		
		return commentUser;
	}
	
	@Override
	public int commentDelete(SHCommentModel SHcommentModel) {
		logger.info("[*-*-2] commentDelete() 댓글 삭제");
		
		int commentDelete = SHReviewDao.commentDelete(SHcommentModel);
		
		return commentDelete;
	}
	

	
	
	
//게시판 좋아요 기능 구현------------------------------------------------------------------------------------------------
	
	@Override
	public int totalGood(int r_no) {
		logger.info("[*-*-2] totalGood() 게시글 추천수 확인");
		
		int totalGood = SHReviewDao.totalGood(r_no);
		
		return totalGood;
	}

	@Override
	public int userGood(SHGoodModel SHgoodModel) {
		logger.info("[*-*-2] userGood() 게시글 유저 추천 여부 확인");
		
		int userGood = SHReviewDao.userGood(SHgoodModel);
		
		return userGood;
	}

	@Override
	public int insertGood(SHGoodModel SHgoodModel) {
		logger.info("[*-*-2] insertGood() 게시글 추천 기능 입력 진행");
		
		int insertGood = SHReviewDao.insertGood(SHgoodModel);
		
		return insertGood;
	}

	@Override
	public int deleteGood(SHGoodModel SHgoodModel) {
		logger.info("[*-*-2] deleteGood() 추천 해제 진행");
		
		int deleteGood = SHReviewDao.deleteGood(SHgoodModel);
		
		return deleteGood;
	}

	
	
	
	//게시판 리스트 검색 기능 구현------------------------------------------------------------------------------------------------

	@Override
	public List<SHReviewModel> search(SHSearchModel searchModel) {
		logger.info("[*-*-2] search() 게시글 리뷰 리스트 검색 진행");
		List<SHReviewModel> searchResult = SHReviewDao.search(searchModel);
		return searchResult;
	}


	@Override
	public List<SHTitleModel> searchTitle() {
		logger.info("[*-*-2] searchTitle() 게시글 리뷰 제목 검색 진행");
		List<SHTitleModel> searchResult = SHReviewDao.searchTitle();
		return searchResult;
	}


	@Override
	public int titleToPno(String title) {
		logger.info("[*-*-2] titleToPno() 게시글 작성 시 영상제목으로 pno 찾기");
		
		int titleToPno = SHReviewDao.titleToPno(title);
		
		return titleToPno;
	}


	@Override
	public int commentEdit(SHCommentModel SHcommentModel) {
		logger.info("[*-*-2] commentEdit() 댓글 수정");
		
		int commentEdit = SHReviewDao.commentEdit(SHcommentModel);
		
		return commentEdit;
	}


	
	
	//파일 업로드 구현


}



