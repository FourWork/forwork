package org.forwork.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.forwork.domain.Member;
import org.forwork.domain.Portfolio;
import org.forwork.mapper.PortfolioMapper;


public class PortfolioDAO {
//프로토타입 생성자
	private static PortfolioDAO dao = new PortfolioDAO();

public static PortfolioDAO getInstance() {
	return dao;
}

public SqlSessionFactory getSqlSessionFactory() {
	String resource = "mybatis-config.xml";
	InputStream in = null;
	
	try {
		in = Resources.getResourceAsStream(resource);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return new SqlSessionFactoryBuilder().build(in);
}

public List<Portfolio> listPortfolio(String member_id) {

	List<Portfolio> list = null;
	try (SqlSession sqlSession = getSqlSessionFactory().openSession();){
		list = sqlSession.getMapper(PortfolioMapper.class).listPortfolio(member_id);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

public Member loadMemberCard(String member_id) {
	
	Member member = null;
	try(SqlSession sqlSesssion = getSqlSessionFactory().openSession();){
		System.out.println("loadMemberCard Service");
		member = sqlSesssion.getMapper(PortfolioMapper.class).loadMemberCard(member_id);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return member;
}


public int insertPortfolio(Portfolio portfolio) {
		 int re = -1;

		 System.out.println("insertPortfolio-DAO");
		 System.out.println(portfolio);
			try (SqlSession sqlSession = getSqlSessionFactory().openSession();){
				re = sqlSession.getMapper(PortfolioMapper.class).insertPortfolio(portfolio);
				if(re>0) {
					sqlSession.commit();
				}else {
					sqlSession.rollback();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return re;
}

}
