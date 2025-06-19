package model;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

public class AdminModel {
    public void signin(String email, String password, HttpServletRequest req, HttpServletResponse resp, BasicDataSource dataSource) {

        ObjectMapper mapper = new ObjectMapper();
        try {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE email= ? AND password = ?");

        statement.setString(1, email);
        statement.setString(2, password);

        ResultSet resultSet = statement.executeQuery();
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        if (resultSet.next()){
           resp.setStatus(HttpServletResponse.SC_OK);
           mapper.writeValue(out, Map.of(
                   "code", "200",
                   "status", "Login Success",
                   "message","logged in successfully"));
        }else {
           resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
           mapper.writeValue(out, Map.of(
                   "code", "401",
                   "status", "Login failed",
                   "message","logged in failed"));
        }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addNewAdmin(String name, String email, String password, BasicDataSource dataSource, HttpServletResponse resp, HttpServletRequest req) {
        ObjectMapper mapper = new ObjectMapper();

        try {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement("INSERT INTO users(name, email, password) VALUES (?,?,?)");

        statement.setString(1, name);
        statement.setString(2, email);
        statement.setString(3, password);

        int rows = statement.executeUpdate();
        resp.setContentType("application/json");
        mapper.writeValue(resp.getWriter(),Map.of("admin saved succesfully",rows));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
