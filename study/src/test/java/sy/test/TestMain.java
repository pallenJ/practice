package sy.test;

import java.io.InputStream;
import java.net.URL;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import sy.bean.BoardDto;
import sy.bean.ReplyDto;
import sy.configuration.JdbcConfiguration;
import sy.model.BoardDao;
import sy.model.MemberDao;
import sy.model.ReplyDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = JdbcConfiguration.class)
public class TestMain {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	@Test
	public void daoTest() {
		/*memberDao.login("pallennellap17@gmail.com", "1234");*/
		
		/*BoardDto board = new BoardDto();
		board.setBoard("test");
		board.setTitle("test");
		board.setSecret(false);
		board.setContent("test");
		board.setWriter("pallennellap17@gmail.com");
		
		boardDao.register(board);*/
		
//		boardDao.register("test","test","false","test","pallennellap17@gmail.com");
		/*ReplyDto reply = new ReplyDto();
		reply.setWriter("pallen@daum.net");
		reply.setContent("Write Test2");
		reply.setSecret(false);
		replyDao.write(2, reply);
		*/
		
		/*List<ReplyDto>list = replyDao.replyList(2); 
		for (ReplyDto replyDto : list) {
			System.out.println(replyDto.getNo());
		}*/
		
	}
	/*@Test*/
	/* public void callURL() throws Exception {
        int len;
        InputStream input         =        (new URL("http://localhost:8080/study/")).openStream();
        byte b[] = new byte[64000];
        StringBuffer sb = new StringBuffer();
        while ((len = input.read(b, 0, b.length)) > 0)
                sb.append(new String(b, 0, len));
        input.close();
        System.out.println(sb.toString());
 }*/
}
