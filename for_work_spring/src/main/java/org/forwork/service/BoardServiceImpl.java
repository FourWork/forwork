package org.forwork.service;

import java.util.List;

import org.forwork.service.BoardService;
import org.springframework.stereotype.Service;
import org.forwork.domain.Board;
import org.forwork.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper mapper;

	@Override
	public int init(int project_id) {
		
		if (mapper.listBoardMenu(project_id).size() == 0) {
			log.info("새 프로젝트 공지 사항, 기본 게시판 생성...");
			
			mapper.insertNoticeBoard(project_id);
			mapper.insertDefaultBoard(project_id);
		}
		
		return mapper.listBoardMenu(project_id).size();
	}
	
	@Override
	public int register(Board board) {
		log.info("새 게시판 등록..." + board);
		
		return mapper.insertBoardSelectKey(board);
	}

	@Override
	public Board get(Long board_id) {
		log.info("게시판 이름..." + board_id);
		
		return mapper.getBoard(board_id);
	}

	@Override
	public int modify(Board board) {
		log.info("게시판 수정..." + board);
		
		return mapper.updateBoard(board);
	}

	@Override
	public int remove(Long board_id) {
		log.info("게시판 삭제..." + board_id);
		
		return mapper.deleteBoard(board_id);
	}

	@Override
	public List<Board> getList(int project_id) {
		log.info("프로젝트별 게시판 목록...");
		
		return mapper.listBoardMenu(project_id);
	}


}
