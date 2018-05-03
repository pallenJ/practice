package sy.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("otherService")
public class OtherServiceImpl implements OtherService{
	
	@Autowired
	private HttpServletResponse response;
	
	@Override
	public void showMessage(String message) {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		try(PrintWriter out= response.getWriter();) {
			out.append("<script>");
			out.append("alert('"+message+"');");
			out.append("</script>");
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
