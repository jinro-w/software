package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLConnection {
	String database_ = null;
	Connection connection_ = null;
	Statement statement_ = null;
	
	/**
	* コネクションの確立
	* @param dataBaseName_
	*/
	public SQLConnection(String database){
		database_ = database;
		
		try {
			Class.forName("org.sqlite.JDBC");
			connection_ = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/" + database_);
			statement_ = connection_.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	}
	
	/**
	* データをとる
	* @param query SQL のクエリ
	* @return ResultSet
	* @throws SQLException
	*/
	public ResultSet execute(String query){
		ResultSet rs = null;
		
		if(query.toLowerCase().contains("insert") || query.toLowerCase().contains("delete")){
			try {
				statement_.executeUpdate(query);
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
			return null;
		}
		try {
			rs = statement_.executeQuery(query);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		return rs;
	}
}
