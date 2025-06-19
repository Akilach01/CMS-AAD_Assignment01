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

public class EmployeeModel {
    public void signin(String email, HttpServletRequest req, HttpServletResponse resp) {
        BasicDataSource dataSource = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
        ObjectMapper mapper = new ObjectMapper();
try{
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM employee WHERE email = ?");

        statement.setString(1, email);

    ResultSet resultSet = statement.executeQuery();
    resp.setContentType("application/json");
    PrintWriter out = resp.getWriter();

    if (resultSet.next()){
        resp.setStatus(HttpServletResponse.SC_OK);
        mapper.writeValue(out, Map.of(
                "code", "200",
                "status", " Success",
                "message", " logged in successfully"));
    } else {
        resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        mapper.writeValue(out, Map.of(
                "code", "401",
                "status", " Failed",
                "message", "login failed"));
    }

} catch (Exception e) {
    e.printStackTrace();
}
    }

}
