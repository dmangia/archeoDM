package com.archeodm.repository;

import java.util.List;

import com.archeodm.model.Posts;




public interface PostsDao {

	
	public List<Posts> getByUser(String id);
	public Posts getPostDetail(Integer id);
	public List<Posts> getByCategory(String categ);
	public int insertRow(Posts post);
	public int deleteRow(Integer id);
	public int updateRow(Posts articolo);
	
	
}
