package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	// jsp에서 회원 데이터베이스 table에 접근할 수 있도록 생성
	// DAO = Data Access Object, 실질적으로 데이터베이스에서 회원정보를 관리, 처리할 때 사용

	private Connection con; // con ==conn
	// DB 접근 객체

	private PreparedStatement pst; // pst == pstmt
	private ResultSet rs;
	// 정보를 담을 객체

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/DB?characterEncoding=UTF-8&sereverTimezone=UTC";
			// localhost:3306 -> 컴퓨터에 설치된 mysql, port 3306의 DB(내가 저장한이)라는 데이터베이스에 접

			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			// mysql에 접속할 수 있도록 매개체 역할을 해주는 하나의 라이브러리, jdbc 드라이 로드

			con = DriverManager.getConnection(dbURL, dbID, dbPassword);
			// 데이터베이스에 접속되면 con객체에 접속정보가 저장
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {	//로그인 처리하는 함수
		
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pst = con.prepareStatement(SQL);
			pst.setString(1, userID);
			rs = pst.executeQuery(); //실행 결과를 넣고,
			if(rs.next())//결과가 존재하면
			{
				if(rs.getString(1).equals(userPassword)) {
					//결과로 나온 userPassword를 받아서 접속을 시도한 userPassword와 동하다면
					return 1;//	로그인 성공
				}
				else
					return 0;	//로그인 실패
			}
			return -1; //아이디가 없음 userID =? 부분 확인
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -2;	//데이터베이스 오류
	}


}
