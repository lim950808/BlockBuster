package com.oracle.BlockBuster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.BlockBuster.dao.CBFaqDao;
import com.oracle.BlockBuster.model.CBSearchVO;
import com.oracle.BlockBuster.model.CBfaqDto;

@Service
public class CBServiceImpl implements CBService {
	@Autowired
	private CBFaqDao fd;
	
	/*-----------------FAQ list 화면, paging 처리-----------------*/
	@Override
	public int total() {
		System.out.println("CBServiceImpl Start total....");
		int totCnt = fd.total();
		System.out.println("CBServiceImpl Start totCnt ->" + totCnt);
		return totCnt;
		
	}

	@Override
	public List<CBfaqDto> listFaq(CBfaqDto cbFaqdto) {
		List<CBfaqDto> faqList = null;
		System.out.println("CBServiceImpl listFaq Start....");
		faqList = fd.lisFaq(cbFaqdto);
		System.out.println("CBServiceImpl listFaq faqList.size() ->>" + faqList.size());
		return faqList;
	}

	/*-----------------FAQ 쓰기-----------------*/
	@Override
	public List<CBfaqDto> listManager() {
		List<CBfaqDto> faqList = null;
		System.out.println("CBServiceImpl listManager Start....");
		faqList = fd.listManager();
		System.out.println("CBServiceImpl listManager faqList.size()->>>" + faqList.size());
		return faqList;
	}

	@Override
	public int insert(CBfaqDto cbFaqdto) {
		int result = 0;
		System.out.println("CBServiceImpl insert Start...");
		result = fd.insert(cbFaqdto);
		return result; 
	}
	

	/*-----------------FAQ 수정-----------------*/
	@Override
	public CBfaqDto contentCB(int f_no) {
		System.out.println("CBServiceImpl contentCB....");
		CBfaqDto cbFaqdto = null;
		cbFaqdto = fd.contentCB(f_no); 
		return cbFaqdto;
	}

	@Override
	public int updateCB(CBfaqDto cbFaqdto) {
		System.out.println("CBServiceImpl update ...");
		int bbb = 0; 
		bbb = fd.updateCB(cbFaqdto);
		return bbb;
	}

	/*-----------------FAQ 삭제-----------------*/	
	@Override
	public int deleteCB(int f_no) {
		int result = 0;
		System.out.println("CBServiceImpl deleteCB Start....");
		result = fd.deleteCB(f_no);
		
		return result;
	}

	/*-----------------FAQ 검색-----------------*/
	@Override
	public List<CBfaqDto> insertCB(CBSearchVO cbSearchVO) {
		/* 검색dto를 따로 CBSearchVO로 주었음 */
		System.out.println("CBServiceImpl cbSearchVO Start....");
		List<CBfaqDto> faqList = fd.insertCB(cbSearchVO);
		return faqList;
	}

	
	
	


	
	
	
	
}
