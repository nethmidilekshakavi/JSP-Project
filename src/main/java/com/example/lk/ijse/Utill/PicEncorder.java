package com.example.lk.ijse.Utill;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class PicEncorder {
    public static String generatePicture(String profilePic){

        return Base64.getEncoder().encodeToString(profilePic.getBytes(StandardCharsets.UTF_8));

    }
}
