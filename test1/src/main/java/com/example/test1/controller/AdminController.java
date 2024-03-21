package com.example.test1.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.test1.dao.AdminService;
import com.example.test1.dao.UserService;
import com.google.gson.Gson;

@Controller
public class AdminController {
	
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	UserService userService;
	
	//어드민 페이지 메인
	@RequestMapping("/admin-main.do") 
    public String main(Model model) throws Exception{		

        return "/admin-Main2"; 
    }
	
	//상품 추가 페이지
	@RequestMapping("/productAdd.do") 
	public String productAdd(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		
		return "/product-add";
	}
	
	@RequestMapping("/AdminPaymentList.do") 
	public String AdminPaymentList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		
		return "/admin-Payment-list";
	}
	//상품 리스트 페이지
	@RequestMapping("/AdminProductList.do") 
	public String productList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		
		return "/admin-product-list";
	}
	
	//상품 업데이트 페이지
	@RequestMapping("/AdminProductUpdate.do") 
	public String productUpdate(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/admin-product-update";
	}
	//상품 디테일 페이지
		@RequestMapping("/AdminProductView.do") 
		public String productView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/admin-product-view";
		}
	//상품 차트 페이지
	@RequestMapping("/AdminProductChart.do") 
		public String AdminProductChart(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			
			return "/admin-product-chart";
	}
		
	@RequestMapping("/KakaoPay.do") 
	public String kakaoPay(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		
		return "/KakaoPay";
	}
	//유저리스트
	@RequestMapping("/AdminUserList.do") 
	public String AdminUserList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		
		return "/admin-user-list";
	}
	
	
	
	@RequestMapping("/adminUserDetail.do") 
	public String adminUserDetail(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		System.out.println(map);
		
		return "/admin-user-detail";
	}
	
	
		
		
	@RequestMapping(value = "/productAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.addProduct(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/AdminProductList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.searchProductList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/AdminProductView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.searchProductView(map);
		
		return new Gson().toJson(resultMap);
	}
	
	private String genSaveFileName(String extName) {
        String fileName = "";
        
        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;
        
        return fileName;
    }
	// 이미지 업로드 ( 리스트에 보이는 썸네일 )
	@RequestMapping("/fileUploadMain.dox")
    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("itemNo") int itemNo, HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String path="c:\\img";
        try {
        	Calendar cal = Calendar.getInstance();
        	int year = cal.get(Calendar.YEAR);
            int month = cal.get(Calendar.MONTH) + 1;
            int date = cal.get(Calendar.DATE);
            String Today = Integer.toString(year) + Integer.toString(month) + Integer.toString(date);
            //String uploadpath = request.getServletContext().getRealPath(path);
            String uploadpath = path;
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            long size = multi.getSize();
            String saveFileName = genSaveFileName(extName);
            
            System.out.println("uploadpath : " + uploadpath);
            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
            String path2 = System.getProperty("user.dir");
            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img\\adminProduct\\"+Today+"\\ListThumbnail\\");
            if(!multi.isEmpty())
            {
            	 File file = new File(path2 + "\\src\\main\\webapp\\img\\adminProduct\\"+Today+"\\ListThumbnail\\", saveFileName);
                 boolean flg = file.mkdirs(); // 디렉토리 없으면 false 있으면 생성 후 true 리턴
                 multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("fileName", saveFileName);
                map.put("path", "..\\img\\adminProduct\\"+Today+"\\ListThumbnail\\");
                map.put("itemNo", itemNo);
                map.put("fileSize", size);
                map.put("etc", extName);
                map.put("orgName",originFilename);
                
                // insert 쿼리 실행
               // testService.addBoardImg(map);
                adminService.addProductFile(map);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "redirect:AdminProductList.do";
            }
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return "redirect:AdminProductList.do";
    }
	
	
	//이미지 업로드 ( 상세보기 썸네일 )
	@RequestMapping("/fileUploadContents.dox")
    public String result2(@RequestParam("file2") MultipartFile multi, @RequestParam("itemNo") int itemNo, HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String path="c:\\img";
        try {
        	Calendar cal = Calendar.getInstance();
        	int year = cal.get(Calendar.YEAR);
            int month = cal.get(Calendar.MONTH) + 1;
            int date = cal.get(Calendar.DATE);
            String Today = Integer.toString(year) + Integer.toString(month) + Integer.toString(date);
            //String uploadpath = request.getServletContext().getRealPath(path);
            String uploadpath = path;
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            long size = multi.getSize();
            String saveFileName = genSaveFileName(extName);
            System.out.println("uploadpath : " + uploadpath);
            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
            String path2 = System.getProperty("user.dir");
            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img\\adminProduct\\"+Today+"\\ContentsThumbnail\\");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\img\\adminProduct\\"+Today+"\\ContentsThumbnail\\", saveFileName);
                boolean flg = file.mkdirs(); // 디렉토리 없으면 false 있으면 생성 후 true 리턴
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("fileName", saveFileName);
                map.put("path", "..\\img\\adminProduct\\"+Today+"\\ContentsThumbnail\\");
                map.put("itemNo", itemNo);
                map.put("fileSize", size);
                map.put("etc", extName);
                map.put("orgName",originFilename);
                
                // insert 쿼리 실행
               // testService.addBoardImg(map);
                adminService.addProductContentsFile(map);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "redirect:AdminProductList.do";
            }
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return "redirect:AdminProductList.do";
    }
	
	@RequestMapping("/fileUploadDetail.dox")
    public String result3(@RequestParam("file3") MultipartFile multi, @RequestParam("itemNo") int itemNo, HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String path="c:\\img";
        try {
        	Calendar cal = Calendar.getInstance();
        	int year = cal.get(Calendar.YEAR);
            int month = cal.get(Calendar.MONTH) + 1;
            int date = cal.get(Calendar.DATE);
            String Today = Integer.toString(year) + Integer.toString(month) + Integer.toString(date);
            //String uploadpath = request.getServletContext().getRealPath(path);
            String uploadpath = path;
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            long size = multi.getSize();
            String saveFileName = genSaveFileName(extName);
            System.out.println("uploadpath : " + uploadpath);
            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
            String path2 = System.getProperty("user.dir");
            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img\\adminProduct\\"+Today+"\\ContentsDetail\\");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\img\\adminProduct\\"+Today+"\\ContentsDetail\\", saveFileName);
                boolean flg = file.mkdirs(); // 디렉토리 없으면 false 있으면 생성 후 true 리턴
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("fileName", saveFileName);
                map.put("path", "..\\img\\adminProduct\\"+Today+"\\ContentsDetail\\");
                map.put("itemNo", itemNo);
                map.put("fileSize", size);
                map.put("etc", extName);
                map.put("orgName",originFilename);
                
                // insert 쿼리 실행
               // testService.addBoardImg(map);
                adminService.addProductDetailFile(map);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "redirect:AdminProductList.do";
            }
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return "redirect:AdminProductList.do";
    }
	
	
	
	
	private int toString(int year) {
		// TODO Auto-generated method stub
		return 0;
	}

	//상품 업데이트 쿼리문
	@RequestMapping(value = "/AdminProductUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.editProduct(map);
		System.out.println(map);
		return new Gson().toJson(resultMap);
	}
	
	
	
	
	//파일 삭제 쿼리
	@RequestMapping(value = "/fileDelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String fileDelete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.removefile(map);
		return new Gson().toJson(resultMap);
	}
	//상품 월 매출 차트
	@RequestMapping(value = "/AdminProductChart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ProductChart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.searchProductChartList(map);
		return new Gson().toJson(resultMap);
	}
	//유저 리스트 가져오기
	@RequestMapping(value = "/AdminUserList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String AdminUserList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.searchUserList(map);
		return new Gson().toJson(resultMap);
	}
	//전체 유저리스트(메인에서 쓸 데이터)
	@RequestMapping(value = "/AdminUserListAll.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String AdminUserListAll(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.searchUserListAll(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/AdminUserDetail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String AdminUserDetail(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.searchUserInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	
	
	@RequestMapping(value = "/AdminUserTypeEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String AdminUserTypeEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.updateUserType(map);
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping(value = "/AdminUserLoginCntZero.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String AdminUserLoginCntZero(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.updateUserLoginCntZero(map);
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping(value = "/PaymentList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String PaymentList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.searchPaymentListAll(map);
		return new Gson().toJson(resultMap);
	}
	
	
}