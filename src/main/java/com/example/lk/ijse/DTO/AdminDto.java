package com.example.lk.ijse.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AdminDto {
    private int id;
    private String name;
    private String email;
    private String password;
    private String username;
}


