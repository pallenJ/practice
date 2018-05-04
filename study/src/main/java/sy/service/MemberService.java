package sy.service;

import sy.model.MemberDao;

public interface MemberService {
	
	MemberDao getDao();
	boolean register(String email,String id,String pw);
	/*void showMessage(String message);*/
}
