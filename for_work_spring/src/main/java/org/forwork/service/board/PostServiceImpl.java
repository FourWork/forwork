package org.forwork.service.board;

import java.util.List;

import org.springframework.stereotype.Service;
import org.forwork.domain.Criteria;
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
		log.info("?ƒˆ ê²Œì‹œê¸? ?“±ë¡?..." + post);
		
		return mapper.insertPostSelectKey(post);
	}

	@Override
	public Post get(Long post_id) {
		log.info("ê²Œì‹œê¸? ?ƒ?„¸ ë³´ê¸°..." + post_id);
		
		return mapper.getPost(post_id);
	}
	
	@Override
	public int addHitcount(Long post_id) {
		log.info("ê²Œì‹œê¸? ì¡°íšŒ ?ˆ˜");
		
		return mapper.updateHitcount(post_id);
	}

	@Override
	public int modify(Post post) {
		log.info("ê²Œì‹œê¸? ?ˆ˜? •..." + post);
		
		return mapper.updatePost(post);
	}

	@Override
	public int remove(Long post_id) {
		log.info("ê²Œì‹œê¸? ?‚­? œ..." + post_id);
		
		return mapper.deletePost(post_id);
	}

	@Override
	public List<Post> getList(Long board_id) {
		log.info("ê²Œì‹œê¸? ëª©ë¡..." + board_id);
		
		return mapper.listPost(board_id);
	}

	@Override
	public List<Post> getListPage(Criteria cri, Long board_id) {
		return mapper.listPostWithPaging(cri, board_id);
	}
	
	@Override
	public int getTotal(Criteria cri, Long board_id) {
		log.info("get total count");
		return mapper.getCountByBno(cri, board_id);
	}	
	
	@Override
	public List<Post> getNotice(int project_id) {
		log.info("?”„ë¡œì ?Š¸ë³? ê³µì? ?‚¬?•­ ë¯¸ë¦¬ ë³´ê¸°...");
		
		return mapper.listNotice(project_id);
	}

	@Override
	public List<Post> getBoard(int project_id) {
		log.info("?”„ë¡œì ?Š¸ë³? ìµœì‹  ê¸? ëª©ë¡...");
		
		return mapper.listBoard(project_id);
	}

}
