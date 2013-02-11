using System;
using System.Collections.Generic;
using System.Web;
using System.Configuration;
using System.Data.OleDb;
using System.Data;

namespace Obtravel
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



        public bool SetEnglishPageContent(int PageID, string Content,string imagepath)
        {
            bool result = false;
            command.CommandText = string.Format("Update Pages Set Content = '{0}', ImageBanner='{1}' where ID = {2}", Content,imagepath, PageID);
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

        public bool SetEnglishPageTitle(int PageID, string Title)
        {
            bool result = false;
            command.CommandText = string.Format("Update Pages Set Title = '{0}' where ID = {1}", Title, PageID);
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

        public bool SetArabicPageContent(int PageID, string Content, string imagepath)
        {
            bool result = false;
            command.CommandText = string.Format("Update Pages Set arContent = '{0}', arImageBanner='{1}' where ID = {2}", Content, imagepath, PageID);
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

        public bool SetArabicPageTitle(int PageID, string Title)
        {
            bool result = false;
            command.CommandText = string.Format("Update Pages Set arTitle = '{0}' where ID = {1}", Title, PageID);
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

        public DataSet GetBlockContent(int BlockID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from HomeBlocks Where ID = {0}", BlockID);
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


        public DataSet GetBlocks()
        {
            ds = new DataSet();
            command.CommandText = "select * from HomeBlocks";
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



        public bool SetEnglishBlockContent(int BlockID, string brief ,string title, string imagepath)
        {
            bool result = false;
            command.CommandText = string.Format("Update HomeBlocks Set brief = '{0}', title = '{1}',imagepath = '{2}'  where ID = {3}", brief, title, imagepath,BlockID);
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

        public bool SetArabicBlockContent(int BlockID, string brief, string title, string imagepath)
        {
            bool result = false;
            command.CommandText = string.Format("Update HomeBlocks Set arbrief = '{0}', artitle = '{1}',arimagepath = '{2}'  where ID = {3}", brief, title, imagepath, BlockID);
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

        public DataSet GetServicesContent(int ServiceID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from Services Where ID = {0}", ServiceID);
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



        public bool SetEnglishServiceContent(int ServiceID, string brief, string content, string title, string imagepath, int order)
        {
            bool result = false;
            command.CommandText = string.Format("Update Services Set brief = '{0}', content = '{1}' ,title = '{2}',imagepath = '{3}', [order] = {4}  where ID = {5}", brief, content,title, imagepath,order, ServiceID);
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

        public bool DeleteService(int ServiceID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from Services where ID = {0}", ServiceID);
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

        public bool AddEnglishServiceContent(string brief, string content, string title, string imagepath, int order)
        {
            bool result = false;
            command.CommandText = string.Format("insert into Services (brief,content,title,imagepath,[order]) values ('{0}', '{1}', '{2}',  '{3}', {4})", brief,content ,title, imagepath, order);
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

        public bool SetArabicServiceContent(int ServiceID, string brief,string content, string title, string imagepath, int order)
        { 
            bool result = false;
            command.CommandText = string.Format("Update Services Set arbrief = '{0}',arcontent='{1}', artitle = '{2}',arimagepath = '{3}', arorder = {4}  where ID = {5}", brief,content, title, imagepath, order, ServiceID);
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

        public bool AddArabicServiceContent(string brief, string content,string title, string imagepath, int order)
        {
            bool result = false;
            command.CommandText = string.Format("insert into Services (arbrief,arcontent,artitle,arimagepath,[arorder]) values ('{0}', '{1}', '{2}',  '{3}',{4})", brief,content, title, imagepath, order);
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


        public DataSet GetEnglishServices()
        {
            ds = new DataSet();
            command.CommandText = "select * from Services order by [order]";
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

        public DataSet GetArabicServices()
        {
            ds = new DataSet();
            command.CommandText = "select * from Services order by arorder";
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

        public bool AddContactForm(string tele, string mobile, string email, string subject, string ContactName, string StreetAddress, string City, string PostalCode, string Country, string Title, int section)
        {
            bool result = false;
            command.CommandText = string.Format("insert into contactform (Telephone,mobile,email,subject,ContactName,StreetAddress,City,PostalCode,Country,Title,Section) values ('{0}', '{1}', '{2}',  '{3}','{4}', '{5}', '{6}',  '{7}','{8}', '{9}',{10})", tele, mobile, email, subject,  ContactName,  StreetAddress,  City,  PostalCode,  Country,  Title,  section);
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



        public DataSet GetTourismlistContent(int TID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from Tourismlists Where ID = {0}", TID);
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



        public bool SetEnglishTourismContent(int ServiceID, string brief, string content, string title, string imagepath, int order, int PackageID, bool ViewInWeb)
        {
            bool result = false;
            command.CommandText = string.Format("Update Tourismlists Set brief = '{0}', content = '{1}' ,title = '{2}',imagepath = '{3}', [order] = {4}, ParentPackageID = {5}, ViewInWeb = {6}  where ID = {7}", brief, content, title, imagepath, order,PackageID, (ViewInWeb == true) ? "true" : "false",ServiceID);
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

        public bool DeleteTourismList(int TID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from Tourismlists where ID = {0}", TID);
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

        public bool AddEnglishTourismlistContent(string brief, string content, string title, string imagepath, int order, int PackageID, bool ViewInWeb)
        {
            bool result = false;
            command.CommandText = string.Format("insert into Tourismlists (brief,content,title,imagepath,[order], ViewInWeb,ParentPackageID) values ('{0}', '{1}', '{2}',  '{3}', {4}, {5}, {6})", brief, content, title, imagepath, order, (ViewInWeb == true) ? "true" : "false", PackageID);
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

        public bool SetArabicTourismlistContent(int ServiceID, string brief, string content, string title, string imagepath, int order, int PackageID, bool ViewInWeb)
        {
            bool result = false;
            command.CommandText = string.Format("Update Tourismlists Set arbrief = '{0}',arcontent='{1}', artitle = '{2}',arimagepath = '{3}', arorder = {4}, ParentPackageID = {5}, ArViewInWeb = {6}  where ID = {7}", brief, content, title, imagepath, order, PackageID, (ViewInWeb == true) ? "true" : "false", ServiceID);
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

        public bool AddArabicTourismlistContent(string brief, string content, string title, string imagepath, int order, int PackageID, bool ViewInWeb)
        {
            bool result = false;
            command.CommandText = string.Format("insert into Tourismlists (arbrief,arcontent,artitle,arimagepath,[arorder], ArViewInWeb,ParentPackageID) values ('{0}', '{1}', '{2}',  '{3}',{4}, {5}, {6})", brief, content, title, imagepath, order, (ViewInWeb == true) ? "true" : "false", PackageID);
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


        public DataSet GetEnglishTourismlists(int packageID, bool IsAdmin)
        {
            ds = new DataSet();
            if(IsAdmin)
                command.CommandText = string.Format("select * from Tourismlists where ParentPackageID = {0} order by [order] ", packageID);
            else
                command.CommandText = string.Format("select * from Tourismlists where ParentPackageID = {0} and ViewInWeb = true order by [order] ", packageID);
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

        public DataSet GetArabicTourismlists(int PackageID, bool IsAdmin)
        {
            ds = new DataSet();
            if (IsAdmin)
                command.CommandText = string.Format("select * from Tourismlists where ParentPackageId = {0} order by arorder",PackageID);
            else
                command.CommandText = string.Format("select * from Tourismlists where ParentPackageId = {0} and ArViewInWeb = true order by arorder", PackageID);
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

        /*************************************************************************/

        public DataSet GetPackageContent(int PID)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from Packages Where ID = {0}", PID);
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



        public bool SetEnglishPackageContent(int PID, string brief, string content, string PackageName, string imagepath, int order)
        {
            bool result = false;
            command.CommandText = string.Format("Update Packages Set brief = '{0}', content = '{1}' ,PackageName = '{2}',imagepath = '{3}', [order] = {4} where ID = {5}", brief, content, PackageName, imagepath, order, PID);
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

        public bool DeletePackage(int PID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from Packages where ID = {0}", PID);
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

        public bool AddEnglishPackageContent(string brief, string content, string PackageName, string imagepath, int order)
        {
            bool result = false;
            command.CommandText = string.Format("insert into Packages (brief,content,PackageName,imagepath,[order]) values ('{0}', '{1}', '{2}',  '{3}', {4})", brief, content, PackageName, imagepath, order);
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

        public bool SetArabicPackageContent(int PID, string brief, string content, string PackageName, string imagepath, int order)
        {
            bool result = false;
            command.CommandText = string.Format("Update Packages Set arbrief = '{0}',arcontent='{1}', arPackageName = '{2}',arimagepath = '{3}', arorder = {4}  where ID = {5}", brief, content, PackageName, imagepath, order, PID);
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

        public bool AddArabicPackageContent(string brief, string content, string PackageName, string imagepath, int order)
        {
            bool result = false;
            command.CommandText = string.Format("insert into packages (arbrief,arcontent,arPackageName,arimagepath,[arorder]) values ('{0}', '{1}', '{2}',  '{3}',{4})", brief, content, PackageName, imagepath, order);
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


        public DataSet GetEnglishPackages()
        {
            ds = new DataSet();
            command.CommandText = "select * from packages order by [order] ";
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

        public DataSet GetArabicPackages()
        {
            ds = new DataSet();
            command.CommandText = "select * from packages  order by arorder";
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

        
        public bool SetArabicNewsContent(int NewsID, string Content, int arorder)
        {
            bool result = false;
            command.CommandText = string.Format("Update News Set arContent = '{0}', arorder = {1} where ID = {2}", Content,arorder, NewsID);
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

        public bool SetEnglishNewsContent(int NewsID, string Content, int order)
        {
            bool result = false;
            command.CommandText = string.Format("Update News Set Content = '{0}', [order]= {1} where ID = {2}", Content,order, NewsID);
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

        public bool AddArabicNewsContent(string content, int order)
        {
            bool result = false;
            command.CommandText = string.Format("insert into News (arcontent,[arorder]) values ('{0}', '{1}')", content, order);
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

        public bool AddEnglishNewsContent(string content, int order)
        {
            bool result = false;
            command.CommandText = string.Format("insert into News (content,[order]) values ('{0}', '{1}')", content, order);
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

        public DataSet GetAllNews()
        {
            ds = new DataSet();
            command.CommandText = "select * from News";
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

        public DataSet GetAllContactForm()
        {
            ds = new DataSet();
            command.CommandText = "select * from ContactForm ORDER by Submitdate desc";
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

        public DataSet GetContactForm(int id)
        {
            ds = new DataSet();
            command.CommandText = string.Format("select * from ContactForm where id = {0}",id);
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




        public bool AddBookingEmails(string email, string Position)
        {
            bool result = false;
            command.CommandText = string.Format("insert into BookingMails (email,Position) values ('{0}', '{1}')", email, Position);
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

        public bool DeleteBookingMails(int MailID)
        {
            bool result = false;
            command.CommandText = string.Format("Delete from BookingMails where ID = {0}", MailID);
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

        public DataSet GetAllMails()
        {
            ds = new DataSet();
            command.CommandText = "select * from BookingMails";
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

        public bool SetBookingMails(int MailID, string email, string Position)
        {
            bool result = false;
            command.CommandText = string.Format("Update BookingMails Set Email = '{0}', Position= '{1}' where ID = {2}", email, Position, MailID);
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


    }
}