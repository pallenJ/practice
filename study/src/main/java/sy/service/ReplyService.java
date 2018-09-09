package sy.service;

import sy.bean.ReplyDto;
import sy.model.ReplyDao;

public interface ReplyService {
	ReplyDao getDao();
	void write(int bno, ReplyDto reply);
}
