package org.forwork.service;

import java.util.List;

import org.forwork.domain.Board;

public interface BoardService {

	public int register(Board board);
	
	public Board get(Long board_id);
	
	public boolean modify(Board board);
	
	public boolean remove(Long board_id);
	
	public List<Board> getList(int project_id);
}
