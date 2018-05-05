package sy.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sy.model.MemberDao;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Override
	public MemberDao getDao() {
		// TODO Auto-generated method stub
		return memberDao;
	}

	@Override
	public boolean register(String email, String name, String pw) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try {
			flag= memberDao.register(email, name, pw);
			if(!flag) throw new Exception();
		} catch (Exception e) {
			log.debug("회원가입에 실패하였습니다.");
		}
		return flag;
	}

	
}
