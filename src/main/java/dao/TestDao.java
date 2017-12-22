package dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class TestDao {

	@Autowired
	SqlSession sqlSession;

	
	public int row_count(){
		int count=0;
		
		count = sqlSession.selectOne("board_row_total",new HashMap());
		
		return count;
	}
	
	
	
}
