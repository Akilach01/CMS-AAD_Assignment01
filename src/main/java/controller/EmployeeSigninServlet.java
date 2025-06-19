package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import dto.EmployeeDto;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.EmployeeModel;

import java.io.IOException;

@WebServlet("/api/v1/emp/signin")
public class EmployeeSigninServlet extends HttpServlet {

    private EmployeeModel model;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            ObjectMapper mapper = new ObjectMapper();
            EmployeeDto dto = mapper.readValue(req.getInputStream(), EmployeeDto.class);
            model.signin(dto.getEmail(), req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void init() throws ServletException {
        model = new EmployeeModel();
    }
}
