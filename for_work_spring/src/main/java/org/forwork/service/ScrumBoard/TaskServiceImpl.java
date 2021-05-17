package org.forwork.service.ScrumBoard;

import java.util.List;
import java.util.Map;

import org.forwork.domain.Task;
import org.forwork.domain.TaskLog;
import org.forwork.mapper.TaskLogMapper;
import org.forwork.mapper.TaskMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class TaskServiceImpl implements TaskService {
	

	private TaskMapper mapper;
	private TaskLogMapper logMapper;

	@Override
	@Transactional
	public int insertTask(Task task) {
		int project_id = 1;
		String content = "create task by." + task.getWriter();
		log.info("INSERT TASK.....!!!!" + task);
		mapper.insertTask(task);
		return logMapper.insertLog(task.getTask_id(), content, project_id);
	}

	@Override
	public List<Task> listTask() {
		
		log.info("GET TASK LIST.....!!!!" );
		
		return mapper.listTask();
	}

	@Override
	@Transactional
	public int deleteTask(int task_id) {
		int project_id = 1;
		String member_name = "tester";
		String content = "delete task by." + member_name;
		logMapper.insertLog(task_id+"", content, project_id);
		log.info("DELETE TASK.....!!!!" + task_id);
		
		return mapper.deleteTask(task_id);
	}

	@Override
	@Transactional
	public int updateTask(Task task) {
		int project_id = 1;
		// 내용 수정한 사용자의 이름
		String member_name = "tester";
		Task beforeTask = mapper.detailTask(Integer.parseInt(task.getTask_id()));
		String content = "change content Before : " + beforeTask.getTask_content()
			+" Now : " + task.getTask_content()+" by."+member_name;
		
		log.info("UPDATE TASK.....!!!!" + task);
		logMapper.insertLog(task.getTask_id(), content, project_id);
		return mapper.updateTask(task);
	}

	@Override
	public Task detailTask(int task_id) {

		log.info("DETAIL TASK.....!!!!" + task_id);
		
		return mapper.detailTask(task_id);
	}

	@Override
	@Transactional
	public int moveTask(Map<String, String> changeData) {
		int project_id = 1;
		String member_name = "tester";
		String content = null;
		log.info("move task : " + changeData.toString());
		Task task = mapper.detailTask(Integer.parseInt(changeData.get("task_id")));

		switch (Integer.parseInt(task.getTask_type_id())) {
		case 1:content = "move task Before column : Stories";
			break;
		case 2:content = "move task Before column : To-Do"; break;
		case 3:content = "move task Before column : Doing"; break;
		case 4 :content = "move task Before column : Done"; break;
		default:
			break;
		}
		
		mapper.decreaseUpdate(changeData.get("previdx"), task.getTask_type_id());
		
		String type_id = null;
		switch (changeData.get("col_name")) {
			case "Stories":
				type_id = "1";break;
			case"To-Do":
				type_id = "2";break;
			case"Doing":
				type_id = "3";break;
			case"Done":
				type_id = "4";break;
			default:break;
		}
		content += " Now column : "+changeData.get("col_name")+" by. "+member_name;

		mapper.increaseUpdate(changeData.get("nowidx"), type_id);
		
		task.setTask_index(changeData.get("nowidx"));
		task.setTask_type_id(type_id);
		log.info("update task : " + task);
		logMapper.insertLog(task.getTask_id(), content, project_id);
		return mapper.moveTask(task);
	}

	@Override
	@Transactional
	public int addRes(int task_id, String name) {
		Task task = mapper.detailTask(task_id);
		task.setResponsibility(name);
		return mapper.updateTask(task);
	}

	@Override
	public String getLog(int task_id) {
		TaskLog tl = logMapper.getLog(task_id+"");
		if(tl == null){
			return "null";
		}
		return tl.getLog_detail() + "  <br>" + tl.getLog_time().toGMTString();
	}

	@Override
	public List<TaskLog> getLogs(int task_id) {
		return logMapper.getLogList(task_id);
	}

}
