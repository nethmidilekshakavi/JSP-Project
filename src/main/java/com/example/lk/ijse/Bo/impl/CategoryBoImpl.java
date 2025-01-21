package com.example.lk.ijse.Bo.impl;

import com.example.lk.ijse.Bo.custom.CategoryBo;
import com.example.lk.ijse.Dao.DaoFactory;
import com.example.lk.ijse.Dao.custom.CategoryDao;
import com.example.lk.ijse.Entity.categories;

import java.io.IOException;

public class CategoryBoImpl implements CategoryBo {


    CategoryDao categoryDao = (CategoryDao) DaoFactory.getDaoFactory().getDAO(DaoFactory.DAOTypes.CATEGORIES);

    @Override
    public boolean saveCategory(categories entity) throws IOException {
        return categoryDao.save(new categories(entity.getCategory_id(),entity.getCategory_name(),entity.getDesc()));
    }

    @Override
    public boolean updateCategory(categories entity) throws IOException {
        return categoryDao.update(new categories(entity.getCategory_id(),entity.getCategory_name(),entity.getDesc()));
    }

    @Override
    public boolean deleteCategory(int id) throws IOException {
        return categoryDao.delete(id);
    }

}
