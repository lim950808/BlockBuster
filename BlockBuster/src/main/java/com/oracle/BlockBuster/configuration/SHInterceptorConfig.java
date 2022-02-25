package com.oracle.BlockBuster.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.oracle.BlockBuster.service.SHInterceptorService;

@Configuration
public class SHInterceptorConfig implements WebMvcConfigurer {
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) { 
		   registry.addInterceptor(new SHInterceptorService()).addPathPatterns("/main")
		   													  .addPathPatterns("/reviewDetailSH") 		//김성휘
		   													  .addPathPatterns("/reviewWriteForm")
		   													  .addPathPatterns("/reviewWrite")
		   													  .addPathPatterns("/reviewProWrite")
		   													  .addPathPatterns("/reviewEditForm")
		   													  .addPathPatterns("/reviewList")
		   													  .addPathPatterns("/reviewProductList")
		   													  .addPathPatterns("/delete")
		   													  .addPathPatterns("/procedureForm")
		   													  .addPathPatterns("/Admin/productList") 	//임재억
		   													  .addPathPatterns("/Admin/detail")
		   													  .addPathPatterns("/Admin/updateForm")
		   													  .addPathPatterns("/Admin/update")
		   													  .addPathPatterns("/Admin/writeForm")
		   													  .addPathPatterns("/Admin/write")
		   													  .addPathPatterns("/Admin/delete")
		   													  .addPathPatterns("/Product/list")
		   													  .addPathPatterns("/CategoryList")
		   													  .addPathPatterns("/GenreList")
		   													  .addPathPatterns("/Product/productDetail")
		   													  .addPathPatterns("/Product/productDetail/addCart")
		   													  .addPathPatterns("/Cart/cartList")
		   													  .addPathPatterns("/Cart/deleteCart")
		   													  .addPathPatterns("/Cart/cartList/order")
		   													  .addPathPatterns("/Order/orderList")
		   													  .addPathPatterns("/Order/orderView")
		   													  .addPathPatterns("/FAQ/listCB") 			//이창빈
		   													  .addPathPatterns("/FAQ/writeFormCB")
		   													  .addPathPatterns("/writeCB")
		   													  .addPathPatterns("/FAQ/updateFormCB")
		   													  .addPathPatterns("/FAQ/updateCB")
		   													  .addPathPatterns("/FAQ/deleteCB")
		   													  .addPathPatterns("/listCB.do")
		   													  .addPathPatterns("/FAQ/listCB2")
		   													  .addPathPatterns("/Admin/viewallMember") 		//조병훈
		   													  .addPathPatterns("/memberrowDelete")
		   													  .addPathPatterns("/chat")
		   													  .addPathPatterns("/HTGetSearchResult")	//김흥태
		   													  .addPathPatterns("/HTGetPdtSearchResult")
		   													  .addPathPatterns("/RestAPI")
		   													  .addPathPatterns("/member/myinfo")		//김동현
		   													  .addPathPatterns("/member/memberModifyForm")
		   													  .addPathPatterns("/member/passwordModifyForm")
		   													  .addPathPatterns("/member/memberUpdate")
		   													  .addPathPatterns("/member/memberDelete")
		   													  .addPathPatterns("/member/nickNameChk")
		   													  .addPathPatterns("/member/emailChk");
	}
	
	
}
