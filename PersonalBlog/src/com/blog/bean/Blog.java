package com.blog.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Blog implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int blogID;
	private String blogTile;
	private String blogTags;
	private String blogContent;
	private int userID;
	private Timestamp createDate;
	private Timestamp lastEditDate;
	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Blog(int blogID, String blogTile, String blogTags, String blogContent, int userID, Timestamp createDate,
			Timestamp lastEditDate) {
		super();
		this.blogID = blogID;
		this.blogTile = blogTile;
		this.blogTags = blogTags;
		this.blogContent = blogContent;
		this.userID = userID;
		this.createDate = createDate;
		this.lastEditDate = lastEditDate;
	}
	public int getBlogID() {
		return blogID;
	}
	public void setBlogID(int blogID) {
		this.blogID = blogID;
	}
	public String getBlogTile() {
		return blogTile;
	}
	public void setBlogTile(String blogTile) {
		this.blogTile = blogTile;
	}
	public String getBlogTags() {
		return blogTags;
	}
	public void setBlogTags(String blogTags) {
		this.blogTags = blogTags;
	}
	public String getBlogContent() {
		return blogContent;
	}
	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public Timestamp getLastEditDate() {
		return lastEditDate;
	}
	public void setLastEditDate(Timestamp lastEditDate) {
		this.lastEditDate = lastEditDate;
	}
	@Override
	public String toString() {
		return "Blog [blogID=" + blogID + ", blogTile=" + blogTile + ", blogTags=" + blogTags + ", blogContent="
				+ blogContent + ", userID=" + userID + ", createDate=" + createDate + ", lastEditDate=" + lastEditDate
				+ "]";
	}
	
}
