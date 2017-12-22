package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardVo;

@Repository
public class BoardDao {

	@Autowired
	SqlSession sqlSession;
	
	public BoardDao(){
		System.out.println("--BoardDao()--");
	}
	
	public List<BoardVo> selectList(Map map) {
        
		List<BoardVo> list=null;
	
		list = sqlSession.selectList("board_condition_list",map);
		
		return list;
	}
	
	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		int total = 0;
	
		total = sqlSession.selectOne("board_row_total",map);
		
		return total;
	}
	
	public BoardVo selectOne(int idx) {
		// TODO Auto-generated method stub
		
		BoardVo vo = null;
	
		vo = sqlSession.selectOne("board_one",idx);
		
		return vo;
	}

	public int update_readhit(int idx) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.update("board_readhit",idx);
		
		return res;
	}
	
	public int update_step(BoardVo baseVo) {
		// TODO Auto-generated method stub
		int res = 0;                    // true : auto commit
		
		res = sqlSession.update("board_update_step",baseVo);
				
		return res;
	}

	public int reply(BoardVo vo) {
		// TODO Auto-generated method stub
		int res = 0;                            // true : auto commit
		
		res = sqlSession.insert("board_reply",vo);
		
		return res;
	}
	
}
