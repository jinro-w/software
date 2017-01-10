package db;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserConnection extends SQLConnection{
	private static UserConnection connection_ = null;
	private final static String fileName_ = "user.db";
	private final static String tableName_ = "userInfo";
	private UserConnection(){
		super(fileName_);
	}
	public static UserConnection getInstance(){
		if(connection_ == null){
			connection_ = new UserConnection();
		}
		return connection_;
	}

	/**
	 * pass とID が一致する可どうか認証するクラス
	 * @param id
	 * @param pass
	 * @return 認証するかどうか
	 */
	public boolean checkIDwithPass(String id, String pass){
		ResultSet re = execute("select * from "+tableName_+" where id = \'"+ id + "\'");
		try {
			while(re.next()){
				if(re.getString("passwd").equals(pass)){
					return true;
				}else{
					return false;
				}
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 名前を取得.
	 * @param id
	 * @param pass
	 * @return
	 */
	public String getName(String id, String pass){
		String name = null;
		if(checkIDwithPass(id,pass)){
			ResultSet re = execute("select * from "+tableName_+" where id = \'"+ id + "\'");
			try {
				re.next();
				name = re.getString("name");
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
		}
		return name;
	}
	
	/**
	 * ID がすでに存在するかどうかチェックする．
	 * @param id
	 * @return true(ID が存在する） false(ID が存在しない)
	 */
	public boolean isExistID(String id){
		ResultSet re = execute("select * from "+tableName_);
		boolean isExist = false;
			try {
				while (re.next()) {
					if(re.getString("id").equals(id)){
						isExist = true;
						break;
					}
				}
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
			return isExist;
	}
	
	/**
	 * 新規アカウント登録するクラス
	 * @param id
	 * @param name
	 * @param passwd
	 */
	public String createNewAccount(String id,String name,String passwd,String adress,String phone,String email){
		if(!isExistID(id)){
			execute("INSERT INTO userInfo(id,name,passwd,adress,phone,email) " +
					"VALUES(\""+id+"\",\""+name+"\",\""+passwd+"\",\""+adress+"\",\""+phone+"\",\""+email+"\")");
			return "正常に作成されました";
		}else{
			return "すでに登録済みのID です．";
		}
	}
}
