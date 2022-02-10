package com.oracle.BlockBuster.service;

import java.util.HashMap;
import java.util.List;

import com.oracle.BlockBuster.model.PdtSearchVo;
import com.oracle.BlockBuster.model.Product;
import com.oracle.BlockBuster.model.ProductApiVo;
import com.oracle.BlockBuster.model.ProductVo;

public interface HTService {

	List<Product> HTGetSearchResult(String keyword);
	int HTGetSearchCnt(String keyword);
	int HTGetMovieCnt(String keyword);
	int HTGetDramaCnt(String keyword);
	int HTGetEntertainmentCnt(String keyword);
	int HTGetDocumentaryCnt(String keyword);
	int HTGetAnimationCnt(String keyword);
	List<Product> rcmdTitleWord();
	List<Product> rcmdCategoryWord();
	List<Product> rcmdGenreWord();
	List<Product> rcmdYearWord();
	List<Product> rcmdNationWord();
	List<Product> rcmdDirectorWord();
	List<Product> rcmdCastingWord();
	int GetPdtSearchCount(PdtSearchVo pvo);
	List<Product> GetPdtSearchResult(PdtSearchVo pvo);
	HashMap<String, String> mTotalCnt(PdtSearchVo pvo);
	HashMap<String, String> dTotalCnt(PdtSearchVo pvo);
	HashMap<String, String> eTotalCnt(PdtSearchVo pvo);
	HashMap<String, String> dcTotalCnt(PdtSearchVo pvo);
	HashMap<String, String> aTotalCnt(PdtSearchVo pvo);
	List<Product> rcmdTitleWords(String category);
	List<Product> getGenNameList();
	List<ProductVo> getAllListByGenre(ProductApiVo productApiVo);
}
