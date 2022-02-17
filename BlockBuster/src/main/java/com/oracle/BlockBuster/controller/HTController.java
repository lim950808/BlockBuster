package com.oracle.BlockBuster.controller;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.oracle.BlockBuster.model.PdtSearchVo;
import com.oracle.BlockBuster.model.Product;
import com.oracle.BlockBuster.model.ProductApiVo;
import com.oracle.BlockBuster.model.ProductVo;
import com.oracle.BlockBuster.service.HTService;

@Controller
public class HTController {
	
	@Autowired
	private HTService hts;
	
	//검색어를 통해 결과 가져오는 메서드
	@PostMapping(value="HTGetSearchResult")
	public String HTGetSearchResult(String keyword, Model model) {
		//검색어가 있을 때 
		
		if(keyword.equals("") || keyword.equals(null)) {
			int searchCnt = 0;
			model.addAttribute("keyword",keyword);
			model.addAttribute("searchCnt",searchCnt);
			return "/search/searchResults";
		}else{
			System.out.println("HTController의 HTGetSearchResult 시작.....");	
			System.out.println("HTController의 HTGetSearchResult의  keyword : "+keyword);
			int searchCnt = hts.HTGetSearchCnt(keyword);  //product테이블의 모든정보 + 장르명 포함 리스트의 count(수) 정보
			List<Product> productsList = hts.HTGetSearchResult(keyword); //product테이블의 모든정보 + 장르명 포함 리스트
			
			 // 각 장르별 검색리스트 count(view에서 검색어 있는지 없는지에 대한 여부 validation용)
			int movieCnt = hts.HTGetMovieCnt(keyword);
			int dramaCnt = hts.HTGetDramaCnt(keyword);
			int entertainmentCnt = hts.HTGetEntertainmentCnt(keyword);
			int documentaryCnt = hts.HTGetDocumentaryCnt(keyword);
			int animationCnt = hts.HTGetAnimationCnt(keyword);
			
			System.out.println("HTController의 HTGetSearchResult의 searchCnt값  : "+searchCnt);	
			System.out.println("HTController의 HTGetSearchResult의  productsList.size() : "+productsList.size());
			System.out.println("HTController의 HTGetSearchResult의 movieCnt값  : "+movieCnt);	
			System.out.println("HTController의 HTGetSearchResult의 dramaCnt값  : "+dramaCnt);	
			System.out.println("HTController의 HTGetSearchResult의 entertainmentCnt값  : "+entertainmentCnt);	
			System.out.println("HTController의 HTGetSearchResult의 documentaryCnt값  : "+documentaryCnt);	
			System.out.println("HTController의 HTGetSearchResult의 animationCnt값  : "+animationCnt);	
			
			model.addAttribute("productsList",productsList);
			model.addAttribute("searchCnt",searchCnt); 
			model.addAttribute("keyword",keyword);
			model.addAttribute("mCnt",movieCnt);
			model.addAttribute("dramaCnt",dramaCnt);
			model.addAttribute("eCnt",entertainmentCnt);
			model.addAttribute("docuCnt",documentaryCnt);
			model.addAttribute("aCnt",animationCnt);		
			return "/search/searchResults";
			//검색어가 없을 때 
			}
	}
		
	@RequestMapping(value="rcmdSearchWord")
	@ResponseBody
	public List<Product> rcmdSearchWord() {
		System.out.println("HTController의 rcmdSearchWord메서드 시작...");
		
		List<Product> titleNTotalWd = hts.rcmdTitleWord(); //제목
		List<Product> castingWd = hts.rcmdCastingWord(); //출연진
		List<Product> ctgryWd = hts.rcmdCategoryWord(); //카테고리 명
		List<Product> genreWd = hts.rcmdGenreWord(); //장르 명
		List<Product> yearWd = hts.rcmdYearWord(); //년도
		List<Product> nationWd = hts.rcmdNationWord(); //국가
		List<Product> directorWd = hts.rcmdDirectorWord(); //감독
				
		titleNTotalWd.addAll(ctgryWd);	
		titleNTotalWd.addAll(genreWd);
		titleNTotalWd.addAll(yearWd);
		titleNTotalWd.addAll(nationWd);
		titleNTotalWd.addAll(directorWd);
		titleNTotalWd.addAll(castingWd);	
		return titleNTotalWd;
	}
	
	
	//products페이지 검색결과 페이지 (재억님 검색창 form의 전송 방식에 따라 맞추기)
	@RequestMapping(value="HTGetPdtSearchResult") 
	public String GetPdtSearchResult(PdtSearchVo pvo, Model model) {
		System.out.println("HTController의 rcmdSearchWord메서드 시작...");
		//검색어가 있을 때
		if(!pvo.getKeyword().equals("") || !pvo.getKeyword().equals(null)) {
		int searchCnt = hts.GetPdtSearchCount(pvo); //검색어로 조회한 장르 구분없는 카테고리 검색 결과 갯수
		List<Product> productsList = hts.GetPdtSearchResult(pvo); //검색어로 조회한 장르 구분없는 카테고리 검색 결과 리스트
		System.out.println("HTController의 rcmdSearchWord메서드의 searchCnt : "+searchCnt);
		System.out.println("HTController의 rcmdSearchWord메서드의 productsList.size() : "+productsList.size());
		
		//조건별
		if(pvo.getCategory().equals("1000")) { 
			//검색어를 통한 영화 모든 장르별 결과 갯수 받아올 map객체
			HashMap<String, String> mTotalCnt = hts.mTotalCnt(pvo);
				model.addAttribute("mHorrorCnt",mTotalCnt.get("1100"));
				model.addAttribute("mActionCnt",mTotalCnt.get("1200"));
				model.addAttribute("mCrimeCnt",mTotalCnt.get("1300"));
				model.addAttribute("mWarCnt",mTotalCnt.get("1400")); 
				model.addAttribute("mSFCnt",mTotalCnt.get("1500"));
				model.addAttribute("mComedyCnt",mTotalCnt.get("1600"));
				model.addAttribute("mRomanceCnt",mTotalCnt.get("1700")); 
				model.addAttribute("mc",hts.GetPdtSearchCount(pvo));
		 }else if(pvo.getCategory().equals("2000")) { 
			HashMap<String, String> dTotalCnt = hts.dTotalCnt(pvo);
				model.addAttribute("dUsCnt",dTotalCnt.get("2100"));
				model.addAttribute("dJpnCnt",dTotalCnt.get("2200"));
				model.addAttribute("dKorCnt",dTotalCnt.get("2300"));
				model.addAttribute("dc",hts.GetPdtSearchCount(pvo));
		 }else if(pvo.getCategory().equals("3000")) { 
			HashMap<String, String> eTotalCnt = hts.eTotalCnt(pvo);
				model.addAttribute("eKbsCnt",eTotalCnt.get("3100"));
				model.addAttribute("eSbsCnt",eTotalCnt.get("3200"));
				model.addAttribute("eMbcCnt",eTotalCnt.get("3300"));
				model.addAttribute("eTvnCnt",eTotalCnt.get("3400"));
				model.addAttribute("eJtbcCnt",eTotalCnt.get("3500"));
				model.addAttribute("ec",hts.GetPdtSearchCount(pvo));
		 }else if(pvo.getCategory().equals("4000")) { 
			HashMap<String, String> dcTotalCnt = hts.dcTotalCnt(pvo);
				model.addAttribute("dHisCnt",dcTotalCnt.get("4100"));
				model.addAttribute("dDscvCnt",dcTotalCnt.get("4200"));
				model.addAttribute("dNgpCnt",dcTotalCnt.get("4300"));
				model.addAttribute("doc",hts.GetPdtSearchCount(pvo));
		 }else if(pvo.getCategory().equals("5000")) { 
			HashMap<String, String> aTotalCnt = hts.aTotalCnt(pvo); 
				model.addAttribute("aDCnt",aTotalCnt.get("5100"));
				model.addAttribute("aJCnt",aTotalCnt.get("5200"));
				model.addAttribute("ac",hts.GetPdtSearchCount(pvo));
		}
		//필수
		model.addAttribute("productsList", productsList);
		model.addAttribute("searchCnt", searchCnt);
		model.addAttribute("keyword", pvo.getKeyword());
		return "/search/productsResults";		
	}else {//검색어가 null  일때
		model.addAttribute("keyword",pvo.getKeyword());
		return "/search/productsResults";			
		}
	}
	
	//카테고리별 페이지(products)에서 각 카데고리별 제목 추천하는 부분
	@RequestMapping(value="rcmdTitleWords")
	@ResponseBody
	public List<Product> rcmdTitleWords(String category) {
		System.out.println("HTController의 rcmdTitleWords메서드 시작...");
		List<Product> titlelist = hts.rcmdTitleWords(category);
		return titlelist;
	}
	
	//restAPI(ful) 테스트 view 페이지
	@RequestMapping(value="RestAPI")
	public String apiTest(Model model) {
		System.out.println("HTController의 apiTest메서드 시작...");
		List<Product>getGenNameList= hts.getGenNameList(); // 장르넘버 및 카테고리명, 장르명 가져오는 메서드
		System.out.println("HTController의 getGenNameList.size() => "+getGenNameList.size());
		model.addAttribute("cList",getGenNameList);
		return "/dataCenter/dataCenter";
	}
	
	// 각 장르 전체 영화 정보 리스트 출력
	@RequestMapping(value="listbygenre", method = RequestMethod.GET)
	@ResponseBody
	public List<ProductVo> getAllListByGenre(ProductApiVo productApiVo) {
		System.out.println("HTController의 getAllListByGenre메서드 시작...");
		List<ProductVo>getAllListByGenre= hts.getAllListByGenre(productApiVo); 
		System.out.println("getAllListByGenre.size() => "+getAllListByGenre.size());
		return getAllListByGenre;
	}
}