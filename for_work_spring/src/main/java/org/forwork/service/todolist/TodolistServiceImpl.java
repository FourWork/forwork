package org.forwork.service.todolist;

import java.util.List;

import org.springframework.stereotype.Service;
import org.forwork.domain.Todolist;
import org.forwork.mapper.TodolistMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class TodolistServiceImpl implements TodolistService {
	
	private TodolistMapper mapper;

	@Override
	public int insert(Todolist todolist) {
		log.info("?  ?Ό μΆκ?");
		
		return mapper.insertTodolist(todolist);
	}

	@Override
	public List<Todolist> memberTodolist(int member_id) {
		log.info("??λ³? ?  ?Ό λͺ©λ‘");
		
		return mapper.selectTodolist(member_id);
	}

	@Override
	public int updateDone(int todolist_id) {
		log.info("?  ?Ό ?λ£?");
		
		return mapper.updateDonelist(todolist_id);
	}

	@Override
	public List<Todolist> doingList(int member_id) {
		log.info("?΄?Ό ?  ?Ό λͺ©λ‘");
		
		return mapper.selectDoinglist(member_id);
	}

	@Override
	public List<Todolist> doneList(int member_id) {
		log.info("?λ£λ ?  ?Ό λͺ©λ‘");
		
		return mapper.selectDonelist(member_id);
	}

	@Override
	public int delete(int todolist_id) {
		log.info("?  ?Ό 1κ°? ?­? ");
		
		return mapper.deleteTodolist(todolist_id);
	}

	@Override
	public int deleteAll(int member_id) {
		log.info("?λ£λ ?  ?Ό ? μ²? ?­? ");
		
		return mapper.deleteAllDonelist(member_id);
	}

	@Override
	public int update(Todolist todolist) {
		log.info("?  ?Ό ?? ");
			
		return mapper.updateTodolist(todolist);
	}

}
