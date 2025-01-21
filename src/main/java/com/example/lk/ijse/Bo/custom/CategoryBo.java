package com.example.lk.ijse.Bo.custom;

import com.example.lk.ijse.Bo.SuperBo;
import com.example.lk.ijse.Entity.categories;

import java.io.IOException;

public interface CategoryBo extends SuperBo {
    boolean saveCategory(categories entity) throws IOException;

    boolean updateCategory(categories entity) throws IOException;

    boolean deleteCategory(int id) throws IOException;
}
