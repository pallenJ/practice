package sy.service;

import sy.model.MemberDao;

public interface MemberService {
	
	MemberDao getDao();
	boolean register(String email,String name,String pw);
	byte[] hexToByteArray(String hex); 
}
