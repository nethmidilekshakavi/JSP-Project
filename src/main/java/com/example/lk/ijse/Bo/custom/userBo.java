package com.example.lk.ijse.Bo.custom;

import com.example.lk.ijse.Bo.SuperBo;
import com.example.lk.ijse.Entity.users;

import java.io.IOException;
import java.sql.SQLException;

public interface userBo extends SuperBo {
    boolean saveAdmin(users entity) throws IOException;

    boolean deleteuser(int id) throws IOException;

    users serachbyIDS(int uid) throws SQLException, ClassNotFoundException;
}
