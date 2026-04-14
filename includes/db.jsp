<%@ page import="java.sql.*" %>
<%!
    private static final String DB_URL  = "jdbc:mysql://be5mglcduwoqbhcmimih-mysql.services.clever-cloud.com:3306/be5mglcduwoqbhcmimih?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String DB_USER = "uhl6ogqxk3asg0na";
    private static final String DB_PASS = "eG6Kiplxe2MCFrw2mWay";

    Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }
%>
