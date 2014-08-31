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
    public class PageSectionsRepository
    {
        #region Variables
        DBDataContext db;
        public PageSection _Obj { get; set; }
        #endregion
        #region Methods
        public PageSectionsRepository()
        {
            db = new DBDataContext();
            _Obj = new PageSection();
        }

        public Guid Add()
        {
            _Obj.Id = Guid.NewGuid(); //get next or new id
            _Obj.Active = true;
            _Obj.CreatedOn = DateTime.Now;

            db.PageSections.Add(_Obj);
            db.SaveChanges();
            return _Obj.Id;
        }
        public Boolean Edit(String ID, String ModifiedBy)
        {
            try
            {
                _Obj = db.PageSections.FirstOrDefault(pram => pram.Id == new Guid(ID));
                if (_Obj != null)
                {

                    _Obj.ModifiedOn = DateTime.Now;
                    _Obj.ModifiedBy = new Guid(ModifiedBy);
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
        public Boolean Edit()
        {
            try
            {
                if (_Obj != null)
                {

                    _Obj.ModifiedOn = DateTime.Now;
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

        public Boolean Delete(String ID, String ModifiedBy)
        {
            try
            {
                _Obj = db.PageSections.FirstOrDefault(pram => pram.Id == new Guid(ID));
                if (_Obj != null)
                {
                    _Obj.ModifiedOn = DateTime.Now;
                    _Obj.ModifiedBy = new Guid(ModifiedBy);
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
        public Boolean Restore(String ID, String ModifiedBy)
        {
            try
            {
                _Obj = db.PageSections.FirstOrDefault(pram => pram.Id == new Guid(ID));
                if (_Obj != null)
                {
                    _Obj.ModifiedOn = DateTime.Now;
                    _Obj.ModifiedBy = new Guid(ModifiedBy);
                    _Obj.Active = true;
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
        public DataTable LoadByActiveState(String ID, Boolean ActiveState, String SortField, String SortType)
        {
            try
            {
                if (ID != null)
                {
                    var Query = (from pram in db.PageSections
                                 where pram.Active == ActiveState && pram.Id == new Guid(ID)
                                 select pram);
                    return Query.ToDataTable(SortField, SortType);

                }
                else if (ID == null)
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

                var Query = (from pram in db.PageSections
                             where pram.Active == ActiveState
                             select pram);
                return Query.ToDataTable(SortField, SortType);

            }

            catch (Exception Ex)
            {
                return null;
            }

        }
        public DataTable LoadByLanguageId(String LanguageId, Boolean ActiveState = true, String SortField = "CreatedOn", String SortType = "ASC")
        {
            try
            {

                var Query = (from pram in db.PageSections
                             where pram.Active == ActiveState && pram.LanguageId == (new Guid(LanguageId))
                             select pram);
                return Query.ToDataTable(SortField, SortType);

            }

            catch (Exception Ex)
            {
                return null;
            }

        }
        public DataTable LoadByPageId(String PageId, Boolean ActiveState = true, String SortField = "CreatedOn", String SortType = "ASC")
        {
            try
            {

                var Query = (from pram in db.PageSections
                             where pram.Active == ActiveState && pram.PageId == (new Guid(PageId))
                             select pram);
                return Query.ToDataTable(SortField, SortType);

            }

            catch (Exception Ex)
            {
                return null;
            }

        }
        public DataTable LoadByLanguageIdAndPageId(String PageId, String LanguageId, Boolean ActiveState = true, String SortField = "CreatedOn", String SortType = "ASC")
        {
            try
            {

                var Query = (from pram in db.PageSections
                             where pram.Active == ActiveState
                             && pram.LanguageId == new Guid(LanguageId)
                             && pram.PageId == new Guid(PageId)
                             select pram);
                return Query.ToDataTable(SortField, SortType);

            }

            catch (Exception Ex)
            {
                return null;
            }

        }
        public PageSection LoadByLanguageIdAndIsDefault(Boolean isdefault, String LanguageId, Boolean ActiveState = true, String SortField = "CreatedOn", String SortType = "ASC")
        {
            try
            {

                _Obj = db.PageSections.FirstOrDefault(pram => pram.Active == ActiveState && pram.LanguageId == new Guid(LanguageId) && pram.IsDefault == isdefault);
                return _Obj;

            }

            catch (Exception Ex)
            {
                return null;
            }

        }
        public PageSection LoadByLanguageIdPram(String LanguageId, Boolean ActiveState = true, String SortField = "CreatedOn", String SortType = "ASC")
        {
            try
            {

                _Obj = db.PageSections.FirstOrDefault(pram => pram.Active == ActiveState && pram.LanguageId == new Guid(LanguageId));
                return _Obj;

            }

            catch (Exception Ex)
            {
                return null;
            }

        }

        public DataTable LoadByLanguageIdAndIsDefaultDataDable(Boolean isdefault, String LanguageId, Boolean ActiveState = true, String SortField = "CreatedOn", String SortType = "ASC")
        {
            try
            {

                var Query = (from pram in db.PageSections
                             where pram.Active == ActiveState
                             && pram.LanguageId == new Guid(LanguageId)
                             && pram.IsDefault == isdefault
                             select pram);
                return Query.ToDataTable(SortField, SortType);

            }

            catch (Exception Ex)
            {
                return null;
            }

        }

        public PageSection LoadById(String ID)
        {
            if (ID != null)
            {
                _Obj = db.PageSections.FirstOrDefault(pram => pram.Id == new Guid(ID));
                return _Obj;
            }
            return null;
        }

        #endregion
    }
}
