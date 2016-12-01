package com.blog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.Dao.BlogMapper;
import com.blog.bean.Blog;

@Controller
public class BlogController {
	
	private Logger logger=Logger.getLogger(this.getClass());
	
	private static int pageSize = 12;
	
	@Autowired
	private BlogMapper blogMapper;
	
	@RequestMapping(value="/addBlog")
	public String addBlog(Model model){
		
		model.addAttribute("blog", new Blog());
		
		return "blogediter";
	}
	
	@RequestMapping(value="/saveAndUpdateBlog")
	public String saveAndUpdateBlog(@RequestParam int blogID, @ModelAttribute Blog blog, RedirectAttributes redirectAttributes){
		
		if(blogID == 0){
			blogMapper.save(blog);	
		}else{
			Map<String, Object> parm = new HashMap<>();
			parm.put("blogID", blogID);
			parm.put("blog", blog);
			blogMapper.update(parm);
		}			
		
		String tags = blog.getBlogTags();
		String[] tagList = tags.split("\\s+");
		
		/**返回前台结果**/
		Map<String, Object> responseParm = new HashMap<>();
		responseParm.put("blog", blog);
		responseParm.put("tagList", tagList);
		
		redirectAttributes.addFlashAttribute("responseParm",responseParm);
		
		return "redirect:/blog/" + blog.getBlogID();
	}
	
	@RequestMapping(value="/update/{blogID}")
	public String update(Model model, @PathVariable int blogID){
		
		Blog blog = blogMapper.findById(blogID);
		model.addAttribute("blog",blog);

		return "blogediter";
	}
	
	@RequestMapping(value="/delete/{blogID}")
	public String delete(@PathVariable int blogID){
		
		blogMapper.delete(blogID);

		return "welcome";
	}
	
	@RequestMapping(value="/blog/{blogID}")
	public String findBlogByID(Model model, @PathVariable int blogID){
		
		Blog blog = blogMapper.findById(blogID);
		
		String tags = blog.getBlogTags();
		String[] tagList = tags.split("\\s+");
		
		/**返回前台结果**/
		Map<String, Object> responseParm = new HashMap<>();
		responseParm.put("blog", blog);
		responseParm.put("tagList", tagList);
		
		model.addAttribute("responseParm",responseParm);
		
		return "blog";
	}
	@RequestMapping(value="/findAllBlogs/{keyTag}/{pageNo}")
	public String findAllBlogs(Model Model, @PathVariable String keyTag, @PathVariable int pageNo){
		
		/**分页查询参数**/
		Map<String, Object> parm = new HashMap<>();
		/**条目总数**/
		int blogCount = blogMapper.queryAllBlogsCount(keyTag);
		/**总页数**/
		int pageCount = (blogCount % pageSize == 0)?(blogCount/pageSize):(blogCount/pageSize + 1);
		/**查询开始位置**/
		int beginRow = (pageNo - 1) * pageSize;
		
		parm.put("keyTag", keyTag);
		parm.put("start", beginRow);
		parm.put("size", pageSize);
		
		/**结果接收**/
		List<Blog> bloglist = new ArrayList<Blog>();
		
		bloglist = blogMapper.findAll(parm);
		
		/**返回前台结果**/
		Map<String, Object> responseParm = new HashMap<>();
		responseParm.put("bloglist", bloglist);
		responseParm.put("keyTag", keyTag);
		responseParm.put("pageCount", pageCount);
		responseParm.put("blogCount", blogCount);
		responseParm.put("currentPage", pageNo);
		Model.addAttribute("responseParm",responseParm);

		logger.info("bloglist responseParm: " + responseParm);
		
		
		return "bloglist";
	}
	@RequestMapping(value="/search")
	public String findByKey(HttpServletRequest request, Model model){
		
		String searchKey = request.getParameter("searchKey");
		
		String[] searchKeyList = searchKey.split("\\s+");
		
		String targetKey = "";
		
		for(String temp : searchKeyList)
			targetKey  = targetKey + "%" + temp;
		
		/**分页查询参数**/
		Map<String, Object> parm = new HashMap<>();
		/**条目总数**/
		int blogCount = blogMapper.queryAllBlogsCount(targetKey);
		/**总页数**/
		int pageCount = (blogCount % pageSize == 0)?(blogCount/pageSize):(blogCount/pageSize + 1);
		/**查询开始位置**/
		int beginRow = 0;
		
		parm.put("keyTag", targetKey);
		parm.put("start", beginRow);
		parm.put("size", pageSize);
		
		/**结果接收**/
		List<Blog> bloglist = new ArrayList<Blog>();
		
		bloglist = blogMapper.findAll(parm);
		
		/**返回前台结果**/
		Map<String, Object> responseParm = new HashMap<>();
		responseParm.put("bloglist", bloglist);
		responseParm.put("keyTag", targetKey);
		responseParm.put("pageCount", pageCount);
		responseParm.put("blogCount", blogCount);
		responseParm.put("currentPage", 1);
		model.addAttribute("responseParm",responseParm);

		logger.info("bloglist responseParm: " + responseParm);
		
		return "bloglist";
	}
	@RequestMapping(value="/")
	public String welcomePage(Model Model){
		
		return "welcome";
	}
	@RequestMapping(value="/login")
	public String login(Model Model){
		
		return "test";
	}
}
