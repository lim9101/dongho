package dongho.clothes.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dongho.clothes.domain.Product;
import dongho.clothes.domain.User;
import dongho.clothes.service.HostService;
import dongho.clothes.service.UserService;


@Controller
public class ClothesController {
	@Autowired private UserService userService;
	@Autowired private HostService hostService;
	
	
	//페이지 이동
	
	//메인페이지
	@RequestMapping("/")
	public String index(){
		return "index";
	}
	
	//로그인페이지
	@RequestMapping("login")
	public String login(){
		return "html/login";
	}
	
	//회원가입페이지
	@RequestMapping("join")
	public String join(){
		return "html/join";
	}
	
	//회원정보수정페이지
	@RequestMapping("editInfo")
	public String editInfo(){
		return "html/editInfo";
	}
	
	//비밀번호찾기페이지
	@RequestMapping("findPw")
	public String findPw(){
		return "html/findPw";
	}
	
	//상품메인페이지
	@RequestMapping("main2")
	public String main2(HttpSession session){
		session.setAttribute("user",userService.getUser((String)session.getAttribute("userId")));
		return "html/main2";
	}

	//상세정보페이지
		@RequestMapping("productDetail")
		public String productDetail(){
			return "html/productDetail";
		}
	
	//웹기능
	//로그아웃
	@RequestMapping("logOut")
	public String logOut(HttpSession session){
		session.invalidate();
		return "index";
	}
	
	//회원추가페이지
	@RequestMapping("productAdd")
	public String addProduct(){
		return "html/productAdd";
	}
	
	//상세정보보기페이지
	@RequestMapping("detailPage")
	@ResponseBody
	public boolean detailPage(Product product,HttpSession session){
		session.setAttribute("product",product);
		return true;
	}
	
	//로그인체크기능
	@RequestMapping("check")
	@ResponseBody
	public boolean check(String id,String pw,HttpSession session){
		session.setAttribute("userId", id);
		return userService.check(id, pw);
	}
	
	//상품가저오기
	@RequestMapping ("getProducts")
	@ResponseBody
	public List<Product> getProducts(){
		return hostService.getProducts();
	}
	
	//회원추가기능
	@RequestMapping("addUser")
	@ResponseBody
	public boolean addUser(User user,HttpSession session){
		session.setAttribute("user",user);
		boolean result=userService.addUser(user);
		return result;
	}
	
	//회원정보수정기능
	@RequestMapping("updateInfo")
	@ResponseBody
	public boolean updateInfo(User user,HttpSession session){
		session.setAttribute("user", user);
		System.out.println(user);
		boolean result=userService.updateUser(user);
		return result;
	}
	
	//상품추가기능
	@RequestMapping("addProduct")
	@ResponseBody
	public boolean addProduct(Product product,HttpSession session){
		product.setUserId((String)session.getAttribute("userId"));
		return hostService.addProduct(product);
	}
//----------------------------------------------------------------------------
//upload system
	@Value("${savePath}")
	public String savePath;
	
	@RequestMapping(value="uploadImg" ,method =RequestMethod.POST)
	@ResponseBody
	public String upload(Product product,MultipartFile uploadFile, HttpServletRequest request,HttpSession session){
		String dir = request.getServletContext().getRealPath(savePath);
		String fileName = uploadFile.getOriginalFilename();
		save(dir+"/"+fileName,uploadFile);
		session.setAttribute("picture", fileName);
		return fileName;
	}
	
	private void save(String fullFileName, MultipartFile uploadFile){
		try{
			uploadFile.transferTo(new File(fullFileName));
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
}
