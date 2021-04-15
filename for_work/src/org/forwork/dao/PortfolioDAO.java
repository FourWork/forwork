package org.forwork.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.forwork.domain.Member;
import org.forwork.domain.Portfolio;
import org.forwork.domain.Portfolio_Language;
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
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			System.out.println("@listPortfolio DAO");
			list = sqlSession.getMapper(PortfolioMapper.class).listPortfolio(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Portfolio_Language> listLanguages(String member_id){
		List<Portfolio_Language> list = null;
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			System.out.println("@listlanguage DAO");
			list = sqlSession.getMapper(PortfolioMapper.class).listLanguage(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Member loadMemberCard(String member_id) {

		Member member = null;
		try (SqlSession sqlSesssion = getSqlSessionFactory().openSession();) {
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
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(PortfolioMapper.class).insertPortfolio(portfolio);
			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return re;
	}
	
	public String getPortfolio_max_id() {
		String re = "";
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(PortfolioMapper.class).getPortfolio_max_id();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return re;
	}

	public int insertPfLanguage(Portfolio_Language pfLang) {
		int re = -1;
		System.out.println("insertPFLanguage-DAO");
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try  {
			re = sqlSession.getMapper(PortfolioMapper.class).insertPfLanguage(pfLang);
			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlSession != null) {
				try {
					sqlSession.close();
				} catch (Exception e2) {}
			}
		}

		System.out.println("가져온 언어" + re);
		return re;

//	Map<String, Object> pfLangMap= null;
//	List<Map<String, Object>> pfLangList = new ArrayList<Map<String,Object>>();
//	
//	for(int i =0;i<pfLang.getPortfolio_language().length;i++) {
//		pfLangMap = new HashMap<String,Object>();
//		pfLangMap.put("portfolio_language", pfLang.getPortfolio_language()[i]);
//		pfLangList.add(pfLangMap);
//	}
//	System.out.println(pfLangList.toString());
//	return sqlSession.insert("insertPortfolioLanguange", pfLangMap);

	}
}
