package db;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;


public class ConcertConnection extends SQLConnection {
	private static ConcertConnection connection_ = null;
	private final static String fileName_ = "concert.db";
	private final static String concertTable_ = "concertInfo";
	private final static String registInfoTable_ = "registInfo";
	private ConcertConnection(){
		super(fileName_);
	}
	public ConcertConnection(String dataBaseName_){
		super(dataBaseName_);
	}

	public static ConcertConnection getInstance(){
		if(connection_ == null){
			connection_ = new ConcertConnection();
	}
		return connection_;
	}

	/**
	* コンサートが予約可能か満席か調べる
	* @param tourID
	* @return true 予約可能， false 満席
	*/
	public boolean canRegistConcert(String concertID){
		ResultSet rs = execute("select * from "+ registInfoTable_ + " where concertID = \"" + concertID + "\"");
		boolean canRegister = false;
		int counter = 0;
		try {
			while (rs.next()) {
				counter ++;
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		rs = execute("select * from "+ concertTable_ + " where id = \"" + concertID + "\"");
		int num = 0;
		try {
			while (rs.next()) {
				num = Integer.valueOf(rs.getString("muxNum"));
			}
		} catch (NumberFormatException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		if(counter < num){
			canRegister = true;
		}else{
			canRegister = false;
		}
		return canRegister;
	}

	/**
	 * ユーザが登録済みのコンサート情報を取得
	 * @param userID ユーザID
	 * @return コンサートを入れたArrayList
	 */
	public ArrayList<String> getUserConcerts(String userID){
		ArrayList<String> result = new ArrayList<String>();
		ResultSet rs = execute("select * from "+ registInfoTable_ + " where userID = \""+ userID +"\"");
		try {
			while(rs.next()){
				result.add(rs.getString("concertID"));
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * ユーザが登録済みのコンサート情報の受注コードを取得
	 * @param userID ユーザID
	 * @param concertID コンサートID
	 * @return 受注コード
	 */
	public String getRegistID(String userID,String concertID){
		ResultSet rs = execute("select * from "+ registInfoTable_ + " where userID = \""+ userID +"\"");
		String result = "";
		try {
			result = rs.getString("registID");
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * ユーザがコンサートに登録する
	 * @param userID ユーザのID
	 * @param concertID コンサートのID
	 * @return 成功または失敗
	 */
	public boolean registConcert(String userID,String concertID){
		boolean canRegist = false;
		if(!getUserConcerts(userID).contains(concertID)){
			String code = UUID.randomUUID().toString();
			execute("INSERT INTO registInfo(registID,userID,concertID) VALUES(\""+code+"\",\""+userID+"\",\""+concertID+"\")");
			canRegist = true;
		}
		return canRegist;
	}

	/**
	 * 登録したコンサートを削除する
	 * @param userID ユーザのID
	 * @param concertID コンサートのID
	 * @return 成功または失敗
	 */
	public boolean deleteTour(String userID,String concertID){
		boolean canDelete = false;
		if(getUserConcerts(userID).contains(concertID)){
			execute("delete from "+registInfoTable_ +" where userID = \""+userID+"\" AND concertID = \""+concertID+"\"");
			canDelete = true;
		}
		return canDelete;
	}
}
