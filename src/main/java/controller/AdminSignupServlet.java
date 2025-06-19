package controller;

import com.fasterxml.jackson.core.exc.StreamReadException;
import com.fasterxml.jackson.databind.DatabindException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dto.AdminDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AdminModel;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;

@WebServlet("")
public class AdminSignupServlet extends HttpServlet {

    private AdminModel model;

    @Override
    public void init() throws ServletException {
        model = new AdminModel();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        ObjectMapper mapper = new ObjectMapper();
        BasicDataSource dataSource = (BasicDataSource) getServletContext().getAttribute("dataSource");
        AdminDto adminDto = mapper.readValue(req.getInputStream(), AdminDto.class);
        model.addNewAdmin(adminDto.getName(), adminDto.getEmail(), adminDto.getPassword(), dataSource, resp, req);
        }catch (StreamReadException e){
            e.printStackTrace();
        }catch (DatabindException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
