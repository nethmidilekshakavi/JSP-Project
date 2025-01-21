package com.example.lk.ijse.Bo.impl;

import com.example.lk.ijse.Bo.custom.ProductBo;
import com.example.lk.ijse.Dao.DaoFactory;
import com.example.lk.ijse.Dao.custom.ProductDao;
import com.example.lk.ijse.Entity.products;

import java.io.IOException;

public class ProductBoImpl implements ProductBo {

    ProductDao productDao = (ProductDao) DaoFactory.getDaoFactory().getDAO(DaoFactory.DAOTypes.PRODUCTS);

    @Override
    public boolean saveProducts(products entity) throws IOException {
        return productDao.save(new products(entity.getProductid(),entity.getProductname(),entity.getDescription(),entity.getPrice(),entity.getStock_qty(),entity.getCategory(),entity.getImg()));
    }

}
