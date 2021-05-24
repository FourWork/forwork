package org.forwork.service.chatting;

import org.forwork.config.RedisConfig;
import org.forwork.domain.MyData;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

@Service
public class GetSetService {
	
//	@Autowired
//	RedisTemplate<String, Object> redisTemplate;
    
    public void test() {
    	ConfigurableApplicationContext ctx = new AnnotationConfigApplicationContext(RedisConfig.class);
    	
    	try {
    		@SuppressWarnings("unchecked")
			RedisTemplate<String, Object> redisTemplate = (RedisTemplate<String, Object>)ctx.getBean("redisTemplate");
        	
            ValueOperations<String, Object> vop = redisTemplate.opsForValue();
            vop.set("new", new MyData("1", "홍길동"));
            String result = (String) vop.get("new");
            System.out.println(result);
            
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ctx.close();
		}
    	
    }
}
