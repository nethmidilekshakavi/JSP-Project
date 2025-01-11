package com.example.lk.ijse.Bo;

import com.example.lk.ijse.Entity.Admin;

import java.io.IOException;

public interface AdminBo extends SuperBo{
    boolean saveAdmin(Admin entity) throws IOException;
}
