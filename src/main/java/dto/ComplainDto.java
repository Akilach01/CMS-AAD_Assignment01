package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComplainDto {
    private int id;
    private String name;
    private String email;
    private String message;
}
