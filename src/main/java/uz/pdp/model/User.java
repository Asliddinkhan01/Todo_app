package uz.pdp.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import static uz.asliddin.util.MyUtil.*;

//Asliddin Kenjaev 2/5/2022 5:30 PM
@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
    private int id;
    private String fullName;
    private String email;
    private String password;
}
