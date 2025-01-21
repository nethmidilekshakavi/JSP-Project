package com.example.lk.ijse.DTO;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class usersDto {

    @Id
    private int id;
    private String name;
    private String email;
    private String password;
    private String username;
    private String role;
}


