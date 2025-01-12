package com.example.lk.ijse.Dao;

import com.example.lk.ijse.CrudDao;
import com.example.lk.ijse.DTO.AdminDto;
import com.example.lk.ijse.Entity.Admin;

import java.io.IOException;

public interface AdminDao extends CrudDao<Admin> {

    boolean save(AdminDto admin) throws IOException;
}
