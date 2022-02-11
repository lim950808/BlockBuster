package com.oracle.BlockBuster.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.BlockBuster.model.CBSearchVO;
import com.oracle.BlockBuster.model.CBfaqDto;

@Repository
public class CBFaqDaoImpl implements CBFaqDao {
	
	@Autowired
	private SqlSession session;
	
	/*-----------------FAQ list 화면, paging 처리-----------------*/
	@Override
	public int total() {
		int tot = 0;
		System.out.println("CBFaqDaoImpl Start total.....");
		
		//Result =>  14
		try {   //selectOne은 1개만 받을때 사용 
			tot= session.selectOne("cbFaqTotal"); //Faq테이블에 Total값을 가져오겠다.
			System.out.println("CBFaqDaoImpl total tot-> "+ tot);
		}catch(Exception e) {
			System.out.println("CBFaqDaoImpl total Exception-> "+ e.getMessage());
		}
    	return tot;
	}

	@Override
	public List<CBfaqDto> lisFaq(CBfaqDto cbFaqdto) {
		List<CBfaqDto> faqList = null;
		System.out.println("CBFaqDaoImpl lisFaq Start......");
		try  {
			// Naming Rule                  Map Id       parameter
//			faqList = session.selectList("cbFaqListAll3", cbFaqdto);  //selectList여러개 받을때
			faqList = session.selectList("cbFaqListAll3", cbFaqdto);
		}catch (Exception e) {
			System.out.println("CBFaqDaoImpl lisFaq Exception ->>" + e.getMessage());
		}
		  return faqList;
	}

	/*-----------------FAQ 쓰기-----------------*/
	@Override
	public List<CBfaqDto> listManager() {
		List<CBfaqDto> faqList = null;
		System.out.println("CBFaqDaoImpl listManager Start....!!");
		try {
			//                            Naming Rule
			faqList = session.selectList("cbFaqSelect");
		}catch (Exception e) {
			System.out.println("CBFaqDaoImpl listManager Exception->>>>>>" +e.getMessage());
		}
		return faqList;
	}

	@Override
	public int insert(CBfaqDto cbFaqdto) {
		int result = 0;
		System.out.println("CBFaqDaoImpl insert start..");
		try {
			result  = session.insert("insertFaq",cbFaqdto);
		} catch (Exception e) {
			System.out.println("CBFaqDaoImpl insertFaq Exception->"+e.getMessage());
		}
		return result;
	}

	
	/*-----------------FAQ 수정-----------------*/
	@Override
	public CBfaqDto contentCB(int f_no) {
		System.out.println("CBFaqDaoImpl contentCB Start....");
		CBfaqDto cbFaqdto = new CBfaqDto();
		
		try {
			//						mapper Id 		parameter
			cbFaqdto = session.selectOne("cbFaqSelOne" , f_no);
			System.out.println("CBFaqDaoImpl contentCB cbFaqdto.getF_no()->>>" + cbFaqdto.getF_no());
			
		}catch (Exception e) {
			System.out.println("CBFaqDaoImpl contentCB Exception ->>>>" + e.getMessage());
		}
		System.out.println("CBFaqDaoImpl contentCB cbFaqdto.getF_title()->>>" + cbFaqdto.getF_title());
		
		return cbFaqdto;
	}

	@Override
	public int updateCB(CBfaqDto cbFaqdto) {
		System.out.println("CBFaqDaoImpl updateCB start..");
		int bbb = 0;
		try {
			bbb  = session.update("cbFaqUpdate",cbFaqdto);
		} catch (Exception e) {
			System.out.println("CBFaqDaoImpl updateCB Exception->"+e.getMessage());
		}
		return bbb;
	}

	/*-----------------FAQ 삭제-----------------*/	
	@Override
	public int deleteCB(int f_no) {
		int result = 0;
		System.out.println("CBFaqDaoImpl deleteCB start....!");
		
		try {
			result = session.delete("deleteFaq",f_no);
		}catch (Exception e) {
			System.out.println("CBFaqDaoImpl deleteCB Exception->>>" + e.getMessage());
		}
		return result;
	}
	/*-----------------FAQ 검색-----------------*/	
	@Override
	public List<CBfaqDto> insertCB(CBSearchVO cbSearchVO) {
		List<CBfaqDto> faqList = null;
		System.out.println("CBFaqDaoImpl insertCB start..");
		try {
			faqList  = session.selectList("faqList",cbSearchVO);
		} catch (Exception e) {
			System.out.println("CBFaqDaoImpl insertCB Exception->"+e.getMessage());
		}
		return faqList;
	}

	

	
	

		 
	

}
