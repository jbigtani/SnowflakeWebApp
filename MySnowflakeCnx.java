import java.util.Properties;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

public class MySnowflakeCnx
{
    public MySnowflakeCnx() throws Exception
    {
        Properties properties = new Properties();
        properties.put("user","");
        properties.put("password","");
        //properties.put("account","ta47544.europe-west4.gcp");
        properties.put("db","DEMO_DB");
        properties.put("schema","PUBLIC");
        
        String url = "jdbc:snowflake://ta47544.europe-west4.gcp.snowflakecomputing.com";
        
        Connection cnx = DriverManager.getConnection(url,properties);
        Statement mySQL = cnx.createStatement();
        ResultSet myResults = mySQL.executeQuery("SELECT COLOR_NAME FROM COLORS LIMIT 7");
        
        while(myResults.next())
        {
            System.out.println(myResults.getString(1));
        }
    }
    
}
