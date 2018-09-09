package sy.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import sy.bean.ReplyDto;

@Repository
public interface ReplyDao {
	
	boolean write(int bno,ReplyDto reply);
	ReplyDto replyDetail(int no);
	
	public List<ReplyDto> allList();
	
	public List<ReplyDto> replyList(int bno);

	List<ReplyDto> myReplyList(String email);

	// 댓글 수정
	boolean replyEdit(int no,String content);
	boolean replyEdit(ReplyDto reply);

	// 댓글 삭제
	boolean replyDelete(int no);
	boolean replyDelete(ReplyDto reply);
	boolean replyNumUpdate(int no);

}
