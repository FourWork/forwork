package org.forwork.controller.ScrumBoard;

import java.util.List;
import java.util.Map;

import org.forwork.domain.Task;
import org.forwork.service.ScrumBoard.TaskService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/task/")
@RestController
@Log4j
@AllArgsConstructor
public class TaskController {
	
	
	private TaskService service;
	
	@PostMapping(value="/add", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertTask(@RequestBody Task task){
		
		log.info("Task: " + task);
		
		int insertCount = service.insertTask(task);
		
		log.info("Task INSERT COUNT: " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/list", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Task>> listTask(){
		
		log.info("TASK LIST.............!!!");
		
		return new ResponseEntity<>(service.listTask(), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{task_id}", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Task> detailTask(@PathVariable("task_id") int task_id){
		
		log.info("GET TASK DETAIL: " + task_id);
		
		return new ResponseEntity<>(service.detailTask(task_id), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{task_id}", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteTask(@PathVariable("task_id") int task_id){
		
		log.info("DELETE TASK: " + task_id);
		
		return service.deleteTask(task_id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH}, value="/{task_id}", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateTask(@RequestBody Task task, @PathVariable("task_id") int task_id){
		
		String taskId = ""+task_id;
		
		task.setTask_id(taskId);
		
		log.info("task_id: " + task_id);
		
		return service.updateTask(task) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
<<<<<<< HEAD
	@PostMapping(value="/move", consumes=MediaType.APPLICATION_JSON_UTF8_VALUE)
=======
	@PatchMapping(value="/move", consumes=MediaType.APPLICATION_JSON_UTF8_VALUE)
>>>>>>> refs/remotes/origin/beom
	public ResponseEntity<String> moveTask(@RequestBody Map<String, String>param){
		
		System.out.println(param);
		if(service.moveTask(param)== 1){			
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}else{
			return new ResponseEntity<String>("false",HttpStatus.OK);			
		}
	}
	
<<<<<<< HEAD
	
	
	
	
	
=======
	@PatchMapping(value="/addRes",consumes="application/json")
	public ResponseEntity<String> addRes(@RequestBody Map<String, String>param){
		service.addRes(Integer.parseInt(param.get("task_id")), param.get("member_id"));
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	
	@GetMapping(value="/log/{task_id}",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<TaskLog> getLog(@PathVariable("task_id") int task_id){
		TaskLog task = service.getLog(task_id);
		return new ResponseEntity<TaskLog>(task,HttpStatus.OK);
	}
	
	@GetMapping(value="/logs/get/{task_id}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<TaskLog>> getLogs(@PathVariable("task_id") int task_id){
		List<TaskLog> list = service.getLogs(task_id);
		return new ResponseEntity<List<TaskLog>>(list,HttpStatus.OK);
	}
>>>>>>> refs/remotes/origin/beom
	
	
	
	
	
	
	
	
	
	
	
	
}
