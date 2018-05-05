package sy.service;

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
		flag= memberDao.register(email, name, pw);
/*		try {
			if(!flag) throw new Exception();
		} catch (Exception e) {
			log.debug("회원가입에 실패하였습니다.");
		}*/
		return flag;
	}

	@Override
	public byte[] hexToByteArray(String hex) {
		// TODO Auto-generated method stub
		if (hex == null || hex.length() % 2 != 0) {
			return new byte[] {};
		}
		 int len = hex.length();
		 byte[] data = new byte[len / 2];
		    for (int i = 0; i < len; i += 2) {
		    	data[(int) Math.floor(i / 2)] = 
		    			(byte) Integer.parseInt(hex.substring(i, i + 2), 16);
		    }
		    return data;
	}

	
}
