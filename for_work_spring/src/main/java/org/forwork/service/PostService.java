package org.forwork.service;

import java.util.List;

import org.forwork.domain.Post;

public interface PostService {

	public int register(Post post);
	
	public Post get(Long post_id);
	
	public int addHitcount(Long post_id);
	
	public boolean modify(Post post);
	
	public boolean remove(Long post_id);
	
	public List<Post> getList(Long board_id);
	
//	public List<Post> getList(Criteria cri, Long board_id);
	
	public List<Post> getNotice(int project_id);
	
	public List<Post> getBoard(int project_id);
}
