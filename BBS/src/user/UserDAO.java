package user;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
 
public class UserDAO {
    
    private Connection conn;            // DB�� �����ϴ� ��ü
    private PreparedStatement pstmt;    // 
    private ResultSet rs;                // DB data�� ���� �� �ִ� ��ü  (Ctrl + shift + 'o') -> auto import
    
    public UserDAO(){ 
        try {
            String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC"; //localhost�� ������ �� �ֵ��� > daisy20217�� ���� 
            String dbID = "root"; //�� ID
            String dbPassword = "daisy9656"; //�� ��й�ȣ
            Class.forName("com.mysql.cj.jdbc.Driver"); //mysql�� ������ �� �ֵ��� �ް�ü ������ �ϴ� ���̺귯��
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    public int login(String userID, String userPassword) { //������ �α����� �� �� �ֵ��� ������ִ� �Լ�
        String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID); //�ް������� ����ǥ �ȿ� �־���
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(userPassword))
                    return 1;    // �α��� ����
                else
                    return 0; // ��й�ȣ ����ġ
            }
            return -1; // ID�� ����
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // DB ����
        
   }
    
    
    public int join(User user) {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL); //SQL���� �Ѿ�� ��
            pstmt.setString(1, user.getUserID()); // �Ӽ� �� �־��ֱ�
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            return pstmt.executeUpdate(); //������ ���
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1; // �����ͺ��̽� ����
    }
}

