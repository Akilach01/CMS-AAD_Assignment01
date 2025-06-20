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

@WebServlet("/api/v1/getComplains")
public class GetComplainsServlet extends HttpServlet {

    private ComplainModel model;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        ComplainDto dto = mapper.readValue(req.getInputStream(), ComplainDto.class);
        model.getComplainsByEmail(dto.getEmail(), resp, req);
    }

    @Override
    public void init() throws ServletException {
        model = new ComplainModel();
    }
}
