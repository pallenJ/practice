package sy.model;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Repository;

import sy.bean.MemberDto;

@Repository
public interface MemberDao {

	boolean register(String email,String id,String pw);
	boolean register(MemberDto mem);
	
	boolean login(String email,String pw);
	boolean login(MemberDto mem);
	
	MemberDto myInfo(String email);
	
	boolean delete(String email,String pw);
	boolean delete(MemberDto mem);
	
	//------------
	
	List<MemberDto>list();
	List<MemberDto>select(String col,String keyword);
	Set<String>   emailList();
	boolean overlapCheck(String email);
}
