package org.forwork.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.forwork.domain.Post;
import org.forwork.mapper.PostMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PostServiceImpl implements PostService {
	
	private PostMapper mapper;

	@Override
	public int register(Post post) {
		log.info("새 게시글 등록..." + post);
		
		return mapper.insertPostSelectKey(post);
	}

	@Override
	public Post get(Long post_id) {
		log.info("게시글 상세 보기..." + post_id);
		
		return mapper.getPost(post_id);
	}
	
	@Override
	public int addHitcount(Long post_id) {
		log.info("게시글 조회 수");
		
		return mapper.updateHitcount(post_id);
	}

	@Override
	public boolean modify(Post post) {
		log.info("게시글 수정..." + post);
		
		return mapper.updatePost(post) == 1;
	}

	@Override
	public boolean remove(Long post_id) {
		log.info("게시글 삭제..." + post_id);
		
		return mapper.deletePost(post_id) == 1;
	}

	@Override
	public List<Post> getList(Long board_id) {
		log.info("게시글 목록..." + board_id);
		
		return mapper.listPost(board_id);
	}

	@Override
	public List<Post> getNotice(int project_id) {
		log.info("프로젝트별 공지 사항 미리 보기...");
		
		return mapper.listNotice(project_id);
	}

	@Override
	public List<Post> getBoard(int project_id) {
		log.info("프로젝트별 최신 글 목록...");
		
		return mapper.listBoard(project_id);
	}

}
