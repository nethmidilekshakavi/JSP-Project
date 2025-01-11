package com.example.lk.ijse.Bo;

import com.example.lk.ijse.DTO.AdminDto;
import com.example.lk.ijse.Dao.AdminDao;
import com.example.lk.ijse.Dao.DaoFactory;
import com.example.lk.ijse.Entity.Admin;

import java.io.IOException;

public class AdminBoImpl implements AdminBo{

    AdminDao studentDao = (AdminDao) DaoFactory.getDaoFactory().getDAO(DaoFactory.DAOTypes.ADMIN);

    @Override
    public boolean saveAdmin(Admin entity) throws IOException {
        return studentDao.save(new AdminDto(entity.getId(),entity.getName(),entity.getEmail(),entity.getPassword(),entity.getUsername()));
    }

}
