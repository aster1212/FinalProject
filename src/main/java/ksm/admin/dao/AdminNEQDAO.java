package ksm.admin.dao;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import ksm.common.dao.AbstractDAO;

@Repository("adminNEQDAO")
public class AdminNEQDAO extends AbstractDAO{

	public void insertNEBoard(Map<String, Object> map) throws Exception{
		insert("adminNEQ.insertNEBoard", map);// N E 
	}
	
	public void updateNEBoard(Map<String, Object> map) throws Exception{
		update("adminNEQ.updateNEBoard", map);// N E 
	}
	
	public void deleteNEBoard(Map<String, Object> map) throws Exception{
		delete("adminNEQ.deleteNEBoard", map);// N E 
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardOne(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("board.selectBoardDetail", map);
	}
	
	public void insertQnAReply(Map<String, Object> map) throws Exception{
		insert("adminNEQ.insertQnAReply", map);
	}
	
	public void increaseReStep(Map<String, Object> map) throws Exception{
		update("adminNEQ.updateQnABoardReStep", map);
	}
	
	public void deleteQnaBoardTails(Map<String, Object> map) throws Exception{
		delete("adminNEQ.deleteQnaBoardTails", map);
	}
}
