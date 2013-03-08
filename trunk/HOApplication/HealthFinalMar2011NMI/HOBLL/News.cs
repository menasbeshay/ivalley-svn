using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MHO.DAL;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;


namespace MHO.BLL
{
    public class News : _News
    {
        public News()
        {

        }

        public bool AddNew(string _title, string _description,string _filePath,bool _showLive,
                           int? _govID,int? _civilID,int? _hoID,Guid _userID,string _cType,byte[] _file)
        {
            try
            {
                SqlDataReader searchResult = null;
                ListDictionary parm = new ListDictionary();

                parm.Add("@title", _title);
                parm.Add("@description", _description);
                parm.Add("@filePath", _filePath);
                parm.Add("@showLive", _showLive);

                if (_govID != null)
                    parm.Add("@govid", _govID);
                if (_civilID != null)
                    parm.Add("@civilid", _civilID);
                if (_hoID != null)
                    parm.Add("@healthofficeid", _hoID);
                if (_file != null)
                {
                    parm.Add("@contentType", _cType);
                    parm.Add("@fileData", _file);
                }

                parm.Add("@createdbyuserid", _userID);

                searchResult = LoadFromSqlReader("GUI_AddNews", parm) as SqlDataReader;
                return true;
            }
            catch
            {
                return false;   
            }
        }

        public bool Update(int _newsID, string _title, string _description, string _filePath, bool _showLive,
                          int? _govID, int? _civilID, int? _hoID, Guid _userID, string _cType, byte[] _file)
        {
            try
            {
                SqlDataReader searchResult = null;
                ListDictionary parm = new ListDictionary();

                parm.Add("@newsid", _newsID);
                parm.Add("@title", _title);
                parm.Add("@description", _description);
                parm.Add("@filePath", _filePath);
                parm.Add("@showLive", _showLive);

                if (_govID != null)
                    parm.Add("@govid", _govID);
                if (_civilID != null)
                    parm.Add("@civilid", _civilID);
                if (_hoID != null)
                    parm.Add("@healthofficeid", _hoID);
                if (_file != null)
                {
                    parm.Add("@contentType", _cType);
                    parm.Add("@fileData", _file);
                }

                parm.Add("@createdbyuserid", _userID);

                searchResult = LoadFromSqlReader("GUI_UpdateNews", parm) as SqlDataReader;
                return true;
            }
            catch
            {
                return false;
            }
        }

        public DataTable GetAllNews(int? _newsID,bool? _showLive,int? _govID, int? _civilID, int? _hoID)
        {
            try
            {
                SqlDataReader searchResult = null;
                ListDictionary parm = new ListDictionary();
                if (_newsID != null)
                    parm.Add("@newsID", _newsID.Value);
                if (_showLive != null)
                    parm.Add("@showLive", _showLive.Value);
                if (_govID != null)
                    parm.Add("@govid", _govID.Value);
                if (_civilID != null)
                    parm.Add("@civilid", _civilID.Value);
                if (_hoID != null)
                    parm.Add("@healthofficeid", _hoID.Value);

                searchResult = LoadFromSqlReader("GUI_GetAllNews", parm) as SqlDataReader;
                DataTable ResultTable = new DataTable();
                newAdapter da = new newAdapter();
                if (searchResult != null && searchResult.HasRows)
                {
                    da.FillFromReader(ResultTable, searchResult);
                }
                return ResultTable;
            }
            catch
            {
                return new DataTable();
            }
        }

        public bool Delete(int _newsID)
        {
            try
            {
                SqlDataReader searchResult = null;
                ListDictionary parm = new ListDictionary();

                parm.Add("@newsid", _newsID);

                searchResult = LoadFromSqlReader("GUI_DeleteNews", parm) as SqlDataReader;
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}
