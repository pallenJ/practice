package sy.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sy.bean.ReplyDto;
import sy.model.ReplyDao;

@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyDao replyDao;
	private Logger log = LoggerFactory.getLogger(getClass());
	@Override
	public ReplyDao getDao() {
		// TODO Auto-generated method stub
		return replyDao;
	}
	@Override
	public void write(int bno, ReplyDto reply) {
		// TODO Auto-generated method stub
		boolean show = forWrite(bno, reply);
		log.debug("reply success={}",show);
		if(show) getDao().replyNumUpdate(bno);//성공시 s_board의 댓글수 업데이트
	}
	private boolean forWrite(int bno, ReplyDto reply) {
		reply.setGno(0);
		reply.setParent(0);
		return getDao().write(bno, reply);
	}
	
	
}
