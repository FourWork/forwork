package org.forwork.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.forwork.domain.CommentPageDto;
import org.forwork.domain.Comments;
import org.forwork.domain.Criteria;
import org.forwork.mapper.CommentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CommentServiceImpl implements CommentService {
	
	@Setter(onMethod_=@Autowired)
	private CommentMapper mapper;

	@Override
	public int register(Comments comment) {
		log.info("register..." + comment);
		
		return mapper.insertComment(comment);
	}

	@Override
	public Comments get(Long comment_id) {
		log.info("get..." + comment_id);
		
		return mapper.getComment(comment_id);
	}

	@Override
	public int modify(Comments comment) {
		log.info("modify..." + comment);
		
		return mapper.updateComment(comment);
	}

	@Override
	public int remove(Long comment_id) {
		log.info("remove..." + comment_id);
		
		return mapper.deleteComment(comment_id);
	}

	@Override
	public List<Comments> getList(Criteria cri, Long post_id) {
		log.info("get comment list of a post " + post_id);
		
		return mapper.listComment(cri, post_id);
	}

	@Override
	public CommentPageDto getListPage(Criteria cri, Long post_id) {
		return new CommentPageDto(mapper.getCountByPost(post_id), mapper.listCommentPaging(cri, post_id));
	}

}
