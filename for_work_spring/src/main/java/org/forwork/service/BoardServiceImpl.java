package org.forwork.service;

import java.util.List;

import org.forwork.domain.Board;
import org.forwork.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper mapper;

	@Override
	public int register(Board board) {
		log.info("�� �Խ��� ���..." + board);
		
		return mapper.insertBoardSelectKey(board);
	}

	@Override
	public Board get(Long board_id) {
		log.info("�Խ��� �̸�..." + board_id);
		
		return mapper.getBoard(board_id);
	}

	@Override
	public boolean modify(Board board) {
		log.info("�Խ��� ����..." + board);
		
		return mapper.updateBoard(board) == 1;
	}

	@Override
	public boolean remove(Long board_id) {
		log.info("�Խ��� ����..." + board_id);
		
		return mapper.deleteBoard(board_id) == 1;
	}

	@Override
	public List<Board> getList(int project_id) {
		log.info("������Ʈ�� �Խ��� ���...");
		
		return mapper.listBoardMenu(project_id);
	}

}
