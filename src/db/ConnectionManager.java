package db;

public class ConnectionManager {
	public static UserConnection user(){
		return UserConnection.getInstance();
	}
	
	public static ConcertConnection tour(){
		return ConcertConnection.getInstance();
	}
}
