using System;
using System.Collections.Generic;
using System.Web;
using System.Configuration;
using System.Data.OleDb;
using System.Data;

namespace WebApplication.lib
{
    public class DBLayer
    {
        private OleDbCommand command;
        private OleDbConnection connection;
        private OleDbDataAdapter dataAdapter;
        private DataSet ds;
        public DBLayer()
        {
            string dbpath = HttpContext.Current.Server.MapPath("~/App_Data/Database.mdb");
            connection = new OleDbConnection(string.Format(ConfigurationManager.AppSettings["dbConnectionString"], dbpath));
            command = new OleDbCommand();
            command.Connection = connection;
            dataAdapter = new OleDbDataAdapter(command);
        }

        public void Connect()
        {
            try
            {
                if (connection.State != System.Data.ConnectionState.Open)
                {
                    connection.Open();
                }
            }
            catch (Exception e)
            {
                CloseConnection();
            }
        }

        public void CloseConnection()
        {
            connection.Close();
        }

        public DataSet GetUser(string UserName, string password)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from Users Where UserName = '{0}' and [password] = '{1}'", UserName, password);
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();
            return ds;
        }

        public bool UpdateUserPassword(int UserID, string password)
        {
            bool result = false;
            command.CommandText = string.Format("Update Users Set [password] = '{0}' where ID = {1}", password, UserID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public DataSet GetPageContent(int PageID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from pages Where ID = {0}", PageID);
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }



        public bool SetPageContent(int PageID, string Content,string title, string ArTitle, string ArContent)
        {
            bool result = false;
            if (!string.IsNullOrEmpty(title))
                command.CommandText = string.Format("Update Pages Set Content = '{0}', Title='{1}', ArContent = '{3}', ArTitle='{2}' where ID = {4}", Content, title, ArTitle, ArContent, PageID);
            else
                command.CommandText = string.Format("Update Pages Set Content = '{0}' where ID = {1}", Content, PageID);

            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public DataSet GetPages()
        {
            ds = new DataSet();
            command.CommandText = "select * from Pages";
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }

        /************************************************************************/

        public DataSet GetNewsContent(int NewsID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from News Where ID = {0}", NewsID);
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }

        public DataSet GetNewsImages(int NewsID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from NewsImages Where NewsID = {0}", NewsID);
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }

        public bool SetNewsContent(int NewsID, string content, string title, string brief, DateTime date, string mainpic)
        {
            bool result = false;

            if (!string.IsNullOrEmpty(mainpic))
                command.CommandText = string.Format("Update News Set Content = '{0}', title= '{1}', brief = '{2}', newsdate = '{3}', MainPicURL = '{4}' where ID = {5}", content, title, brief, date, mainpic, NewsID);
            else
                command.CommandText = string.Format("Update News Set Content = '{0}', title= '{1}', brief = '{2}', newsdate = '{3}' where ID = {4}", content, title, brief, date, NewsID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }


        public bool AddNewsContent(string content, string title, string brief, DateTime date, string mainpic)
        {
            bool result = false;
            command.CommandText = string.Format("insert into News (content,title, brief, newsdate, MainPicURL) values ('{0}', '{1}' , '{2}', '{3}', '{4}')", content, title, brief, date, mainpic);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public bool AddNewsImages(string picpath,int NewsID)
        {
            bool result = false;
            command.CommandText = string.Format("insert into NewsImages (picpath,newsid) values ('{0}', {1})", picpath,NewsID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public bool DeleteNews(int NewsID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from News where ID = {0}", NewsID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public bool DeleteNewsImages(int NewsID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from NewsImages where NewsID = {0}", NewsID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public bool DeleteNewsImagesByID(int ID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from NewsImages where ID = {0}", ID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public DataSet GetAllNews()
        {
            ds = new DataSet();
            command.CommandText = "select * from News order by NewsDate desc";
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }

        /*************************/
        public DataSet GetDesignerContent(int DesignerID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from Designers Where ID = {0}", DesignerID);
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }


        public bool SetDesignerContent(int DesignerID, string content, string title, string brief, string name, string mainpic)
        {
            bool result = false;

            if (!string.IsNullOrEmpty(mainpic))
                command.CommandText = string.Format("Update Designers Set Content = '{0}', title= '{1}', brief = '{2}', DesignerName = '{3}', MainPic = '{4}' where ID = {5}", content, title, brief, name, mainpic, DesignerID);
            else
                command.CommandText = string.Format("Update Designers Set Content = '{0}', title= '{1}', brief = '{2}', DesignerName = '{3}' where ID = {4}", content, title, brief, name, DesignerID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }


        public bool AddDesignerContent(string content, string title, string brief, string name, string mainpic)
        {
            bool result = false;
            command.CommandText = string.Format("insert into Designers (content,title, brief, DesignerName, MainPic) values ('{0}', '{1}' , '{2}', '{3}', '{4}')", content, title, brief, name, mainpic);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public bool DeleteDesigner(int DesignerID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from Designers where ID = {0}", DesignerID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public DataSet GetAllDesigners()
        {
            ds = new DataSet();
            command.CommandText = "select * from Designers ";
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }
        /***************************/

        /************************************************************************/

        public DataSet GetProductContent(int ProductID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from products Where ProductID = {0}", ProductID);
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }


        public bool SetProductContent(int ProductID, string name, string mainpic, string thumbs, string description, string ArProductName, string ArDescription)
        {
            bool result = false;
            command.CommandText = "Update products Set productName = '" + name + "', description = '" + description + "', ArproductName = '" + ArProductName + "', Ardescription = '" + ArDescription + "'";
            if (!string.IsNullOrEmpty(mainpic))
                command.CommandText += " , Picpath = '"+ mainpic +"'";

            if (!string.IsNullOrEmpty(thumbs))
                command.CommandText += " , thumbs = '" + thumbs + "'";

            command.CommandText += " where ProductID =" + ProductID.ToString();

            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }


        public bool AddProductContent(string name, string mainpic, int catID, string thumb, string description, string ArName, string ArDesc)
        {
            bool result = false;
            command.CommandText = string.Format("insert into products (productname, PicPath, categoryID, thumbs, description, ArProductName, ArDescription) values ('{0}', '{1}', {2}, '{3}', '{4}' , '{5}', '{6}')", name, mainpic, catID, thumb, description, ArName, ArDesc);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public bool DeleteProduct(int ProductID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from products where ProductID = {0}", ProductID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public DataSet GetAllProductByCatID( int catid)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from products where CategoryId = {0}", catid);
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }

        public DataSet GetAllProducts()
        {
            ds = new DataSet();
            command.CommandText = "select * from products";
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }


        public DataSet GetAllItemsByProductID(int ProductID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from productItems where ProductID = {0}", ProductID);
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }


        public bool SetItemContent(int ItemID,int ProductID, string name, string dim, string code)
        {
            bool result = false;
            command.CommandText = string.Format("Update productItems Set ItemName = '{0}', dimension = '{1}', code='{2}', productid= {3} where itemID = {4}", name, dim, code, ProductID, ItemID);
            
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }


        public bool AddItemContent(string name, string dim, string code, int productid)
        {
            bool result = false;
            command.CommandText = string.Format("insert into productitems (Itemname, code, dimension, productid) values ('{0}', '{1}','{2}', {3} )", name, code, dim, productid);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public bool Deleteitem(int ItemID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from productItems where ItemID = {0}", ItemID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public DataSet GetItemContent(int ItemID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from productitems Where ItemID = {0}", ItemID);
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }

        /*************************/

        public DataSet GetAllCats()
        {
            ds = new DataSet();
            command.CommandText = "select * from Categories ";
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }

        public DataSet GetCategoryContent(int catID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from categories Where ID = {0}", catID);
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }

        public bool SetCategoryContent(int CategoryID, string name, string Arname, string mainpic)
        {
            bool result = false;
            command.CommandText = "Update Categories Set CategoryName = '" + name + "', CategoryArName= '" + Arname + "'";
            if (!string.IsNullOrEmpty(mainpic))
                command.CommandText += " , MainPic = '" + mainpic + "'";

            command.CommandText += " where ID =" + CategoryID.ToString();

            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }


        public bool AddCategoryContent(string name, string Arname, string mainpic)
        {
            bool result = false;
            command.CommandText = string.Format("insert into Categories (CategoryName,CategoryArName, MainPic) values ('{0}', '{1}' , '{2}')", name,Arname,mainpic);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public bool DeleteCategory(int categoryID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from Categories where ID = {0}", categoryID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }


        /*************************/
        public DataSet GetContactContent(int ContactID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from Contact Where ID = {0}", ContactID);
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }


        public bool SetContactContent(int ContactID, string content, string title, string lat, string longit, string mail)
        {
            bool result = false;
            command.CommandText = string.Format("Update Contact Set Content = '{0}', title= '{1}', latitude = '{2}', longitude = '{3}', email = '{4}' where ID = {5}", content, title, lat, longit,mail, ContactID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }


        public bool AddContactContent(string content, string title, string lat, string longit, string mail)
        {
            bool result = false;
            command.CommandText = string.Format("insert into Contact (content,title, latitude, longitude, type, mail) values ('{0}', '{1}' , '{2}', '{3}', {4}, '{5}')", content, title, lat, longit, 3, mail);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public bool DeleteContact(int ContactID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from contact where ID = {0}", ContactID);
            try
            {
                Connect();
                int rows = command.ExecuteNonQuery();
                if (rows > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                CloseConnection();
                return false;
            }
            CloseConnection();
            return result;
        }

        public DataSet GetAllContact()
        {
            ds = new DataSet();
            command.CommandText = "select * from Contact ";
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }


        public DataSet GetAllContactByType(int type)
        {
            ds = new DataSet();
            command.CommandText = "select * from Contact where type = " + type.ToString();
            try
            {
                Connect();
                dataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                CloseConnection();
                return null;
            }
            CloseConnection();


            return ds;
        }
    }
}