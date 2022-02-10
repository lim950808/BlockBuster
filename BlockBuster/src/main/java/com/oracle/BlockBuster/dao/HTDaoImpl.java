package com.oracle.BlockBuster.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.BlockBuster.model.PdtSearchVo;
import com.oracle.BlockBuster.model.Product;
import com.oracle.BlockBuster.model.ProductApiVo;
import com.oracle.BlockBuster.model.ProductVo;

@Repository
public class HTDaoImpl implements HTDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Product> HTGetSearchResult(String keyword) {
		List<Product> productsList = null;
		
		System.out.println("HTDaoImpl의 HTGetSearchResult 시작...");	
		try {
			productsList = session.selectList("HTGetSearchResult", keyword);
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 HTGetSearchResult의 SQL오류 => "+e.getMessage());		
		}
		return productsList;
	}

	
	
	@Override
	public int HTGetSearchCnt(String keyword) {
		int searchCnt = 0;
		System.out.println("HTDaoImpl의 HTGetSearchCnt 시작...");	
		try {
			searchCnt = session.selectOne("HTGetSearchCnt", keyword);
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 HTGetSearchCnt의 SQL오류 => "+e.getMessage());		
		}
		return searchCnt;
	}



	@Override
	public int HTGetMovieCnt(String keyword) {
		int movieCnt = 0;
		System.out.println("HTDaoImpl의  HTGetMovieCnt시작...");	
		try {
			movieCnt = session.selectOne("HTGetMovieCnt", keyword);
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 HTGetMovieCnt의 SQL오류 => "+e.getMessage());		
		}
		return movieCnt;
	}



	@Override
	public int HTGetDramaCnt(String keyword) {
		int dramaCnt = 0;
		System.out.println("HTDaoImpl의  HTGetDramaCnt시작...");	
		try {
			dramaCnt = session.selectOne("HTGetDramaCnt", keyword);
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 HTGetDramaCnt의 SQL오류 => "+e.getMessage());		
		}
		return dramaCnt;
	}



	@Override
	public int HTGetEntertainmentCnt(String keyword) {
		int entertainmentCnt = 0;
		System.out.println("HTDaoImpl의  HTGetEntertainmentCnt시작...");	
		try {
			entertainmentCnt = session.selectOne("HTGetEntertainmentCnt", keyword);
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 HTGetEntertainmentCnt의 SQL오류 => "+e.getMessage());		
		}
		return entertainmentCnt;
	}



	@Override
	public int HTGetDocumentaryCnt(String keyword) {
		int documentaryCnt = 0;
		System.out.println("HTDaoImpl의  HTGetDocumentaryCnt시작...");	
		try {
			documentaryCnt = session.selectOne("HTGetDocumentaryCnt", keyword);
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 HTGetDocumentaryCnt의 SQL오류 => "+e.getMessage());		
		}
		return documentaryCnt;
	}



	@Override
	public int HTGetAnimationCnt(String keyword) {
		int animationCnt = 0;
		System.out.println("HTDaoImpl의  HTGetAnimationCnt시작...");	
		try {
			animationCnt = session.selectOne("HTGetAnimationCnt", keyword);
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 HTGetAnimationCnt의 SQL오류 => "+e.getMessage());		
		}
		return animationCnt;
	}



	
	@Override
	public List<Product> rcmdTitleWord() {
		System.out.println("HTDaoImpl의  rcmdTitleWord시작...");
		List<Product> titleWd = null;
		try {
			titleWd = session.selectList("HTrcmdTitleWord");
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 rcmdTitleWord의 SQL오류 => "+e.getMessage());		
		}
		return titleWd;
	}



	@Override
	public List<Product> rcmdCategoryWord() {
		System.out.println("HTDaoImpl의  rcmdCategoryWord시작...");
		List<Product> ctgryWd = null;
		try {
			ctgryWd = session.selectList("HTrcmdCategoryWord");
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 rcmdCategoryWord의 SQL오류 => "+e.getMessage());		
		}
		return ctgryWd;
	}



	@Override
	public List<Product> rcmdGenreWord() {
		System.out.println("HTDaoImpl의  rcmdGenreWord시작...");
		List<Product> genreWd = null;
		try {
			genreWd = session.selectList("HTrcmdGenreWord");
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 rcmdGenreWord의 SQL오류 => "+e.getMessage());		
		}
		return genreWd;
	}



	@Override
	public List<Product> rcmdYearWord() {
		System.out.println("HTDaoImpl의  rcmdYearWord시작...");
		List<Product> yearWd = null;
		try {
			yearWd = session.selectList("HTrcmdYearWord");
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 rcmdYearWord의 SQL오류 => "+e.getMessage());		
		}
		return yearWd;
	}



	@Override
	public List<Product> rcmdNationWord() {
		System.out.println("HTDaoImpl의  rcmdNationWord시작...");
		List<Product> nationWd = null;
		try {
			nationWd = session.selectList("HTrcmdNationWord");
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 rcmdNationWord의 SQL오류 => "+e.getMessage());		
		}
		return nationWd;
	}



	@Override
	public List<Product> rcmdDirectorWord() {
		System.out.println("HTDaoImpl의  rcmdDirectorWord시작...");
		List<Product> directorWd = null;
		try {
			directorWd = session.selectList("HTrcmdDirectorWord");
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 rcmdDirectorWord의 SQL오류 => "+e.getMessage());		
		}
		return directorWd;
	}



	@Override
	public List<Product> rcmdCastingWord() {
		System.out.println("HTDaoImpl의  rcmdCastingWord시작...");
		List<Product> castingWd  = null;
		try {
			castingWd = session.selectList("HTrcmdCastingWord");
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 rcmdCastingWord의 SQL오류 => "+e.getMessage());		
		}
		return castingWd;
	}



	@Override
	public int GetPdtSearchCount(PdtSearchVo pvo) {
		System.out.println("HTDaoImpl의  GetPdtSearchCount시작...");
		int searchCnt = 0;
		try {
			searchCnt = session.selectOne("HTGetPdtSearchCount", pvo);
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 GetPdtSearchCount의 SQL오류 => "+e.getMessage());		
		}
		return searchCnt;
	}



	@Override
	public List<Product> GetPdtSearchResult(PdtSearchVo pvo) {
		System.out.println("HTDaoImpl의  GetPdtSearchResult시작...");
		List<Product> productsList = null;
		try {
			productsList = session.selectList("HTGetPdtSearchResult", pvo);
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 GetPdtSearchResult의 SQL오류 => "+e.getMessage());		
		}
		return productsList;
	}



	@Override
	public HashMap<String, String> mTotalCnt(PdtSearchVo pvo) {
		System.out.println("HTDaoImpl의  mTotalCnt시작...");
		HashMap<String, String> mTotalCnt = new HashMap<String, String>();
		try {
			for(int i=1100; i<1800; i+=100) {
				pvo.setGenre(String.valueOf(i));
				String mEachCnt = session.selectOne("HTmEachCnt",pvo);
				mTotalCnt.put(String.valueOf(i), mEachCnt);// 각 장르번호에 각 장르당 검색어를 통해 검색한 결과 수 map에 저장 
			}
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 mTotalCnt의 SQL오류 => "+e.getMessage());		
		}
		return mTotalCnt;
	}



	@Override
	public HashMap<String, String> dTotalCnt(PdtSearchVo pvo) {
		System.out.println("HTDaoImpl의  dTotalCnt시작...");
		HashMap<String, String> dTotalCnt = new HashMap<String, String>();
		try {
			for(int i=2100; i<2400; i+=100) {
				pvo.setGenre(String.valueOf(i));
				String dEachCnt = session.selectOne("HTdEachCnt",pvo);
				dTotalCnt.put(String.valueOf(i), dEachCnt);// 각 장르번호에 각 장르당 검색어를 통해 검색한 결과 수 map에 저장 
			}
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 dTotalCnt의 SQL오류 => "+e.getMessage());		
		}
		return dTotalCnt;
	}


	@Override
	public HashMap<String, String> eTotalCnt(PdtSearchVo pvo) {
		System.out.println("HTDaoImpl의  eTotalCnt시작...");
		HashMap<String, String> eTotalCnt = new HashMap<String, String>();
		try {
			for(int i=3100; i<3600; i+=100) {
				pvo.setGenre(String.valueOf(i));
				String dEachCnt = session.selectOne("HTeEachCnt",pvo);
				eTotalCnt.put(String.valueOf(i), dEachCnt);// 각 장르번호에 각 장르당 검색어를 통해 검색한 결과 수 map에 저장 
			}
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 eTotalCnt의 SQL오류 => "+e.getMessage());		
		}
		return eTotalCnt;
	}



	@Override
	public HashMap<String, String> dcTotalCnt(PdtSearchVo pvo) {
		System.out.println("HTDaoImpl의  dcTotalCnt시작...");
		HashMap<String, String> dcTotalCnt = new HashMap<String, String>();
		try {
			for(int i=4100; i<4400; i+=100) {
				pvo.setGenre(String.valueOf(i));
				String dEachCnt = session.selectOne("HTdcEachCnt",pvo);
				dcTotalCnt.put(String.valueOf(i), dEachCnt);// 각 장르번호에 각 장르당 검색어를 통해 검색한 결과 수 map에 저장 
			}
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 dcTotalCnt의 SQL오류 => "+e.getMessage());		
		}
		return dcTotalCnt;
	}



	@Override
	public HashMap<String, String> aTotalCnt(PdtSearchVo pvo) {
		System.out.println("HTDaoImpl의  aTotalCnt시작...");
		HashMap<String, String> aTotalCnt = new HashMap<String, String>();
		try {
			for(int i=5100; i<5300; i+=100) {
				pvo.setGenre(String.valueOf(i));
				String dEachCnt = session.selectOne("HTaEachCnt",pvo);
				aTotalCnt.put(String.valueOf(i), dEachCnt);// 각 장르번호에 각 장르당 검색어를 통해 검색한 결과 수 map에 저장 
			}
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 aTotalCnt의 SQL오류 => "+e.getMessage());		
		}
		return aTotalCnt;
	}



	@Override
	public List<Product> rcmdTitleWords(String category) {
		System.out.println("HTDaoImpl의  rcmdTitleWords시작...");
		List<Product> titlelist = null;
		try {
			titlelist = session.selectList("HTrcmdTitleWords", category);
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 rcmdTitleWords의 SQL오류 => "+e.getMessage());		
		}
		return titlelist;
	}



	@Override
	public List<Product> getGenNameList() {
		System.out.println("HTDaoImpl의  getGenNameList시작...");
		List<Product>getGenNameList = null;
		try {
			getGenNameList = session.selectList("HTgetGenNameList");
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 getGenNameList의 SQL오류 => "+e.getMessage());		
		}
		return getGenNameList;
	}



	@Override
	public List<ProductVo> getAllListByGenre(ProductApiVo productApiVo) {
		System.out.println("HTDaoImpl의  getAllListByGenre시작...");
		List<ProductVo>getAllListByGenre = null;
		try {
			getAllListByGenre = session.selectList("HTgetAllListByGenre",productApiVo);
		}catch(Exception e) {
			System.out.println("HTDaoImpl의 getAllListByGenre의 SQL오류 => "+e.getMessage());		
		}
		return getAllListByGenre;
	}
}