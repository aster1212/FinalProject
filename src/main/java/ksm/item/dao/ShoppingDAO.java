package ksm.item.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ksm.common.dao.*;

@Repository("shoppingDAO")
public class ShoppingDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectItemManList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectItemManList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectItemWomanList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectItemWomanList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectShoesList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectShoesList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectAccList(Map<String,Object>map) throws Exception {
		
		return (List<Map<String,Object>>)selectList("item.selectAccList",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectManUpList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectManUpList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectManMidList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectManMidList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectManDownList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectManDownList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectWomanUpList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectWomanUpList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectWomanMidList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectWomanMidList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectWomanDownList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectWomanDownList",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectShoesManList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectShoesManList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectShoesWomanList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectShoesWomanList",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectItemDetail(Map<String,Object>map) throws Exception {
		return (Map<String,Object>) selectOne("item.selectItemDetail",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectQnaDetail(Map<String,Object>map) throws Exception {
		return (Map<String,Object>) selectOne("item.selectQnaDetail",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectQnaList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectQnaList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectCommentList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectCommentList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectPhotoCommentList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectPhotoCommentList",map);
	}
	
	public void itemQnaWrite(Map<String, Object> map) throws Exception{
		insert("item.itemQnaWrite", map);
	}

	
	public void itemCommentWrite(Map<String,Object> map) throws Exception {
		insert("item.itemCommentWrite",map);
	}
	
	public void itemPhotoCommentWrite(Map<String,Object> map) throws Exception {
		insert("item.itemPhotoCommentWrite",map);
	}
	
	public void updateQna(Map<String, Object> map) throws Exception{
		update("item.updateQna", map);
	}
	@SuppressWarnings("unchecked")
	   public Map<String,Object> getCommentPasswd(Map<String, Object> map) throws Exception{
	      return (Map<String, Object>) selectOne("item.selectCommentPasswd",map);
	   }

	
	public void deleteCommentDelete(Map<String,Object> map)throws Exception {
		delete("item.deleteCommentDelete",map);
	}
	public void deletePhotoDelete(Map<String,Object> map)throws Exception {
		delete("item.deletePhotoDelete",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectSearchItemList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectSearchItemList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectSearchCombineList(Map<String,Object>map) throws Exception {
		return (List<Map<String,Object>>)selectList("item.selectSearchCombineList",map);
	}
	
}