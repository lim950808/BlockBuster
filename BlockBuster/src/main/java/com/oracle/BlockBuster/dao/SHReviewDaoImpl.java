package com.oracle.BlockBuster.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.BlockBuster.model.SHCommentModel;
import com.oracle.BlockBuster.model.SHGoodModel;
import com.oracle.BlockBuster.model.SHReviewModel;
import com.oracle.BlockBuster.model.SHSearchModel;
import com.oracle.BlockBuster.model.SHTitleModel;

@Repository
public class SHReviewDaoImpl implements SHReviewDao {
	private static final Logger logger = LoggerFactory.getLogger(SHReviewDao.class);
	
	
	@Autowired
	private  SqlSession  session;
	
	
	

	@Override
	public int totalSearch(SHSearchModel searchModel) {
		logger.info("[*-*-3] total() paging 호출 시 필요한 totalPage 확인 <-- Search ver.");
		
		int totalSearch=0;
		
		try {
			totalSearch = session.selectOne("SH_totalSearch", searchModel);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl totalSearch() Exception 발생 : "+e.getMessage());
		}
		
		
		return totalSearch;
	}

	
	
	//게시판 리스트 검색창
	@Override
	public List<SHReviewModel> search(SHSearchModel searchModel) {
		logger.info("[*-*-3] search() 게시글 리뷰 리스트 검색 진행");
		
		List<SHReviewModel> searchResult = null;
		
		try {
			searchResult  = session.selectList("SH_search",searchModel);
		} catch (Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl search Exception->"+e.getMessage());
		}
		
		return searchResult;
	}
	
	
	
	//게시판 리스트(일반) 페이지 total
	@Override
	public int total() {
		logger.info("[*-*-3] total() paging 호출 시 필요한 totalPage 확인");
		
		int total=0;
		
		try {
			total = session.selectOne("SH_total");
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl Paging_total() Exception 발생 : "+e.getMessage());
		}
		
		
		return total;
	}

	
	
	
	//게시판 리스트(일반)
	@Override
	public List<SHReviewModel> reviewList(SHReviewModel SHreviewModel) {
		logger.info("[*-*-3] reviewList() 통합게시판 list 확인");
		List<SHReviewModel> reviewList = null;
		
		try {
			reviewList = session.selectList("SH_reviewList", SHreviewModel); 
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl reviewListSH Exception 발생 : "+e.getMessage());
		}
		
		
		return reviewList;
	}

	
	
	
	//게시판 리스트(상품페이지) 페이지 total
	@Override
	public int totalPro(int pno) {
		logger.info("[*-*-3] totalPro() paging 호출 시 필요한 totalPage 확인 <-- 상품페이지 ver.");
		
		int totalPro=0;
		
		try {
			totalPro = session.selectOne("SH_totalPro", pno);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl Paging_totalPro() Exception 발생 : "+e.getMessage());
		}
		
		
		return totalPro;
	}
	
	
	
	
	//게시판 리스트(상품페이지)
	@Override
	public List<SHReviewModel> reviewProductList(SHReviewModel SHreviewModel) {
		logger.info("[*-*-3] reviewProductList() 상품페이지 -> 통합게시판 list 확인");
		List<SHReviewModel> reviewList = null;
		
		try {
			reviewList = session.selectList("SH_reviewProductList", SHreviewModel); 
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl reviewProductList Exception 발생 : "+e.getMessage());
		}
		
		
		return reviewList;
	}
		
	
	
	
	//게시글 상세보기 - 조회수 증가
	@Override
	public void reviewHit(int r_no) {
		logger.info("[*-*-3] reviewHit() 게시글 조회수 증가");
		
		try {
			session.update("SH_reviewHit", r_no);
		}catch(Exception e) {
			logger.info("[*-*-4] SHReviewDaoImpl commentHit Exception 발생 : "+e.getMessage());
		}
		
	}
	
	
	
	
	//게시판 상세보기
	@Override
	public SHReviewModel reviewDetail(int r_no) {
		logger.info("[*-*-3] reviewDetail() 게시글 상세보기");
		
		SHReviewModel reviewDetail = null;
		
		try {
			reviewDetail = session.selectOne("SH_reviewDetail", r_no);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl reviewDetail Exception 발생 : "+e.getMessage());
		}
		
		
		return reviewDetail;
	}
	
	
	

	//좋아요 기능
	@Override
	public int totalGood(int r_no) {
		logger.info("[*-*-3] totalGood() 게시글 추천수 확인");
		
		int totalGood = 0;
		System.out.println("r_no : "+r_no);
		
		try {
			totalGood = session.selectOne("SH_totalGood", r_no);
			System.out.println("totalGood 개수 : "+ totalGood);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl totalGood Exception 발생 : "+e.getMessage());
		}
		
		return totalGood;
	}




	@Override
	public int userGood(SHGoodModel SHgoodModel) {
		logger.info("[*-*-3] userGood() 게시글 유저 추천 여부 확인");
		
		int userGood = 0;
		
		try {
			userGood = session.selectOne("SH_userGood", SHgoodModel);
			System.out.println("userGood : " + userGood);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl userGood Exception 발생 : "+e.getMessage());
		}
		
		return userGood;
	}
	
	
	
	
	@Override
	public int insertGood(SHGoodModel SHgoodModel) {
		logger.info("[*-*-3] insertGood() 게시글 추천 기능 입력 진행");
		System.out.println(SHgoodModel.toString());
		
		int insertGood = 0;
		
		try {
			insertGood = session.insert("SH_InsertGood", SHgoodModel);
			System.out.println("InsertGood : " + insertGood);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl InsertGood Exception 발생 : "+e.getMessage());
		}
		
		return insertGood;
	}




	@Override
	public int deleteGood(SHGoodModel SHgoodModel) {
		logger.info("[*-*-3] deleteGood() 게시글 추천 해제 진행");
		
		int deleteGood = 0;
		
		try {
			deleteGood = session.delete("SH_deleteGood", SHgoodModel);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl deleteGood Exception 발생 : "+e.getMessage());
		}
		
		return deleteGood;
	}
	
	
	
	
	//게시글 작성하기(상품페이지) - pno로 title 확인
	@Override
	public String pnoToTitle(int pno) {
		logger.info("[*-*-3] pnoToTitle() 상품페이지 -> 게시글작성 title 확인");
		String result = null;
		
		try {
			result = session.selectOne("SH_pnoToTitle", pno); 
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl pnoToTitle Exception 발생 : "+e.getMessage());
		}
		
		return result;
	}
	
	
	
	
	//게시글 작성하기(일반) - title로 pno 확인
	@Override
	public int titleToPno(String title) {
		logger.info("[*-*-3] titleToPno() 게시글 작성 시 영상제목으로 pno 찾기");
		
		int titleToPno = 0;
		
		try {
			titleToPno = session.selectOne("SH_titleToPno", title);
			System.out.println("상품번호 : "+titleToPno);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl titleToPno Exception 발생 : "+e.getMessage());
		}
		
		return titleToPno;
	}
	
	
	
	
	//게시글 작성하기
	@Override
	public int reviewWrite(SHReviewModel SHreviewModel) {
		logger.info("[*-*-3] reviewWrite() 게시글 작성 insert 반영");
		
		int WriteResult = 0;
		
		try {
			WriteResult = session.insert("SH_reviewWrite", SHreviewModel);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl reviewWrite Exception 발생 : "+e.getMessage());
		}
		
		return WriteResult;
	}
	
	
	
	
	//게시글 작성하기 - 영상제목 검색
	@Override
	public List<SHTitleModel> searchTitle() {
		logger.info("[*-*-3] searchTitle() 게시글 리뷰 제목 검색 진행");
		
		List<SHTitleModel> searchResult = null;
		
		try {
			searchResult  = session.selectList("SH_searchTitle");
		} catch (Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl searchTitle Exception->"+e.getMessage());
		}
		
		return searchResult;
	}
	
	
	
	//게시글 제목 검증하기
	@Override
	public int checkTitle(String title) {
		logger.info("[*-*-3] checkTitle() 게시글 수정 반영");
		
		int checkTitle = 0;
		
		try {
			checkTitle  = session.selectOne("SH_checkTitle", title);
		} catch (Exception e) {
			logger.info("SHReviewDaoImpl checkTitle Exception 발생 : "+e.getMessage());
		}
		
		return checkTitle;
	}
	
	
	
	
	//게시글 수정
	@Override
	public int ReviewEdit(SHReviewModel SHreviewModel) {
		logger.info("[*-*-3] ReviewEdit() 게시글 수정 반영");
		
		int editResult = 0;
		
		try {
			editResult  = session.update("SH_ReviewEdit",SHreviewModel);
		} catch (Exception e) {
			logger.info("SHReviewDaoImpl ReviewEdit Exception 발생 : "+e.getMessage());
		}
		
		return editResult;
	}
	
	
	
	
	//게시글 삭제
	@Override
	public int reviewDelete(int r_no) {
		logger.info("[*-*-3] reviewDelete() 게시글 삭제");
		System.out.println("  r_no : "+r_no);
		int reviewDelete = 0;
		
		try {
			reviewDelete = session.delete("SH_reviewDelete", r_no);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl reviewDelete Exception 발생 : "+e.getMessage());
		}
		
		return reviewDelete;
	}
	
	
	
	
	//게시글 이미지 삭제
	@Override
	public int imgDelete(int r_no) {
		logger.info("[*-*-3] imgDelete() 게시글 이미지 삭제");
		System.out.println("  r_no : "+r_no);
		int imgDelete = 0;
		
		try {
			imgDelete = session.update("SH_imgDelete", r_no);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl imgDelete Exception 발생 : "+e.getMessage());
		}
		
		return imgDelete;
	}
	
	
	
	
	//게시판 댓글 기능
	@Override
	public int commentInsert(SHCommentModel SHcommentModel) {
		logger.info("[*-*-3] commentInsert() 댓글 입력 진행");
		
		int insertResult = 0;
		
		try {
			insertResult = session.insert("SH_commentInsert", SHcommentModel);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl commentInsert Exception 발생 : "+e.getMessage());
		}
		
		return insertResult;
	}




	@Override
	public int c_total(int r_no) {
		logger.info("[*-*-3] c_total() 게시글의 댓글 개수 확인");
		
		int c_total = 0;
		
		try {
			c_total = session.selectOne("SH_c_total", r_no);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl c_total Exception 발생 : "+e.getMessage());
		}
		
		return c_total;
	}




	@Override
	public List<SHCommentModel> commentList(SHCommentModel SHcommentModel) {
		logger.info("[*-*-3] commentList() 게시글의 댓글 리스트 출력");
		System.out.println("\r\n"+"  SHcommentModel : "+"\r\n"+SHcommentModel.toString()+"\r\n");
		
		List<SHCommentModel> commentList = null;
		
		try {
			commentList = session.selectList("SH_commentList", SHcommentModel);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl commentList Exception 발생 : "+e.getMessage());
		}
		
		return commentList;
		
	}

	
	
	
	@Override
	public int commentDelete(SHCommentModel SHcommentModel) {
		logger.info("[*-*-3] commentDelete() 댓글 삭제");
		int commentDelete = 0;
		
		try {
			commentDelete = session.delete("SH_commentDelete", SHcommentModel);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl commentDelete Exception 발생 : "+e.getMessage());
		}
		
		return commentDelete;
	}

	
	

	@Override
	public int commentEdit(SHCommentModel SHcommentModel) {
		logger.info("[*-*-3] commentEdit() commentEdit() 댓글 수정");
		
		System.out.println("댓글 수정 시 모델안에 담긴 매개변수는? : "+SHcommentModel.toString());
		
		
		int commentEdit = 0;
		
		try {
			commentEdit = session.update("SH_commentEdit", SHcommentModel);
		}catch(Exception e) {
			logger.info("[*-*-4|예외] SHReviewDaoImpl commentEdit Exception 발생 : "+e.getMessage());
		}
		
		return commentEdit;
	}





	
}
