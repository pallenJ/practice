package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mysql.jdbc.Driver;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })

@Log4j
public class JDBCTest {
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	@Test
	public void testConnection() {
		try (Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/exe00?useSSL=false&amp;serverTimezone=UTC","pjm","pjmpjm")){
			log.info(con);
			System.out.println("s");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("f");
			fail(e.getMessage());
		}
	}
	
}
