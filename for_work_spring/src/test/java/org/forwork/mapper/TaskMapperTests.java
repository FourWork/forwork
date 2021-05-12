package org.forwork.mapper;

import org.forwork.domain.Task;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes={org.forwork.config.RootConfig.class})
@Log4j
public class TaskMapperTests {
	

	@Setter(onMethod_=@Autowired)
	public TaskMapper mapper;
	

	@Test
	public void testInsertTask(){
		
		Task task = new Task();
		
		task.setTask_content("로그인 구현");
		task.setTask_index("1");
		task.setWriter("이가영");
		
		mapper.insertTask(task);
	}

	@Test
	public void testListTask(){
		
		mapper.listTask().forEach(task->log.info(task));
	}
	
	@Test
	public void testDeleteTask(){
		
		int task_id = 85;
		int count = mapper.deleteTask(task_id);
		log.info("DELETE RESULT: " + count);

	}
	
	@Test
	public void testUpdateTask(){
		
		Task task = new Task();
		task.setTask_content("수정했음!!!");
		task.setTask_id("84");
		
		int count = mapper.updateTask(task);
		log.info("UPDATE RESULT: " + count);
	}
	
	@Test
	public void testDetailTask(){
		
		log.info(mapper.detailTask(65));
	}
	
	@Test
	public void testMapper(){
		
		log.info(mapper);
	}
}
