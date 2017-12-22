package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CommentVo;

@Repository
public class CommentDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public CommentDao(){
		System.out.println("--CommentDao()--");
	}
	
	public List<CommentVo> selectList(int idx){
		
		List<CommentVo> list = null;
		
		list = sqlSession.selectList("comment_list", idx);

		return list;
	}
	
}
