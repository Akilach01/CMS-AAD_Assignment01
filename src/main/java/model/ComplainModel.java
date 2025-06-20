package model;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ComplainModel {

    public void getComplainsByEmail(String email, HttpServletResponse resp, HttpServletRequest req) {
        ObjectMapper mapper = new ObjectMapper();
        BasicDataSource dataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement stmt = connection.prepareStatement("SELECT FROM complains WHERE email = ?");
            stmt.setString(1, email);
            ResultSet rst = stmt.executeQuery();

            List<Map<String, Object>> list = new ArrayList<>();
            while (rst.next()) {
                Map<String, Object> map = new java.util.HashMap<>();
                map.put("id", rst.getInt("id"));
                map.put("message", rst.getString("message"));
                list.add(map);
            }
            resp.setContentType("application/json");
            mapper.writeValue(resp.getWriter(), list);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void deleteComplain(int id, HttpServletRequest req, HttpServletResponse resp) {

        ObjectMapper mapper = new ObjectMapper();
        BasicDataSource dataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");

        try (Connection connection = dataSource.getConnection()) {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM complains Where id = ? ");
            statement.setInt(1, id);
            int rows = statement.executeUpdate();

            resp.setContentType("application/json");
            mapper.writeValue(resp.getWriter(), Map.of("deleted", rows));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void getAllComplains(HttpServletRequest req, HttpServletResponse resp) {

        BasicDataSource dataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
        try {
            Connection connection = dataSource.getConnection();
            ResultSet rst = connection.prepareStatement("SELECT * FROM complains ").executeQuery();
            List<Map<String, Object>> list = new ArrayList<>();
            while (rst.next()) {
                Map<String, Object> map = new java.util.HashMap<>();
                map.put("id", rst.getInt("id"));
                map.put("name", rst.getString("name"));
                map.put("email", rst.getString("email"));
                map.put("message", rst.getString("message"));
                list.add(map);
            }
            ObjectMapper mapper = new ObjectMapper();
            resp.setContentType("application/json");
            mapper.writeValue(resp.getWriter(), list);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addNewComplain(String name, String email, String message, HttpServletRequest req, HttpServletResponse resp) {

        ObjectMapper mapper = new ObjectMapper();
        BasicDataSource dataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement statement = connection.prepareStatement("INSERT INTO complains(name, email, message)VALUES (?,?,?)");

            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, message);
            int rows = statement.executeUpdate();
            resp.setContentType("application/json");
            mapper.writeValue(resp.getWriter(), Map.of("complaint saved successfully ", rows));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
