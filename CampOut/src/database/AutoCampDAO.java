package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Class to handle database queries.
 * Implements AutoCloseable to use with try with resources.
 * @author Justin Alderson
 *
 */
public class AutoCampDAO implements AutoCloseable{
	
	private Connection con;
	private Context init;
	private DataSource datasource;
	private ResultSet resultSet;
	private PreparedStatement preparedStatement;
	
	
	public AutoCampDAO() throws SQLException, NamingException{
		init = new InitialContext();
		datasource = (DataSource) init.lookup("java:comp/env/jdbc/web_apps");
		con = datasource.getConnection();
	}

	/**
	 * Gets the size of the database.
	 * @return integer
	 * @throws SQLException
	 */
	public int getDBsize() throws SQLException {
		int num = 0;
		resultSet = con.createStatement().executeQuery("select * from auto_camp");
		while(resultSet.next()){
		     
		    num++;
		}
		return num;
	
	}
	/**
	 * Add a reservation to database.
	 * All parameters not null.
	 * @param email
	 * @param phone
	 * @param date
	 * @param lenStay
	 * @param numSpaces
	 * @throws SQLException
	 */
	public void makeReservation(String email, String phone, String date, String lenStay, String numSpaces) throws SQLException{
		
		preparedStatement = con.prepareStatement( "insert into auto_camp(email, phone_number, date_first_night,"
					+ " length_of_stay, num_of_spaces) values "
					+ "(?, ?, ?, ?, ?)");
		preparedStatement.setString(1, email);
		preparedStatement.setInt(2, Integer.parseInt(phone));
		preparedStatement.setString(3, date);
		preparedStatement.setInt(4, Integer.parseInt(lenStay));
		preparedStatement.setInt(5, Integer.parseInt(numSpaces));
		preparedStatement.execute();
		
		
	}
	

	@Override
	public void close() throws Exception {
		if(preparedStatement != null) {
			preparedStatement.close();
		}
		
		if(resultSet != null) {
			resultSet.close();
		}
		
		if(con != null) {
			con.close();
		}
		
	}

}
