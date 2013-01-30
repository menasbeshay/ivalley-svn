using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using Microsoft.ApplicationBlocks.Data;
using System.Data;
namespace GlobalLogistics.BLL
{
    public class DB
    {
        #region fields
        
        #endregion

        #region Properties
        public string ConnectionString 
        {
            get
            {                
               return ConfigurationManager.AppSettings["GLConnectionString"];
            }              
        }
        #endregion

        #region Constructors
        public DB()
        {

        }
        #endregion

        #region  Pages Methods
        public bool AddPage(string EnTitle, string ArTitle, string EnContent, string ArContent)
        {           
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddPage", EnTitle, ArTitle, EnContent, ArContent);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdatePage(int PageID ,string EnTitle, string ArTitle, string EnContent, string ArContent)
        {
            int rows = 0;
            try
            {
                rows= SqlHelper.ExecuteNonQuery(ConnectionString, "UpdatePage",PageID, EnTitle, ArTitle, EnContent, ArContent);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetPage(int PageID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetPage", PageID);
        }

        public DataSet GetPages()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetPages");
        }

        public bool DeletePage(int PageID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeletePage", PageID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchPages(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchPages", filterText);
        }
        #endregion

        #region  Magazine Methods
        public bool AddMagazine(string EnTitle, string ArTitle, string FilePath, DateTime CreatedDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddMagazine", EnTitle, ArTitle, FilePath, CreatedDate);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateMagazine(int MagazineID, string EnTitle, string ArTitle, string FilePath, DateTime CreatedDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateMagazine",MagazineID, EnTitle, ArTitle, FilePath, CreatedDate);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetMagazine(int MagazineID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetMagazine", MagazineID);
        }

        public DataSet GetMagazines()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetMagazines");
        }

        public bool DeleteMagazine(int MagazineID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteMagazine", MagazineID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }

        }

        public DataSet SearchMagazines(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchMagazines", filterText);
        }
        #endregion

        #region  Sponsor Methods
        public bool AddSponsor(string EnTitle, string ArTitle, string EnFilePath, string ArFilePath, string URL , int ViewOrder)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddSponsor", EnTitle, ArTitle, EnFilePath, ArFilePath,  URL ,  ViewOrder);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateSponsor(int SponsorID, string EnTitle, string ArTitle, string EnFilePath, string ArFilePath, string URL, int ViewOrder)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateSponsor",SponsorID, EnTitle, ArTitle, EnFilePath, ArFilePath, URL, ViewOrder);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetSponsor(int SponsorID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetSponsor", SponsorID);
        }

        public DataSet GetSponsors()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetSponsors");
        }

        public bool DeleteSponsor(int SponsorID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteSponsor", SponsorID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchSponsors(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchSponsors", filterText);
        }
        #endregion

        #region  Subscriber Methods
        public bool AddSubscriber(string Email)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddSubscriber", Email);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateSubscriber(int SubscriberID, string Email)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateSubscriber", SubscriberID, Email);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetSubscriber(int SubscriberID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetSubscriber", SubscriberID);
        }

        public DataSet GetSubscribers()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetSubscribers");
        }

        public bool DeleteSubscriber(int SubscriberID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteSubscriber", SubscriberID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchSubscribers(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchSubscribers", filterText);
        }
        #endregion

        #region  Categories Methods
        public bool AddCategory(string EnName, string ArName, string EnDescribtion, string ArDescribtion)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddCategory", EnName, ArName, EnDescribtion, ArDescribtion);
                 return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateCategory(int CategoryID, string EnName, string ArName, string EnDescribtion, string ArDescribtion)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateCategory", CategoryID, EnName, ArName, EnDescribtion, ArDescribtion);
                 return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetCategory(int CategoryID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetCategory", CategoryID);
        }

        public DataSet GetCategories()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetCategories");
        }

        public bool DeleteCategory(int CategoryID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteCategory", CategoryID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchCategories(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchCategories", filterText);
        }
        #endregion

        #region  SubCategories Methods
        public bool AddSubCategory(string EnName, string ArName, string EnDescribtion, string ArDescribtion, int CategoryID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddSubCategory", EnName, ArName, EnDescribtion, ArDescribtion, CategoryID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateSubCategory(int SubCategoryID, string EnName, string ArName, string EnDescribtion, string ArDescribtion, int CategoryID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateCategory", SubCategoryID, EnName, ArName, EnDescribtion, ArDescribtion, CategoryID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetSubCategory(int SubCategoryID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetSubCategory", SubCategoryID);
        }

        public DataSet GetSubCategories()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllSubCategories");
        }

        public DataSet GetAllSubCategoriesByCategory(int CategoryID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllSubCategoriesByCategory", CategoryID);
        }

        public bool DeleteSubCategory(int SubCategoryID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteSubCategory", SubCategoryID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchSubCategories(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchSubCategories", filterText);
        }
        #endregion

        #region  ServiceTypes Methods
        public bool AddServiceType(string EnName, string ArName)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddServiceType", EnName, ArName);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateServiceType(int ServiceTypeID,string EnName, string ArName)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateServiceType", ServiceTypeID, EnName, ArName);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetServiceType(int ServiceTypeID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetServiceType", ServiceTypeID);
        }

        public DataSet GetServiceTypes()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetServiceTypes");
        }

        public bool DeleteServiceType(int ServiceTypeID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteServiceType", ServiceTypeID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchServiceTypes(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchServiceTypes", filterText);
        }
        #endregion

        #region  Services Methods
        public bool AddService(string EnName, string ArName, string EnDescribtion, string ArDescribtion, int CategoryID, int TypeID, DateTime CreatedDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddService", EnName, ArName, EnDescribtion, ArDescribtion, CategoryID, TypeID, CreatedDate);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateService(int ServiceID, string EnName, string ArName, string EnDescribtion, string ArDescribtion, int CategoryID, int TypeID, DateTime CreatedDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateService",ServiceID, EnName, ArName, EnDescribtion, ArDescribtion, CategoryID, TypeID, CreatedDate);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetService(int ServiceID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetService", ServiceID);
        }

        public DataSet GetServices()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetServices");
        }

        public DataSet GetAllServicesByCategory(int CategoryID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllServicesByCategory", CategoryID);
        }

        public bool DeleteService(int ServiceID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteService", ServiceID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchServices(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchServices", filterText);
        }
        #endregion

        #region  Ads Methods
        public bool AddAds(string EnTitle, string ArTitle, string EnFilePath, string ArFilePath, int CategoryID, DateTime StartDate, DateTime EndDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddAds", EnTitle, ArTitle, EnFilePath, ArFilePath, CategoryID, StartDate, EndDate);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateAds(int adsID,  string EnTitle, string ArTitle, string EnFilePath, string ArFilePath, int CategoryID, DateTime StartDate, DateTime EndDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateAds",adsID, EnTitle, ArTitle, EnFilePath, ArFilePath, CategoryID, StartDate, EndDate);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetAds(int AdsID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAds", AdsID);
        }

        public DataSet GetAllAds()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllAds");
        }

        public DataSet GetAllAdsByCategory(int CategoryID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllAdsByCategory", CategoryID);
        }

        public bool DeleteAds(int AdsID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteAds", AdsID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchAds(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchAds", filterText);
        }
        #endregion

        #region  Vedios Methods
        public bool AddVedio(string EnTitle, string ArTitle, string URL, int CategoryID, DateTime CreatedDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddVedio", EnTitle, ArTitle, URL, CategoryID, CreatedDate);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateVedio(int VedioID, string EnTitle, string ArTitle, string URL, int CategoryID, DateTime CreatedDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateVedio",VedioID, EnTitle, ArTitle, URL, CategoryID, CreatedDate);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetVedio(int VedioID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetVedio", VedioID);
        }

        public DataSet GetVedios()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetVedios");
        }

        public DataSet GetAllVediosByCategory(int CategoryID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllVediosByCategory", CategoryID);
        }

        public bool DeleteVedio(int vedioID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteVedio", vedioID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchVedios(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchVedios", filterText);
        }
        #endregion

        #region  News Methods
        public bool AddNews(string EnTitle, string ArTitle, string EnBody, string ArBody, int CategoryID , DateTime CreatedDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddNews", EnTitle, ArTitle, EnBody, ArBody, CategoryID, CreatedDate);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateNews(int NewsID, string EnTitle, string ArTitle, string EnBody, string ArBody, int CategoryID, DateTime CreatedDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "Updateews", NewsID, EnTitle, ArTitle, EnBody, ArBody, CategoryID, CreatedDate);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetNews(int NewsID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetNews", NewsID);
        }

        public DataSet GetAllNews()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllNews");
        }

        public DataSet GetAllNewsByCategory(int CategoryID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllNewsByCategory", CategoryID);
        }

        public bool DeleteNews(int NewsID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteNews", NewsID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchNews(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchNews", filterText);
        }
        #endregion

        #region  Countries Methods
        public bool AddCountry(string EnName, string ArName, string EnDescribtion, string ArDescribtion)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddCountry", EnName, ArName, EnDescribtion, ArDescribtion);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateCountry(int CountryID, string EnName, string ArName, string EnDescribtion, string ArDescribtion)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateCountry", CountryID, EnName, ArName, EnDescribtion, ArDescribtion);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetCountry(int CountryID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetCountry", CountryID);
        }

        public DataSet GetCountries()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetCountries");
        }

        public bool DeleteCountry(int CountryID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteCountry", CountryID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchCountries(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchCountries", filterText);
        }
        #endregion

        #region  Cities Methods
        public bool AddCity(string EnName, string ArName, string EnDescribtion, string ArDescribtion)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddCity", EnName, ArName, EnDescribtion, ArDescribtion);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateCity(int CityID, string EnName, string ArName, string EnDescribtion, string ArDescribtion)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateCity", CityID, EnName, ArName, EnDescribtion, ArDescribtion);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetCity(int CityID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetCity", CityID);
        }

        public DataSet GetCities()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetCities");
        }

        public bool DeleteCity(int CityID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteCity", CityID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchCities(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchCities", filterText);
        }
        #endregion

        #region  Packages Methods
        public bool AddPackage(string EnName, string ArName, string EnDescribtion, string ArDescribtion)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddPackage", EnName, ArName, EnDescribtion, ArDescribtion);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdatePackage(int PackageID, string EnName, string ArName, string EnDescribtion, string ArDescribtion)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdatePackage", PackageID, EnName, ArName, EnDescribtion, ArDescribtion);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetPackage(int PackageID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetPackage", PackageID);
        }

        public DataSet GetPackages()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetPackages");
        }

        public bool DeletePackage(int PackageID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeletePackage", PackageID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchPackages(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchPackages", filterText);
        }
        #endregion

        #region  Package Options Methods
        public bool AddPackageOption(string EnName, string ArName, string EnDescribtion, string ArDescribtion)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddPackageOption", EnName, ArName, EnDescribtion, ArDescribtion);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdatePackageOption(int PackageOptionID, string EnName, string ArName, string EnDescribtion, string ArDescribtion)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdatePackageOption", PackageOptionID, EnName, ArName, EnDescribtion, ArDescribtion);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetPackageOption(int PackageOptionID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetPackageOption", PackageOptionID);
        }

        public DataSet GetPackageOptions()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetPackageOptions");
        }

        public bool DeletePackageOption(int PackageOptionID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeletePackageOption", PackageOptionID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet SearchPackageOptions(string filterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchPackageOptions", filterText);
        }
        #endregion

        #region  CompanyEnabledOptions Methods
        public bool AddCompanyEnabledOption(int PackageOptionID, int CompanyID, bool Enabled)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddCompanyEnabledOption", PackageOptionID, CompanyID, Enabled);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateCompanyEnabledOption(int CompanyEnabledOptionID, int PackageOptionID, int CompanyID, bool Enabled)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateCompanyEnabledOption", CompanyEnabledOptionID, PackageOptionID, CompanyID, Enabled);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetCompanyEnabledOption(int CompanyEnabledOptionID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetCompanyEnabledOption", CompanyEnabledOptionID);
        }

        public DataSet GetCompanyEnabledOptions()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetCompanyEnabledOptions");
        }

        public bool DeleteCompanyEnabledOption(int CompanyEnabledOptionID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteCompanyEnabledOption", CompanyEnabledOptionID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

      
        #endregion
    }

}
