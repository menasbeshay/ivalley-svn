using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Helper
{
    public class General
    {
        #region encryptio_and_decription

        public static string EncryptString(string needToEncrypt)
        {
            string encryptedstring;
            try
            {
               
                // Create a new instance of the TripleDESCryptoServiceProvider 
                // class.  This generates a new key and initialization  
                // vector (IV). 
                using (TripleDESCryptoServiceProvider myTripleDES = new TripleDESCryptoServiceProvider())
                {
                    myTripleDES.Key = StringToByteArray(HttpContext.GetGlobalResourceObject("Global", "Key").ToString());
                    myTripleDES.IV = StringToByteArray(HttpContext.GetGlobalResourceObject("Global", "IV").ToString());
                    // Encrypt the string to an array of bytes. 
                    byte[] encrypted = EncryptStringToBytes(needToEncrypt, myTripleDES.Key, myTripleDES.IV);
                    encryptedstring = ByteArrayToString(encrypted);
                    
                    // Decrypt the bytes to a string. 
                    
                    string roundtrip2 = DecryptStringFromBytes(StringToByteArray(encryptedstring), myTripleDES.Key, myTripleDES.IV);

                }
                return encryptedstring;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static string DecryptString(string needToDecrypt)
        {
            string decryptedstring;
            try
            {

                // Create a new instance of the TripleDESCryptoServiceProvider 
                // class.  This generates a new key and initialization  
                // vector (IV). 
                using (TripleDESCryptoServiceProvider myTripleDES = new TripleDESCryptoServiceProvider())
                {
                    myTripleDES.Key = StringToByteArray(HttpContext.GetGlobalResourceObject("Global", "Key").ToString());
                    myTripleDES.IV = StringToByteArray(HttpContext.GetGlobalResourceObject("Global", "IV").ToString());
                    // Decrypt the bytes to a string. 
                    decryptedstring = DecryptStringFromBytes(StringToByteArray(needToDecrypt), myTripleDES.Key, myTripleDES.IV);

                }
                return decryptedstring;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        static string ByteArrayToString(byte[] ba)
        {
            StringBuilder hex = new StringBuilder(ba.Length * 2);
            foreach (byte b in ba)
                hex.AppendFormat("{0:x2}", b);
            return hex.ToString();
        }

        static byte[] StringToByteArray(String hex)
        {
            int NumberChars = hex.Length;
            byte[] bytes = new byte[NumberChars / 2];
            for (int i = 0; i < NumberChars; i += 2)
                bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
            return bytes;
        }

        static byte[] EncryptStringToBytes(string plainText, byte[] Key, byte[] IV)
        {
            // Check arguments. 
            if (plainText == null || plainText.Length <= 0)
                throw new ArgumentNullException("plainText");
            if (Key == null || Key.Length <= 0)
                throw new ArgumentNullException("Key");
            if (IV == null || IV.Length <= 0)
                throw new ArgumentNullException("Key");
            byte[] encrypted;
            // Create an TripleDESCryptoServiceProvider object 
            // with the specified key and IV. 
            using (TripleDESCryptoServiceProvider tdsAlg = new TripleDESCryptoServiceProvider())
            {
                tdsAlg.Key = Key;
                tdsAlg.IV = IV;

                // Create a decrytor to perform the stream transform.
                ICryptoTransform encryptor = tdsAlg.CreateEncryptor(tdsAlg.Key, tdsAlg.IV);

                // Create the streams used for encryption. 
                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {

                            //Write all data to the stream.
                            swEncrypt.Write(plainText);
                        }
                        encrypted = msEncrypt.ToArray();
                    }
                }
            }


            // Return the encrypted bytes from the memory stream. 
            return encrypted;

        }

        static string DecryptStringFromBytes(byte[] cipherText, byte[] Key, byte[] IV)
        {
            // Check arguments. 
            if (cipherText == null || cipherText.Length <= 0)
                throw new ArgumentNullException("cipherText");
            if (Key == null || Key.Length <= 0)
                throw new ArgumentNullException("Key");
            if (IV == null || IV.Length <= 0)
                throw new ArgumentNullException("Key");

            // Declare the string used to hold 
            // the decrypted text. 
            string plaintext = null;

            // Create an TripleDESCryptoServiceProvider object 
            // with the specified key and IV. 
            using (TripleDESCryptoServiceProvider tdsAlg = new TripleDESCryptoServiceProvider())
            {
                tdsAlg.Key = Key;
                tdsAlg.IV = IV;

                // Create a decrytor to perform the stream transform.
                ICryptoTransform decryptor = tdsAlg.CreateDecryptor(tdsAlg.Key, tdsAlg.IV);

                // Create the streams used for decryption. 
                using (MemoryStream msDecrypt = new MemoryStream(cipherText))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {

                            // Read the decrypted bytes from the decrypting stream 
                            // and place them in a string.
                            plaintext = srDecrypt.ReadToEnd();
                        }
                    }
                }

            }

            return plaintext;

        }
        #endregion
    }
}
