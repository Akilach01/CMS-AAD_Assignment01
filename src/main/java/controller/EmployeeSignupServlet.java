package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import dto.ComplainDto;
import dto.EmployeeDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ComplainModel;
import model.EmployeeModel;

import java.io.IOException;

@WebServlet("/api/v1/employee")
public class EmployeeSignupServlet extends HttpServlet {

    private EmployeeModel model;
    private ComplainModel complainModel;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try {
           ObjectMapper mapper = new ObjectMapper();
           ComplainDto dto = mapper.readValue(req.getInputStream(), ComplainDto.class);
           complainModel.getComplainsByEmail(dto.getEmail(), resp, req);
       }catch (Exception e){
           e.printStackTrace();
       }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ObjectMapper mapper = new ObjectMapper();
            EmployeeDto dto = mapper.readValue(req.getInputStream(), EmployeeDto.class);
            model.addNewEmployee(dto.getId(), dto.getName(), dto.getEmail(), dto.getContact(), req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void init() throws ServletException {
        model = new EmployeeModel();
        complainModel = new ComplainModel();
    }
}
