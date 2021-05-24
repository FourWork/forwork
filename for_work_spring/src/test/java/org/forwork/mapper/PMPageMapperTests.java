package org.forwork.mapper;

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
public class PMPageMapperTests {
	
	@Setter(onMethod_=@Autowired)
	public PMPageMapper mapper;

	@Test
	public void testGetTeamProgress(){
		
		log.info(mapper.getColumCount(1));
		}
	
	@Test
	public void testGetPersonalCount(){
		
		
		mapper.getPersonalCount(1).forEach(tp -> log.info(tp));
	}
	
	@Test
	public void testGetPersonalTasks(){
		
		mapper.getPersonalTasks(1,1).forEach(tasks -> log.info(tasks));
	}
	
	@Test
	public void testGetProjects(){
		
		mapper.getProjects().forEach(pr -> log.info(pr));
	}
	}

