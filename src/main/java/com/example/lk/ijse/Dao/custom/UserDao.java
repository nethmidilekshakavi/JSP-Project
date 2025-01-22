package com.example.lk.ijse.Dao.custom;

import com.example.lk.ijse.CrudDao;
import com.example.lk.ijse.Entity.users;

import java.io.IOException;

public interface UserDao extends CrudDao<users> {


    boolean save(users admin) throws IOException;

    boolean delete(int entityId) throws IOException;
}
