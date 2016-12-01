package com.blog.Dao;

import java.util.List;
import java.util.Map;

import com.blog.bean.Blog;

public interface BlogMapper {
	void save(Blog blog);
	boolean update(Map<String, Object> hashmap);
	boolean delete(int id);
	Blog findById(int blogID);
	List<Blog> findAll(Map<String, Object> hashmap);
	int queryAllBlogsCount(String key);
}
