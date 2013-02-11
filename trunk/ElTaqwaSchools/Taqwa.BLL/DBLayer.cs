using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.ApplicationBlocks.Data;
using System.Data;
using System.Configuration;

namespace Taqwa.BLL
{
    public class DBLayer
    {       
        #region fields

        #endregion

        #region Properties
        public string ConnectionString 
        {
            get
            {                
               return ConfigurationManager.AppSettings["TaqwaConnectionString"];
            }              
        }
        #endregion

        #region Constructors
        public DBLayer()
        {

        }
        #endregion

        #region General Methods
       
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
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllPages");
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
        #endregion

        #region  HomePageBlocks Methods
        public bool AddHomePageBlock(string EnTitle, string ArTitle, string EnContent, string ArContent)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddHomePageBlock", EnTitle, ArTitle, EnContent, ArContent);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateHomePageBlock(int HomePageBlockID, string EnTitle, string ArTitle, string EnContent, string ArContent)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateHomePageBlock", HomePageBlockID, EnTitle, ArTitle, EnContent, ArContent);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetHomePageBlock(int HomePageBlockID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetHomePageBlock", HomePageBlockID);
        }

        public DataSet GetAllHomePageBlocks()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllHomePageBlocks");
        }

        public bool DeleteHomePageBlock(int HomePageBlockID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteHomePageBlock", HomePageBlockID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  HonorPanel Methods
        public bool AddHonorPanel(string ENName , string ARName ,string PicturePath, string ENComments ,string ARComments )
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddHonorPanel", ENName, ARName, PicturePath, ENComments , ARComments);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateHonorPanel(int HonorPanelID, string ENName, string ARName, string PicturePath, string ENComments, string ARComments)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateHonorPanel", HonorPanelID, ENName, ARName, PicturePath, ENComments , ARComments);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetHonorPanel(int HonorPanelID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetHonorPanel", HonorPanelID);
        }

        public DataSet GetAllHonorPanel()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllHonorPanel");
        }

        public bool DeleteHonorPanel(int HonorPanelID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteHonorPanel", HonorPanelID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  OutStanding Methods
        public bool AddOutStanding(string ENName, string ARName, string PicturePath, DateTime Date, int ClassID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddOutStanding", ENName, ARName, PicturePath, Date, ClassID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateOutstanding(int OutstandingsID, string ENName, string ARName, string PicturePath, DateTime Date, int ClassID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateOutstanding", OutstandingsID, ENName, ARName, PicturePath, Date, ClassID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetOutstanding(int OutstandingsID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetOutstanding", OutstandingsID);
        }

        public DataSet GetAllOutstanding()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllOutstanding");
        }

        public bool DeleteOutstanding(int OutstandingsID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteOutstanding", OutstandingsID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  SchoolBus Methods
        public bool AddSchoolBus(string ENLineName ,string ARLineName, string ENDriverName ,string ARDriverName ,string DriverTele , string ENSupervisorName , string ARSupervisorName ,string SupervisorTele , string ARNotes , string ENNotes )
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddSchoolBus", ENLineName ,ARLineName, ENDriverName , ARDriverName , DriverTele ,  ENSupervisorName ,  ARSupervisorName , SupervisorTele ,  ARNotes ,  ENNotes);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateSchoolBus(int SchoolBusID, string ENLineName ,string ARLineName, string ENDriverName, string ARDriverName, string DriverTele, string ENSupervisorName, string ARSupervisorName, string SupervisorTele, string ARNotes, string ENNotes)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateSchoolBus", SchoolBusID, ENLineName , ARLineName, ENDriverName, ARDriverName, DriverTele, ENSupervisorName, ARSupervisorName, SupervisorTele, ARNotes, ENNotes);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetSchoolBus(int SchoolBusID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetSchoolBus", SchoolBusID);
        }

        public DataSet GetAllSchoolBus()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllSchoolBus");
        }

        public bool DeleteSchoolBus(int SchoolBusID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteSchoolBus", SchoolBusID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  ClassType Methods
        public bool AddClassType(string ENName, string ARName)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddClassType", ENName, ARName);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateClassType(int ClassTypeID, string ENName, string ARName)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateClassType", ClassTypeID, ENName, ARName);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetClassType(int ClassTypeID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetClassType", ClassTypeID);
        }

        public DataSet GetAllClassType()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllClassType");
        }

        public bool DeleteClassType(int ClassTypeID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteClassType", ClassTypeID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  Class Methods
        public bool AddClass(string ENName, string ARName, int ClassTypeID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddClass", ENName, ARName, ClassTypeID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateClass(int ClassID, string ENName, string ARName, int ClassTypeID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateClass", ClassID, ENName, ARName, ClassTypeID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetClass(int ClassID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetClass", ClassID);
        }

        public DataSet GetAllClass()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllClass");
        }

        public bool DeleteClass(int ClassID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteClass", ClassID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  ClassRooms Methods
        public bool AddClassRoom(string ENName, string ARName, int ClassID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddClassRoom", ENName, ARName, ClassID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateClassRoom(int ClassRoomID, string ENName, string ARName, int ClassID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateClassRoom", ClassRoomID, ENName, ARName, ClassID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetClassRoom(int ClassRoomID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetClassRoom", ClassRoomID);
        }

        public DataSet GetAllClassRooms()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllClassRooms");
        }

        public DataSet GetAllClassRoomsByClassID(int ClassID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllClassRoomsByClassID", ClassID);
        }

        public bool DeleteClassRoom(int ClassRoomID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteClassRoom", ClassRoomID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  Student Methods
        public int AddStudent(string ARFatherName,string ENFatherName,string FatherNationalNumber ,string FatherJobDesc ,string ARStudentName ,string ENStudentName ,string Tele ,string Mobile ,string Email ,string StudentAddress ,bool IsActive ,int ClassRoomID, string UserName )
        {
            int rows = 0;
            try
            {
                rows = Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString, "AddStudent", ARFatherName,ENFatherName,FatherNationalNumber , FatherJobDesc , ARStudentName , ENStudentName , Tele , Mobile , Email , StudentAddress , IsActive , ClassRoomID, UserName));
                return rows;//(rows > 0);
            }
            catch (Exception)
            {
                return 0;//false;
            }
        }

        public bool UpdateStudent(int StudentID, string ARFatherName, string ENFatherName, string FatherNationalNumber, string FatherJobDesc, string ARStudentName, string ENStudentName, string Tele, string Mobile, string Email, string StudentAddress, bool IsActive, int ClassRoomID, string UserName)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateStudent", StudentID, ARFatherName, ENFatherName, FatherNationalNumber, FatherJobDesc, ARStudentName, ENStudentName, Tele, Mobile, Email, StudentAddress, IsActive, ClassRoomID, UserName);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetStudent(int StudentID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetStudent", StudentID);
        }

        public DataSet GetStudentByUserNameAndSecertCode(string UserName, string SecertCode)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetStudentByUserNameAndSecertCode", UserName, SecertCode);
        }

        public DataSet GetAllStudentsByClassRoom(int ClassRoomID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllStudentsByClassRoom", ClassRoomID);
        }

        public DataSet SearchStudents(int ClassID,int ClassRoomID, string FilterText)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "SearchStudents", ClassID, ClassRoomID, FilterText);
        }

        public DataSet GetAllStudentsByClass(int ClassID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllStudentsByClass", ClassID);
        }

        public DataSet GetAllStudents()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllStudents");
        }

        public bool DeleteStudent(int StudentID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteStudent", StudentID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  School Year Methods
        public int AddSchoolYear(string ENName, string ARName)
        {
            int id = 0;
            int rows = 0;
            try
            {
               // rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddSchoolYear", ENName, ARName);
               // return (rows > 0);
                id = Convert.ToInt32(SqlHelper.ExecuteScalar(ConnectionString, "AddSchoolYear", ENName, ARName));
                return id;
            }
            catch (Exception)
            {
                return 0;// false;
            }
        }

        public bool UpdateSchoolYear(int SchoolYearID, string ENName, string ARName)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateSchoolYear", SchoolYearID, ENName, ARName);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool SetCurrentSchoolYear(int SchoolYearID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "SetCurrentSchoolYear", SchoolYearID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetCurrentSchoolYear()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetCurrentSchoolYear");
        }

        public DataSet GetSchoolYear(int SchoolYearID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetSchoolYear", SchoolYearID);
        }

        public DataSet GetAllSchoolYear()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllSchoolYear");
        }

        public bool DeleteSchoolYear(int SchoolYearID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteSchoolYear", SchoolYearID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  Sections Methods
        public bool AddSection(string ENName, string ARName, string Duration)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddSection", ENName, ARName, Duration);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateSection(int SectionID, string ENName, string ARName, string Duration)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateSection", SectionID, ENName, ARName, Duration);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetSection(int SectionID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetSection", SectionID);
        }

        public DataSet GetAllSections()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllSections");
        }

        public bool DeleteSection(int SectionID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteSection", SectionID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  Schedule Methods
        public bool AddSchedule(int DayCode ,int ClassRoomID  ,int SectionID  ,string ARDetails ,string ENDetails)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddSchedule", DayCode , ClassRoomID  , SectionID  , ARDetails , ENDetails);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateSchedule(int ScheduleID, int DayCode, int ClassRoomID, int SectionID, string ARDetails, string ENDetails)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateSchedule", ScheduleID, DayCode, ClassRoomID, SectionID, ARDetails, ENDetails);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetSchedule(int ScheduleID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetSchedule", ScheduleID);
        }

        public DataSet GetScheduleByClassRoomAndDay(int ClassRoomID, int DayCode)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetScheduleByClassRoomAndDay", ClassRoomID, DayCode);
        }

        public DataSet GetAllSchedule()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllSchedule");
        }

        public bool DeleteSchedule(int ScheduleID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteSchedule", ScheduleID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  MonthlyReport Methods
        public bool AddMonthlyReport(int StudentID ,string ARDetails ,string ENDetails,DateTime Date)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddMonthlyReport", StudentID , ARDetails , ENDetails, Date);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateMonthlyReport(int MonthlyReportID, int StudentID, string ARDetails, string ENDetails, DateTime Date)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateMonthlyReport", MonthlyReportID, StudentID, ARDetails, ENDetails, Date);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetMonthlyReport(int MonthlyReportID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetMonthlyReport", MonthlyReportID);
        }

        public DataSet GetMonthlyReportByStudentIDAndDate(int StudentID, DateTime Date)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetMonthlyReportByStudentIDAndDate", StudentID, Date);
        }

        public DataSet GetMonthlyReportByStudentID(int StudentID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetMonthlyReportByStudentID", StudentID);
        }

        public DataSet GetAllMonthlyReport()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllMonthlyReport");
        }

        public bool DeleteMonthlyReport(int MonthlyReportID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteMonthlyReport", MonthlyReportID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  MonthlyAttendanceReport Methods
        public bool AddMonthlyAttendanceReport(int StudentID, bool AttendanceFlag, DateTime Date)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddMonthlyAttendanceReport", StudentID, AttendanceFlag, Date);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateMonthlyAttendanceReport(int MonthlyAttendanceReportID, int StudentID, bool AttendanceFlag, DateTime Date)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateMonthlyAttendanceReport", MonthlyAttendanceReportID, StudentID,  AttendanceFlag, Date);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetMonthlyAttendanceReport(int MonthlyAttendanceReportID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetMonthlyAttendanceReport", MonthlyAttendanceReportID);
        }

        public DataSet GetMonthlyAttendanceReportByStudentIDAndDate(int StudentID, DateTime Date)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetMonthlyAttendanceReportByStudentIDAndDate", StudentID, Date);
        }

        public DataSet GetMonthlyAttendanceReportByStudentID(int StudentID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetMonthlyAttendanceReportByStudentID", StudentID);
        }

        public DataSet GetAllMonthlyAttendanceReport()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllMonthlyAttendanceReport");
        }

        public bool DeleteMonthlyAttendanceReport(int MonthlyAttendanceReportID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteMonthlyAttendanceReport", MonthlyAttendanceReportID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  Courses Methods
        public bool AddCourse(int MaxGrade ,int MinGrade ,string ENName ,string ARName ,int ClassID, bool InTotal)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddCourse", MaxGrade , MinGrade , ENName , ARName , ClassID, InTotal);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateCourse(int CourseID, int MaxGrade, int MinGrade, string ENName, string ARName, int ClassID, bool InTotal)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateCourse", CourseID, MaxGrade, MinGrade, ARName,ENName, ClassID, InTotal);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetCourse(int CourseID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetCourse", CourseID);
        }

        public DataSet GetAllCourses()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllCourses");
        }

        public DataSet GetAllCoursesByClass(int ClassID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllCoursesByClass", ClassID);
        }

        public DataSet GetAllCoursesByClassAndInTotal(int ClassID, bool InTotal)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllCoursesByClassAndInTotal", ClassID, InTotal);
        }

        public bool DeleteCourse(int CourseID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteCourse", CourseID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  Results Methods
        public bool AddResult(int StudentID  ,int CourseID  ,float Grade ,string Evaluation ,bool FirstHalfMidTerm ,bool FirstHalfFinal ,bool SecondHalfMidTerm ,bool SecondHalfFinal ,int SchoolYearID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddResult", StudentID  , CourseID  , Grade , Evaluation , FirstHalfMidTerm , FirstHalfFinal , SecondHalfMidTerm , SecondHalfFinal , SchoolYearID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateResult(int ResultID, int StudentID, int CourseID, float Grade, string Evaluation, bool FirstHalfMidTerm, bool FirstHalfFinal, bool SecondHalfMidTerm, bool SecondHalfFinal, int SchoolYearID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateResult", ResultID, StudentID, CourseID, Grade, Evaluation, FirstHalfMidTerm, FirstHalfFinal, SecondHalfMidTerm, SecondHalfFinal, SchoolYearID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetResult(int ResultID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetResult", ResultID);
        }

        public DataSet GetResultByStudentIDAndSchoolYear(int StudentID, int SchoolYearID, bool FHMT, bool FHF , bool SHMT , bool SHF)
        {
            if (FHMT)
            {
                return SqlHelper.ExecuteDataset(ConnectionString, "GetResultByStudentIDAndSchoolYearFHMT", StudentID, SchoolYearID);
            }
            else if (FHF)
            {
                return SqlHelper.ExecuteDataset(ConnectionString, "GetResultByStudentIDAndSchoolYearFHF", StudentID, SchoolYearID);
            }
            else if (SHMT)
            {
                return SqlHelper.ExecuteDataset(ConnectionString, "GetResultByStudentIDAndSchoolYearSHMT", StudentID, SchoolYearID);
            }
            else if (SHF)
            {
                return SqlHelper.ExecuteDataset(ConnectionString, "GetResultByStudentIDAndSchoolYearSHF", StudentID, SchoolYearID);
            }
            return SqlHelper.ExecuteDataset(ConnectionString, "GetResultByStudentIDAndSchoolYear", StudentID, SchoolYearID);
        }        

        public DataSet GetResultByStudentIDAndSchoolYearForAdmin(int StudentID, int SchoolYearID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetResultByStudentIDAndSchoolYearForAdmin", StudentID, SchoolYearID);
        }


        public DataSet GetAllResults()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllResults");
        }

        public bool DeleteResult(int ResultID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteResult", ResultID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  Fees Methods
        public bool AddFees(float RemainingFeesLastYear ,float BooksFees ,float BusFees ,float UniformFees ,float OtherFees ,float ActivitiesFees ,int StudentID  ,int SchoolYearID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddFees", RemainingFeesLastYear, BooksFees, BusFees, UniformFees, OtherFees, ActivitiesFees, StudentID, SchoolYearID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateFees(int FeesID, float RemainingFeesLastYear, float BooksFees, float BusFees, float UniformFees, float OtherFees, float ActivitiesFees, int StudentID, int SchoolYearID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateFees", FeesID, RemainingFeesLastYear, BooksFees, BusFees, UniformFees, OtherFees, ActivitiesFees, StudentID, SchoolYearID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetFees(int FeesID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetFees", FeesID);
        }

        public DataSet GetFeesByStudentIDAndSchoolYear(int StudentID, int SchoolYearID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetFeesByStudentIDAndSchoolYear", StudentID, SchoolYearID);
        }

        public DataSet GetFeesByClassAndClassRoomAndSchoolYear(int ClassID,int ClassRoomID, int SchoolYearID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetFeesByClassAndClassRoomAndSchoolYear", ClassID, ClassRoomID,  SchoolYearID);
        }

        public DataSet GetAllFees()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllFees");
        }

        public bool DeleteFees(int FeesID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteFees", FeesID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  Installments Methods
        public bool AddInstallment(float Quantity ,DateTime Date ,string PayOrderNo ,int StudentID  ,int SchoolYearID )
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddInstallment", Quantity, Date, PayOrderNo, StudentID, SchoolYearID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateInstallment(int InstallmentID, float Quantity, DateTime Date, string PayOrderNo, int StudentID, int SchoolYearID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateInstallment", InstallmentID, Quantity, Date, PayOrderNo, StudentID, SchoolYearID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetInstallments(int InstallmentID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetInstallments", InstallmentID);
        }

        public DataSet GetInstallmentsByStudentIDAndFeesID(int StudentID, int FeesID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetInstallmentsByStudentIDAndFeesID", StudentID, FeesID);
        }

        public DataSet GetInstallmentsByStudentIDAndSchoolYearID(int StudentID, int SchoolYearID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetInstallmentsByStudentIDAndSchoolYearID", StudentID, SchoolYearID);
        }

        public DataSet GetAllInstallments()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllInstallments");
        }

        public bool DeleteInstallment(int InstallmentID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteInstallment", InstallmentID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  News Methods
        public bool AddNews(string EnTitle, string ArTitle, string EnBody, string ArBody, DateTime CreatedDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddNews", EnTitle, ArTitle, EnBody, ArBody, CreatedDate);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateNews(int NewsID, string EnTitle, string ArTitle, string EnBody, string ArBody, DateTime CreatedDate)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateNews", NewsID, EnTitle, ArTitle, EnBody, ArBody, CreatedDate);
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

        public DataSet GetTopNews()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetTopNews");
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
        #endregion

        #region  Users Methods
        public bool AddUser(string UserName ,string Password)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddUser",  UserName ,Password);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateUser(int UserID, string UserName, string Password)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateUser", UserID, UserName, Password);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetUser(int UserID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetUser", UserID);
        }

        public DataSet GetUserByUserNameAndPassword(string UserName, string Password)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetUserByUserNameAndPassword", UserName, Password);
        }

        public DataSet GetAllUsers()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllUsers");
        }

        public bool DeleteUser(int UserID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteUser", UserID);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region  GalleryPhoto Methods
        public bool AddGalleryPhoto(string EnTitle, string ArTitle, string PicturePath)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "AddGalleryPhoto", EnTitle, ArTitle, PicturePath);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateGalleryPhoto(int GalleryPhotoID, string EnTitle, string ArTitle, string PicturePath)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "UpdateGalleryPhoto", GalleryPhotoID, EnTitle, ArTitle, PicturePath);
                return (rows > 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet GetGalleryPhoto(int GalleryPhotoID)
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetGalleryPhoto", GalleryPhotoID);
        }

        public DataSet GetAllGalleryPhoto()
        {
            return SqlHelper.ExecuteDataset(ConnectionString, "GetAllGalleryPhoto");
        }


        public bool DeleteGalleryPhoto(int GalleryPhotoID)
        {
            int rows = 0;
            try
            {
                rows = SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteGalleryPhoto", GalleryPhotoID);
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
