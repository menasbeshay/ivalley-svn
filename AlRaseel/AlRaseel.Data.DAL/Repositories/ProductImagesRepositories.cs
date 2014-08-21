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
    public class ProductImagesRepositories
    {
        #region Variables
        DBDataContext db;
        public ProductImage _Obj { get; set; }
        #endregion
        #region Methods
        public ProductImagesRepositories()
        {
            db = new DBDataContext();
            _Obj = new ProductImage();
        }

        public Guid Add()
        {
            _Obj.Id = Guid.NewGuid(); //get next or new id
            _Obj.Active = true;
            _Obj.CreatedOn = DateTime.Now;

            db.ProductImages.Add(_Obj);
            db.SaveChanges();
            return _Obj.Id;
        }
        public Boolean Edit(String ID, String ModifiedBy)
        {
            try
            {
                _Obj = db.ProductImages.FirstOrDefault(pram => pram.Id == new Guid(ID));
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
                _Obj = db.ProductImages.FirstOrDefault(pram => pram.Id == new Guid(ID));
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
                _Obj = db.ProductImages.FirstOrDefault(pram => pram.Id == new Guid(ID));
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
                    var Query = (from pram in db.ProductImages
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

                var Query = (from pram in db.ProductImages
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

                var Query = (from pram in db.ProductImages
                             where pram.Active == ActiveState && pram.LanguageId == new Guid(LanguageId)
                             select pram);
                return Query.ToDataTable(SortField, SortType);

            }

            catch (Exception Ex)
            {
                return null;
            }

        }
        public ProductImage LoadById(String ID)
        {
            if (ID != null)
            {
                _Obj = db.ProductImages.FirstOrDefault(pram => pram.Id == new Guid(ID));
                return _Obj;
            }
            return null;
        }

        public ProductImage LoadByProductId(String ProductID)
        {
            if (ProductID != null)
            {
                _Obj = db.ProductImages.FirstOrDefault(pram => pram.ProductId == new Guid(ProductID) && pram.Active == true);
                return _Obj;
            }
            return null;
        }
        #endregion
        public DataTable LoadByProductIdAndLanguageId(String LanguageId, String ProductId, Boolean ActiveState = true, String SortField = "CreatedOn", String SortType = "ASC")
        {
            var Query = (from pram in db.ProductImages
                         where pram.Active == true
                         && pram.LanguageId == new Guid(LanguageId)
                         && pram.ProductId == new Guid(ProductId)
                         select pram);
            return Query.ToDataTable(SortField, SortType);
        }


    }
}
