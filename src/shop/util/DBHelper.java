package shop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created with IntelliJ IDEA.
 * User: QiuShiLe
 * Date: 2015/4/14
 * Time: 0:56
 * Project: JavaWebIntelliJ
 * Detail:
 */
public class DBHelper {
    private static Connection conn;
    private static final String driver   = "com.mysql.jdbc.Driver";
    private static final String url      = "jdbc:mysql://localhost:3306/imooc?useUnicode=true&characterEncoding=UTF-8";
    private static final String username = "root";
    private static final String password = "123456";

    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getInstance() throws Exception {
        if (null == conn) {
            synchronized (DBHelper.class) {
                if (null == conn) {
                    conn = DriverManager.getConnection(url, username, password);
                }
            }
        }
        return conn;
    }

    private DBHelper() {
    }

    public static void main(String[] args) {
        Connection conn = null;
        try {
            conn = DBHelper.getInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(conn.toString());
    }

}
