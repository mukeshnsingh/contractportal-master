package com.sspl.utility;

import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import sun.misc.*;

public class AESencrp 
{
    
        private static final String ALGO = "AES";
        private static final byte[] keyValue = 
        new byte[] { 'x', 'h', 'e', 'B', 'e', 's', 't','S', 'e', 'c', 'r','e', 't', 'K', 'e', 'y' };

        public static String encrypt(String Data) throws Exception 

        {
        	Key key = generateKey();
	        Cipher c = Cipher.getInstance(ALGO);
	        c.init(Cipher.ENCRYPT_MODE, key);
	        String encryptedValue ="";
	        if(Data!=null){
	        	byte[] encVal = c.doFinal(Data.getBytes());
	        	encryptedValue =new BASE64Encoder().encode(encVal);
	        }
	        return encryptedValue;
	    }

        public static String decrypt(String encryptedData) throws Exception 
        {
	        Key key = generateKey();
	        Cipher c = Cipher.getInstance(ALGO);
	        c.init(Cipher.DECRYPT_MODE, key);
	        byte[] decordedValue = new BASE64Decoder().decodeBuffer(encryptedData);
	        byte[] decValue = c.doFinal(decordedValue);
	        String decryptedValue = new String(decValue);
	        return decryptedValue;
        }
        
        private static Key generateKey() throws Exception 
	    {
	        Key key = new SecretKeySpec(keyValue, ALGO);
	
	        return key;
	    }

}