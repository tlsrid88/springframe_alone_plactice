package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.swing.text.StyledEditorKit.ForegroundAction;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	
	static {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try (Connection con = 
				DriverManager.getConnection(
						"jdbc:mariadb://localhost:3306/study?user=root&password=root")) {
			log.info(con);
			if (con != null) {
				System.out.println("DB Connvertion Sucess!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.getMessage());
		}
	}
}
