package db;


public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
			UserConnection ucon = UserConnection.getInstance();
			System.out.println(ucon.createNewAccount("watanabe","渡邊 順一朗","gomi", "大阪府堺市","09012345678","watanabe@ss.cs.osakafu-u.ac.jp"));
			String[] users = {"a","b","c","d","e","f","g","h","i","j"};
			for(String user: users){
				System.out.println(ucon.createNewAccount(user,user,"gomi", "大阪府堺市","09012345678",user + ".jp"));
			}
			System.out.println(ucon.getName("watanabe", "gomi"));
			System.out.println(UserConnection.getInstance().checkIDwithPass("watanabe","gomi"));

			ConcertConnection ccon = ConcertConnection.getInstance();
			ccon.registConcert("watanabe", "3");
			for(String user: users){
				ccon.registConcert(user, "4");
				ccon.registConcert(user, "6");
				ccon.registConcert(user, "9");
				ccon.registConcert(user, "11");
				ccon.registConcert(user, "15");
			}
			System.out.println(ccon.getUserConcerts("watanabe"));
			System.out.println(ccon.getRegistID("watanabe", "3"));
			System.out.println(ccon.canRegistConcert("4"));

			ccon.deleteConcert("watanabe", "3");
			System.out.println(ccon.getUserConcerts("watanabe"));
	}

}
