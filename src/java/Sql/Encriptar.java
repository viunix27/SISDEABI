package Sql;

import java.math.BigInteger;
import java.security.MessageDigest;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Victor
 */


public class Encriptar {
    
            public String getMD5(String valor)
{
    try
{
    MessageDigest md = MessageDigest.getInstance("MD5");
    byte[] enBytes = md.digest(valor.getBytes());
    BigInteger numero = new BigInteger(1,enBytes);
    String enString = numero.toString(16);
    while(enString.length() <32)
    {
        enString = "0"+enString;
    }
    return enString;
    }
    catch (Exception e)
    {
    throw new RuntimeException(e);
    }
    }

}
