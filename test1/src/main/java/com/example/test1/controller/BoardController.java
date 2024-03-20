package com.example.test1.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.test1.dao.BoardService;
import com.example.test1.dao.CodeService;
import com.example.test1.dao.UserService;
import com.example.test1.model.Code;
import com.google.gson.Gson;

@Controller
public class BoardController {
	// mapper의 이름과 동일하게 작성하기

	@Autowired
	BoardService boardService;

	@Autowired
	HttpSession session;

	@Autowired
	CodeService codeService;
	
	@Autowired
    UserService userService;

	@RequestMapping("/boardList.do") //목록보기
	public String boardList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		map.put("kind", "board");
		List<Code> codeList = codeService.searchCodeList(map);
		
		request.setAttribute("boardList", new Gson().toJson(codeList));
		request.setAttribute("map", map);
		return "/board-list";
	}

	@RequestMapping(value = "/boardList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String offset = (String) map.get("offset");
		String limit = (String) map.get("limit");
		map.put("offset", Integer.parseInt(offset));
		map.put("limit", Integer.parseInt(limit));
		resultMap = boardService.searchBoardList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/boardView.do")//상세보기
	public String boardView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		// request의 HttpServletRequest
		
		request.setAttribute("map", map);
	
		return "/board-view";
	}
	
	@RequestMapping(value = "/boardView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardDetail(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardInfo(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping("/boardInsert.do") //게시글 작성
	public String insertList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/board-insert";
	}
	
	@RequestMapping(value = "/boardInsert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.writeBoardList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/boardDelete.do") //게시글 삭제
	public String inserBbsList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/board-delete";
	}
	
	@RequestMapping(value = "/boardDelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.removeBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/boardEdit.do") //게시글 수정
	public String editList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		
		return "/board-edit";
	}
	
	@RequestMapping(value = "/boardEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.editBoard(map);
		return new Gson().toJson(resultMap);
	}
	

	@RequestMapping("/boardRecipe.do")//레시피 게시판 보기
	public String boardRecipe(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		// request의 HttpServletRequest
		request.setAttribute("map", map);
		
		return "/board-recipe";
	}

	
	@RequestMapping(value = "/boardRecipe.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardRecipeList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardList(map);
		return new Gson().toJson(resultMap);
	}
	
	
	//고객 센터 서비스
	@RequestMapping("/customerService.do")
	public String productOrganic(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/customer-service";
	}
	
	//등록한 문의 확인 페이지
	@RequestMapping("/customerInquiryView.do")
	public String customerInquiryView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		System.out.println(map);
		return "/customer-inquiry-view";
	}
	
	
	//고객 문의 리스트
	@RequestMapping(value = "/customerService.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String customerService(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchCustomerInquiryList(map);
		return new Gson().toJson(resultMap);
	}

	
	@RequestMapping(value = "/BoardProductList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/BoardProductView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardInfo(map);
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
	
	@RequestMapping("/boardFileUploadMain.dox")
    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("boardNo") int boardNo, HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String path="c:\\img";
        try {
 
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
            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("fileName", saveFileName);
                map.put("path", "..\\img\\");
                map.put("boardNo", boardNo);
                map.put("fileSize", size);
                map.put("etc", extName);
                map.put("orgName",originFilename);
                
                // insert 쿼리 실행
               // testService.addBoardImg(map);
                boardService.addBoardFile(map);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "redirect:boardRecipe.do";
            }
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return "redirect:boardRecipe.do";
    }
	
	
	
	@RequestMapping("/boardFileUploadContents.dox")
    public String result2(@RequestParam("file2") MultipartFile multi, @RequestParam("boardNo") int boardNo, HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String path="c:\\img";
        try {
 
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
            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("fileName", saveFileName);
                map.put("path", "..\\img\\");
                map.put("boardNo", boardNo);
                map.put("fileSize", size);
                map.put("etc", extName);
                map.put("orgName",originFilename);
                
                // insert 쿼리 실행
               // testService.addBoardImg(map);
                boardService.addBoardContentsFile(map);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "redirect:boardRecipe.do";
            }
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return "redirect:boardRecipe.do";
    }
	
	@RequestMapping("/boardUser.do")
	public String boardUser(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		// request의 HttpServletRequest
		request.setAttribute("map", map);
		
		return "/board-user";
	}
	
	// 레시피 게시판 유저 정보
	@RequestMapping(value = "/boardUser.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.getUser(map);
		return new Gson().toJson(resultMap);
	}
	
	// 레시피 게시판 첨부 파일 정보
	@RequestMapping(value = "/boardFile.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardFile(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardFileList(map); 
		return new Gson().toJson(resultMap);
	}
	
	// 메인 페이지용 레시피 게시글 출력
	@RequestMapping(value = "/boardAndFileList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardAndFileList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardAndFileList(map); 
		return new Gson().toJson(resultMap);
	}
	
	// ---------------------------------------------------------
	
	//고객 문의 등록
	@RequestMapping(value = "/customerInquiry.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String customerInquiry(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.addCustomerInquiry(map);
		return new Gson().toJson(resultMap);
	}
	
	//등록한 문의 확인
	@RequestMapping(value = "/InquiryView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String InquiryView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchInquiryInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	//등록한 문의 삭제
	@RequestMapping(value = "/InquiryRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String InquiryRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.removeInquiry(map);
		return new Gson().toJson(resultMap);
	}
	
	//등록한 문의 수정
	@RequestMapping(value = "/InquiryEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String InquiryEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.editInquiry(map);
		return new Gson().toJson(resultMap);
	}
	
}


