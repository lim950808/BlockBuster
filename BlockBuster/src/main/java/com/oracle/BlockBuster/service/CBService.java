package com.oracle.BlockBuster.service;

import java.util.List;

import com.oracle.BlockBuster.model.CBSearchVO;
import com.oracle.BlockBuster.model.CBfaqDto;



public interface CBService {

	int					 total();
	List<CBfaqDto>		 listFaq(CBfaqDto cbFaqdto);
	List<CBfaqDto> 		 listManager();
	int					 insert(CBfaqDto cbFaqdto);
	CBfaqDto			 contentCB(int f_no);
	int 				 updateCB(CBfaqDto cbFaqdto);
	int 				 deleteCB(int f_no);
	List<CBfaqDto> 		 insertCB(CBSearchVO cbSearchVO);



	

}
