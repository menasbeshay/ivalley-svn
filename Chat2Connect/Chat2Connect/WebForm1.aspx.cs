﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         /*   string htmltemplate = "<li class='itemColor'><a data-wysihtml5-command-value='{0}' data-wysihtml5-command='foreColor' data-bind=\"click:setForeColor('{0}')\"  style='color: {0};' href='javascript:;' unselectable='on'><div style='background-color: {0};' class='colorDiv'></div></a></li>";
            string csstemplate = "color: {0};";
            string line;
            string fullhtml = "";
            string fullcss = "";
            System.IO.StreamReader file = new System.IO.StreamReader(Server.MapPath("colors.txt"));
            while ((line = file.ReadLine()) != null)
            {
                fullhtml += string.Format(htmltemplate, line.Trim());
                fullcss += ".wysiwyg-color-" + line.Trim() + "{" + string.Format(csstemplate, line.Trim()) + "}";
            }

            file.Close();

            Response.Write("css : <br />" + fullcss);
            Response.Write("html : <br /><code>" + fullhtml + "</code>");*/

            try
            {

                string original = "mid=12&email=mena.samy@gmail.com";

                // Create a new instance of the TripleDESCryptoServiceProvider 
                // class.  This generates a new key and initialization  
                // vector (IV). 
                using (TripleDESCryptoServiceProvider myTripleDES = new TripleDESCryptoServiceProvider())
                {
                    // Encrypt the string to an array of bytes. 
                    byte[] encrypted = EncryptStringToBytes(original, myTripleDES.Key, myTripleDES.IV);

                    // Decrypt the bytes to a string. 
                    string roundtrip = DecryptStringFromBytes(encrypted, myTripleDES.Key, myTripleDES.IV);

                    string encryptedstring = ByteArrayToString(encrypted);

                    string roundtrip2 = DecryptStringFromBytes(StringToByteArray(encryptedstring), myTripleDES.Key, myTripleDES.IV);

                    //Display the original data and the decrypted data.
                    Response.Write("Original:   "+ original+ "<br />");
                    Response.Write("Encrypted as string:   " + encryptedstring + "<br />");
                    Response.Write("Round Trip: " + roundtrip + "<br />");
                    Response.Write("round trip 2:   " + roundtrip2 + "<br />");
                    Response.Write("key : " + ByteArrayToString(myTripleDES.Key) + "<br />");
                    Response.Write("IV : " + ByteArrayToString(myTripleDES.IV) + "<br />");
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: {0}", ex.Message);
            }
        }

        public static string ByteArrayToString(byte[] ba)
        {
            StringBuilder hex = new StringBuilder(ba.Length * 2);
            foreach (byte b in ba)
                hex.AppendFormat("{0:x2}", b);
            return hex.ToString();
        }

        public static byte[] StringToByteArray(String hex)
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
    }
}