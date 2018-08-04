package sy.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import sy.bean.BoardDto;

@Repository
public interface BoardDao {
	
	boolean register(BoardDto board);
	boolean register(String board,String title,String secret,String content,String writer);
	
	//전체 공지 목록
	List<BoardDto> boardlist();
	List<BoardDto> boardSearch(String search , String keyword);
	
	//공지 정보 상세보기
	BoardDto boarddetail(int no);
	
	//공지 수정
	boolean boardEdit(BoardDto board);
	
	//공지 삭제
	boolean boarddelete(int no);

	BoardDto readPlus(BoardDto board);
	
}
