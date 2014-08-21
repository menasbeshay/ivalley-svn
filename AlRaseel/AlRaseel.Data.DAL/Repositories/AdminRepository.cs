using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Data.Extensions;
using Data.DataModels;


namespace Data.Repositories
{
    public class AdminRepository
    {
        #region Variables
        DBDataContext db;
        public Admin _Obj { get; set; }
        #endregion
        #region Methods
        public AdminRepository()
        {
            db = new DBDataContext();
            _Obj = new Admin();
        }
        public Guid Add()
        {
            _Obj.Id = Guid.NewGuid(); //get next or new id
            _Obj.Active = true;
            _Obj.CreatedOn = DateTime.Now;

            db.Admins.Add(_Obj);
            db.SaveChanges();
            return _Obj.Id;
        }
        public Boolean Edit(Admin AdminPram)
        {
            try
            {
                _Obj = db.Admins.FirstOrDefault(usr => usr.Id == AdminPram.Id);
                if (_Obj != null)
                {
                    _Obj = AdminPram;
                    _Obj.ModifiedOn = DateTime.Now;
                    _Obj.ModifiedBy = AdminPram.ModifiedBy;
                    db.SaveChanges();
                    return true;
                }
                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public Boolean Delete(Guid ID, Guid ModifiedBy)
        {
            try
            {
                _Obj = db.Admins.FirstOrDefault(use => use.Id == ID);
                if (_Obj != null)
                {
                    _Obj.ModifiedOn = DateTime.Now;
                    _Obj.ModifiedBy = ModifiedBy;
                    _Obj.Active = false;
                    db.SaveChanges();
                    return true;
                }
                return false;

            }
            catch (Exception Ex)
            {
                return false;
            }
        }
        public Boolean Restore(Guid ID, Guid ModifiedBy)
        {
            try
            {
                _Obj = db.Admins.FirstOrDefault(use => use.Id == ID);
                if (_Obj != null)
                {
                    _Obj.ModifiedOn = DateTime.Now;
                    _Obj.ModifiedBy = ModifiedBy;
                    _Obj.Active = false;
                    db.SaveChanges();
                    return true;
                }
                return false;

            }
            catch (Exception Ex)
            {
                return false;
            }
        }
        public DataTable LoadByActiveState(Admin AdminPram, String SortField, String SortType)
        {
            try
            {
                if (AdminPram.Id != null)
                {
                    var Query = (from usr in db.Admins
                                 where usr.Active == AdminPram.Active && usr.Id == AdminPram.Id
                                 select usr);
                    return Query.ToDataTable(SortField, SortType);

                }
                else if (AdminPram.Id == null)
                {
                    return null;
                }
                return null;

            }
            catch (Exception Ex)
            {
                return null;
            }

        }
        public DataTable LoadByActiveState(Boolean ActiveState = true, String SortField = "CreatedOn", String SortType = "ASC")
        {
            try
            {
                
                    var Query = (from usr in db.Admins
                                 where usr.Active == ActiveState
                                 select usr);
                    return Query.ToDataTable(SortField, SortType);

            }
            catch (Exception Ex)
            {
                return null;
            }

        }

        public Admin LoadByAdmin(Admin AdminPram)
        {
            if (AdminPram != null)
            {
                _Obj = db.Admins.FirstOrDefault(usr => usr.Id == AdminPram.Id);
                return _Obj;
            }
            return null;
        }
        public Admin LoadByAdminId(String AdminIdPram)
        {
            if (AdminIdPram != null)
            {
                _Obj = db.Admins.FirstOrDefault(usr => usr.Id == new Guid(AdminIdPram));
                return _Obj;
            }
            return null;
        }
        public Admin LoadById(String ID)
        {
            if (ID != null)
            {
                _Obj = db.Admins.FirstOrDefault(usr => usr.Id == new Guid(ID));
                return _Obj;
            }
            return null;
        }

        public Admin LoginAdmin(Admin AdminPram, out Boolean loginAdmintate)
        {

            if (AdminPram != null)
            {
                loginAdmintate = true;
                return db.Admins.FirstOrDefault(admn => admn.Password == AdminPram.Password.ToString() && admn.LoginName == AdminPram.LoginName.ToString() && admn.Active == true);
            }
            else
            {
                loginAdmintate = false;
                return null;
            }

        }
        public String LoginUser(String LoginName, String Passowrd, out Boolean loginAdmintate)
        {
            _Obj = db.Admins.FirstOrDefault(admn => admn.LoginName == LoginName.Trim() && admn.Password == Passowrd.Trim() && admn.Active == true);

            //User Query = (from usr in db.Users
            //              where usr.LogInName == Username && usr.Password == Passowrd && usr.Active == true
            //              select usr).SingleOrDefault();

            if (_Obj != null)
            {
                loginAdmintate = true;
                return _Obj.Id.ToString();
            }
            else
            {
                loginAdmintate = false;
                return String.Empty;
            }
        }

        #endregion
    }
}
