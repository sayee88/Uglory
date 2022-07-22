package edu.kh.ugloryA.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.ugloryA.farm.model.vo.Farm;
import edu.kh.ugloryA.product.model.service.ProductService;
import edu.kh.ugloryA.product.model.vo.OptionType;
import edu.kh.ugloryA.product.model.vo.Product;
import edu.kh.ugloryA.product.model.vo.ProductCategory;
import edu.kh.ugloryA.product.model.vo.ProductImage;
import edu.kh.ugloryA.product.model.vo.WeeklyList;
import edu.kh.ugloryA.product.model.vo.WeeklyProduct;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	//상품 조회 페이지
	@GetMapping("/list")
	public String productList() {
		return "adminProduct/adminProductList";
	}
	
	//상품 전체 조회
	@ResponseBody
	@GetMapping("/selectAll")
	public String selectAll() {
		
		List<Product> productList = service.selectAll();
		
		return new Gson().toJson(productList);
	}
	
	//상품 상세보기
	@GetMapping("/detail/{productCode}")
	public String productDetail(@PathVariable("productCode") int productCode,
								Model model) {
		
		Map<String, Object> detailMap = service.productDetail(productCode);
		model.addAttribute("detailMap", detailMap);
		
		return "adminProduct/adminPDetail";
	}
	
	//상품 품절 처리
	@ResponseBody
	@GetMapping("/soldout")
	public int soldout(int productCode) {
		return service.soldout(productCode);
	}
	
	//상품 입고 처리
	@ResponseBody
	@GetMapping("/stocked")
	public int stocked(int productCode) {
		return service.stocked(productCode);
	}
	
	
	//상품 등록 페이지 화면 전환
	@GetMapping("/register")
	public String productInsert(String mode,
								@RequestParam(value="productCode", required = false, defaultValue = "0") int productCode,
								Model model) {
		
		Map<String, Object> detailMap = new HashMap<String, Object>();
		
		if(mode.equals("update")) {
			
			detailMap = service.productDetail(productCode);
			
		}

		model.addAttribute("detailMap", detailMap);
		
		List<ProductCategory> categoryList = service.selectCategory();
		List<Farm> farmList = service.selectFarmList();
		
		model.addAttribute("mode", mode);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("farmList", farmList);
		
		return "adminProduct/adminProductIn";
	}
	
	//상품 등록 및 수정
	@PostMapping("/register")
	public String productInsert(String mode,
								Product product,
								@RequestParam(value="productImg", required=false) List<MultipartFile> imageList,
								RedirectAttributes ra,
								HttpServletRequest req) throws IOException {
		
		String path = null;
		String message = null;
		
		String webPath = "/resources/img/productImage/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		if(mode.equals("insert")) {
			
			int productCode = service.insertProduct(product, imageList, webPath, folderPath);
			
			if(productCode>0) {
				path = "detail/" + productCode;
				message = "상품이 등록되었습니다.";
			} else {
				path = req.getHeader("referer");
				message = "상품 등록을 실패하였습니다.";
			}
			
			ra.addFlashAttribute("message", message);
			return "redirect:" + path;
			
		} else { // update일 때
			
			int result = service.updateProduct(product, imageList, webPath, folderPath);
			
			if(result>0) {
				path = "detail/" + product.getProductCode();
				message = "상품 수정을 성공하였습니다.";
			} else {
				path = req.getHeader("referer");
				message = "상품 수정에 실패하였습니다.";
			}
			
			ra.addFlashAttribute("message", message);
			return "redirect:" + path;
		}
	}
	
	
	//옵션 조회
	@ResponseBody
	@PostMapping("/option/select")
	public String selectOption(int productCode) {

		List<OptionType> optionList = service.selectOption(productCode);

		return new Gson().toJson(optionList);
	}
	
	//옵션 추가
	@ResponseBody
	@PostMapping("/option/insert")
	public int insertOption(OptionType optionType,
							RedirectAttributes ra,
							HttpServletRequest req) {
		
		return service.insertOption(optionType);
	}
	
	//옵션 삭제
	@ResponseBody
	@GetMapping("/option/delete")
	public int deleteOption(int optionCode) {
		return service.deleteOption(optionCode);
	}
	

	//구독 리스트 페이지
	@GetMapping("/weekly/list")
	public String weeklyList(Model model) {
		
		//이번주
		String key = "T";
		WeeklyList thisWeek = service.selectWeeklyList(key);

		//다음주
		key = "N";
		WeeklyList nextWeek = service.selectWeeklyList(key);
		
		//다다음주
		key = "A";		
		WeeklyList afterWeek = service.selectWeeklyList(key);
		
		model.addAttribute("thisWeek", thisWeek);
		model.addAttribute("nextWeek", nextWeek);
		model.addAttribute("afterWeek", afterWeek);
		
		return "adminProduct/adminWeeklyList";
	}
	
	//구독 리스트 등록 페이지
	@GetMapping("/weekly/register")
	public String weeklyInsert(Model model,
							   String mode,
							   String key) {
		
		WeeklyList weeklyList = new WeeklyList();
		
		if(mode.equals("insert")) {
		
			int result = service.insertWeeklyList(key);
			
			if(result>0) {
				weeklyList = service.selectWeeklyList(key);
			}
			
		} else {
			weeklyList = service.selectWeeklyList(key);
		}
		
		//상품 전부 조회
		List<Product> productList = service.selectAll();
		
		model.addAttribute("weeklyList", weeklyList);
		model.addAttribute("productList", productList);
		
		return "adminProduct/adminWeeklyListIn";
	}
	
	//수정 페이지에서 리스트 목록 불러오기
	@ResponseBody
	@PostMapping("/weekly/selectAll")
	public String selectWeeklyAll(int productListNo) {
		
		List<WeeklyProduct> deliveryList = service.selectWeeklyProduct(productListNo);
		
		return new Gson().toJson(deliveryList);
	}
	
	//수정 페이지에서 옵션 목록 불러오기
	@ResponseBody
	@PostMapping("/weekly/selectOption")
	public String selectWeeklyOption(int productCode) {
		
		List<OptionType> optionList = service.selectOption(productCode);
		
		return new Gson().toJson(optionList);
	}
	
	@ResponseBody
	@PostMapping("weekly/register")
	public int insertWeeklyProduct(int optionCode,
								   int productListNo) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("optionCode", optionCode);
		map.put("productListNo", productListNo);
		
		//중복 검사
		int result = service.listDupCheck(map);
		
		if(result>0) {
			return 0;
		}
		
		//상품 삽입
		return service.insertWeeklyProduct(map);
	}
	
	//삭제
	@ResponseBody
	@GetMapping("weekly/delete")
	public int deleteWeeklyProduct(int productNo) {
		return service.deleteWeeklyProduct(productNo);
	}
	
	
}
