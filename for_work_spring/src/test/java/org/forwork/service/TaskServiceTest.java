package org.forwork.service;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration(classes= {org.forwork.config.RootConfig.class})
public class TaskServiceTest {
	@Setter(onMethod_=@Autowired)
	private TaskService service;
	
	@Test
	public void moveTaskTest(){
		Map<String, String> testData = new HashMap<>();
		testData.put("previdx", "1");
		testData.put("nowidx", "1");
		testData.put("task_id","1" );
		testData.put("col_name", "DOING");
		log.info("TEST DATA : " + testData);
		
		log.info(service.moveTask(testData));
	}
}
