package com.oracle.BlockBuster.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.oracle.BlockBuster.dao.HTDao;
import com.oracle.BlockBuster.model.PdtSearchVo;
import com.oracle.BlockBuster.model.Product;
import com.oracle.BlockBuster.model.ProductApiVo;
import com.oracle.BlockBuster.model.ProductVo;

@Service
public class HTServiceImpl implements HTService {

	@Autowired
	private HTDao htd;

	@Override
	public List<Product> HTGetSearchResult(String keyword) {
		System.out.println("HTServiceImpl의 HTGetSearchResult(검색 결과 리스트 호출 메서드) 시작.....");	
		List<Product> productsList = htd.HTGetSearchResult(keyword);
		return productsList;
	}

	@Override
	public int HTGetSearchCnt(String keyword) {
		System.out.println("HTServiceImpl의 HTGetSearchCnt(검색 결과 리스트 전체 갯수 값 호출 메서드) 시작.....");	
		int searchCnt = htd.HTGetSearchCnt(keyword); 		
		return searchCnt;
	}

	@Override
	public int HTGetMovieCnt(String keyword) {
		System.out.println("HTServiceImpl의 HTGetMovieCnt(검색 결과 영화 리스트 갯수 값 호출 메서드) 시작.....");	
		int movieCnt = htd.HTGetMovieCnt(keyword);
		return movieCnt;
	}

	@Override
	public int HTGetDramaCnt(String keyword) {
		System.out.println("HTServiceImpl의 HTGetDramaCnt(검색 결과 드라마 리스트 갯수 값 호출 메서드) 시작.....");	
		int dramaCnt = htd.HTGetDramaCnt(keyword);
		return dramaCnt;
	}

	@Override
	public int HTGetEntertainmentCnt(String keyword) {
		System.out.println("HTServiceImpl의 HTGetEntertainmentCnt(검색 결과 예능 리스트 갯수 값 호출 메서드) 시작.....");	
		int entertainmentCnt = htd.HTGetEntertainmentCnt(keyword);
		return entertainmentCnt;
	}

	@Override
	public int HTGetDocumentaryCnt(String keyword) {
		System.out.println("HTServiceImpl의 HTGetDocumentaryCnt(검색 결과 다큐멘터리 리스트 갯수 값 호출 메서드) 시작.....");	
		int documentaryCnt = htd.HTGetDocumentaryCnt(keyword);
		return documentaryCnt;
	}

	@Override
	public int HTGetAnimationCnt(String keyword) {
		System.out.println("HTServiceImpl의 HTGetAnimationCnt(검색 결과 애니메이션 리스트 갯수 값 호출 메서드) 시작.....");	
		int animationCnt = htd.HTGetAnimationCnt(keyword);
		return animationCnt;
	}

	@Override
	public List<Product> rcmdTitleWord() {
		System.out.println("HTServiceImpl의  rcmdTitleWord메서드 시작.....");
		List<Product> titleWd = htd.rcmdTitleWord();
		return titleWd;
	}

	@Override
	public List<Product> rcmdCategoryWord() {
		System.out.println("HTServiceImpl의  rcmdCategoryWord메서드 시작.....");	
		List<Product> ctgryWd = htd.rcmdCategoryWord();
		return ctgryWd;
	}

	@Override
	public List<Product> rcmdGenreWord() {
		System.out.println("HTServiceImpl의  rcmdGenreWord메서드 시작.....");	
		List<Product> genreWd = htd.rcmdGenreWord();
		return genreWd;
	}

	@Override
	public List<Product> rcmdYearWord() {
		System.out.println("HTServiceImpl의  rcmdYearWord메서드 시작.....");	
		List<Product> yearWd = htd.rcmdYearWord(); 
		return yearWd;
	}

	@Override
	public List<Product> rcmdNationWord() {
		System.out.println("HTServiceImpl의  rcmdNationWord메서드 시작.....");	
		List<Product> nationWd = htd.rcmdNationWord();
		return nationWd;
	}

	@Override
	public List<Product> rcmdDirectorWord() {
		System.out.println("HTServiceImpl의  rcmdDirectorWord메서드 시작.....");	
		List<Product> directorWd = htd.rcmdDirectorWord();
		return directorWd;
	}

	@Override
	public List<Product> rcmdCastingWord() {
		System.out.println("HTServiceImpl의  rcmdCastingWord메서드 시작.....");	
		List<Product> castingWd = htd.rcmdCastingWord();
		return castingWd;
	}

	@Override
	public int GetPdtSearchCount(PdtSearchVo pvo) {
		System.out.println("HTServiceImpl의  GetPdtSearchCount메서드 시작.....");
		int searchCnt = htd.GetPdtSearchCount(pvo);
		return searchCnt;
	}

	@Override
	public List<Product> GetPdtSearchResult(PdtSearchVo pvo) {
		System.out.println("HTServiceImpl의  GetPdtSearchResult메서드 시작.....");
		List<Product> productsList = htd.GetPdtSearchResult(pvo);
		return productsList;
	}

	@Override
	public HashMap<String, String> mTotalCnt(PdtSearchVo pvo) {
		System.out.println("HTServiceImpl의  mTotalCnt메서드 시작.....");
		HashMap<String, String> mTotalCnt = htd.mTotalCnt(pvo); 
		return mTotalCnt;
	}

	@Override
	public HashMap<String, String> dTotalCnt(PdtSearchVo pvo) {
		System.out.println("HTServiceImpl의  dTotalCnt메서드 시작.....");
		HashMap<String, String> dTotalCnt = htd.dTotalCnt(pvo); 
		return dTotalCnt;
	}

	@Override
	public HashMap<String, String> eTotalCnt(PdtSearchVo pvo) {
		System.out.println("HTServiceImpl의  eTotalCnt메서드 시작.....");
		HashMap<String, String> eTotalCnt = htd.eTotalCnt(pvo);
		return eTotalCnt;
	}

	@Override
	public HashMap<String, String> dcTotalCnt(PdtSearchVo pvo) {
		System.out.println("HTServiceImpl의  dcTotalCnt메서드 시작.....");
		HashMap<String, String> dcTotalCnt = htd.dcTotalCnt(pvo);
		return dcTotalCnt;
	}

	@Override
	public HashMap<String, String> aTotalCnt(PdtSearchVo pvo) {
		System.out.println("HTServiceImpl의  aTotalCnt메서드 시작.....");
		HashMap<String, String> aTotalCnt = htd.aTotalCnt(pvo);
		return aTotalCnt;
	}

	@Override
	public List<Product> rcmdTitleWords(String category) {
		System.out.println("HTServiceImpl의  rcmdTitleWords메서드 시작.....");
		List<Product> titlelist = htd.rcmdTitleWords(category);
		return titlelist;
	}

	@Override
	public List<Product> getGenNameList() {
		System.out.println("HTServiceImpl의  getGenNameList메서드 시작.....");
		List<Product>getCategoryList= htd.getGenNameList();
		return getCategoryList;
	}

	@Override
	public List<ProductVo> getAllListByGenre(ProductApiVo productApiVo) {
		System.out.println("HTServiceImpl의  getAllListByGenre메서드 시작.....");
		List<ProductVo>getAllListByGenre= htd.getAllListByGenre(productApiVo);
		return getAllListByGenre;
	}
}
