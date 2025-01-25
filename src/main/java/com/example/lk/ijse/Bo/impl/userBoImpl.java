package com.example.lk.ijse.Bo.impl;
import com.example.lk.ijse.Bo.custom.userBo;
import com.example.lk.ijse.Dao.custom.UserDao;
import com.example.lk.ijse.Dao.DaoFactory;
import com.example.lk.ijse.Entity.users;

import java.io.IOException;
import java.sql.SQLException;

public class userBoImpl implements userBo {

    UserDao adminDao = (UserDao) DaoFactory.getDaoFactory().getDAO(DaoFactory.DAOTypes.ADMIN);

    @Override
    public boolean saveAdmin(users entity) throws IOException {
        return adminDao.save(new users(entity.getId(),entity.getUsername(),entity.getPassword(),entity.getEmail(),entity.getName(),entity.getRole(),entity.getCarts()));
    }



    @Override
    public boolean deleteuser(int id) throws IOException {
        return adminDao.delete(id);
    }


    @Override
    public users serachbyIDS(int uid) throws SQLException, ClassNotFoundException {
        return adminDao.searchById(uid);
    }


}
