package com.example.lk.ijse.Dao.custom;

import com.example.lk.ijse.CrudDao;
import com.example.lk.ijse.Entity.categories;

import java.io.IOException;

public interface CategoryDao extends CrudDao<categories> {


    boolean save(categories categories) throws IOException;

    boolean update(categories categories) throws IOException;


    boolean delete(int entityId) throws IOException;
}
