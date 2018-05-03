package sy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sy.model.MemberDao;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private OtherService otherService;
	
	@Override
	public MemberDao getDao() {
		// TODO Auto-generated method stub
		return memberDao;
	}

	@Override
	public boolean register(String email, String id, String pw) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try {
			flag= memberDao.register(email, id, pw);
			if(!flag) throw new Exception();
		} catch (Exception e) {
			otherService.showMessage("회원가입에 실패하였습니다.");
		}
		return flag;
	}

	
}
