package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import dto.ComplainDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ComplainModel;

import java.io.IOException;

@WebServlet("/api/v1/complains")
public class ComplaintServlet extends HttpServlet {

    private ComplainModel model;

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
        ObjectMapper mapper = new ObjectMapper();
        ComplainDto dto = mapper.readValue(req.getInputStream(), ComplainDto.class);
        model.deleteComplain(dto.getId(), req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     model.getAllComplains(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ObjectMapper mapper = new ObjectMapper();
            ComplainDto dto = mapper.readValue(req.getInputStream(), ComplainDto.class);
            model.addNewComplain(dto.getName(), dto.getEmail(), dto.getMessage(), req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void init() throws ServletException {
        model = new ComplainModel();
    }
}
