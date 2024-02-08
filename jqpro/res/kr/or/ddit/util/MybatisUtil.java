package kr.or.ddit.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisUtil {

	private static SqlSessionFactory SqlSessionFactory;
	
	static {

		//1. MyBatis의 환경 설정 파일(mybatis-config.xml)을 읽어와서 처리하여 sqlSessionFactory객체를 생성한다.
		InputStream in = null;

		try {
			// 1-1. 환경설정 파일을 읽어올 스트림 객체 생성
			
			in = Resources.getResourceAsStream("kr/or/ddit/config/mybatis-config.xml");
			
			// 1-2. 환경설정 파일을 읽어와 환경 설정 작업을 진행하고 환경 설정 작업을 진행한다.
			//		(환경 설정이 완료 되면 SqlSessionFactory 객체가 생성된다.)
			SqlSessionFactory = new SqlSessionFactoryBuilder().build(in);
		}catch(Exception e) {
			System.out.println("MyBatis 초기화 실패!!");
			e.printStackTrace();
		}finally {
			if(in!=null) try { in.close();}catch(IOException e) {}
		}
	}//static 초기화 블럭 끝...
	
	//SqlSession객체를 반환하는 메서드
	public static SqlSession getSqlSession() {
		SqlSession session = SqlSessionFactory.openSession();
		return session;
	}
	
}
