package db;

public class ConnectionManager {
	public static UserConnection user(){
		return UserConnection.getInstance();
	}
	
	public static ConcertConnection concert(){
		return ConcertConnection.getInstance();
	}
}
