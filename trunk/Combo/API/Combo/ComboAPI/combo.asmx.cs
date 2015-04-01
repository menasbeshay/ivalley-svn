using Combo.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Net.Mail;
using System.Web.Script.Services;
using System.IO;
using System.Web.Script.Serialization;
using System.Net;
using System.Net.Security;
using System.Text;
using System.Security.Cryptography.X509Certificates;
using System.Threading;


namespace Combo.ComboAPI
{
    /// <summary>
    /// Summary description for combo
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class combo : System.Web.Services.WebService
    {
        #region Users
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo Users
        /// </summary>
        /// <returns>ComboResponse object with List of all Combo Users </returns>
        public void GetUsers()
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUser user = new ComboUser();
            user.LoadAll();
            List<Models.ComboUser> Users = user.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboUser
                {
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    UserName = row["UserName"].ToString(),
                    DisplayName = row["DisplayName"].ToString(),
                    Password = row["Password"].ToString(),
                    Email = row["Email"].ToString(),
                    Bio = row["Bio"].ToString(),
                    ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                    CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                    GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                    IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                    ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                    ExternalID = row["ExternalID"].ToString(),
                    DeviceID = row["DeviceID"].ToString(),
                    ActivationCode = row.IsNull("ActivationCode") ? Guid.Empty : new Guid(row["ActivationCode"].ToString()),
                    PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString()),
                    UserRankID = Convert.ToInt32(row["UserRankID"]),
                    Location = row["Location"].ToString()
                };
            }).ToList();


            _response.Entity = Users;
            SetContentResult(_response);            
            //return _response;

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get Combo User By ID
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with requested User object </returns>
        public void GetUserByID(int id, int requester)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUser user = new ComboUser();
            user.GetUserByUserId(id, requester);

            ComboUser stats = new ComboUser();
            stats.GetUserStatisticsByUserId(id);

            List<Models.ComboUser> Users = user.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboUser
                {
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    UserName = row["UserName"].ToString(),
                    DisplayName = row["DisplayName"].ToString(),
                    Password = row["Password"].ToString(),
                    Email = row["Email"].ToString(),
                    Bio = row["Bio"].ToString(),
                    ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                    CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                    GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                    IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                    ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                    ExternalID = row["ExternalID"].ToString(),
                    DeviceID = row["DeviceID"].ToString(),
                    ActivationCode = row.IsNull("ActivationCode") ? Guid.Empty : new Guid(row["ActivationCode"].ToString()),
                    PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString()),
                    FollowersCount = Convert.ToInt32(stats.GetColumn("FollowersCount")),
                    FollowingCount = Convert.ToInt32(stats.GetColumn("FollowingsCount")),
                    FriendsCount = Convert.ToInt32(stats.GetColumn("FriendsCount")),
                    PostsCount = Convert.ToInt32(stats.GetColumn("PostsCount")),
                    PostsLikeCount = Convert.ToInt32(stats.GetColumn("PostsLikeCount")),
                    IsFriend = Convert.ToBoolean(row["IsFriend"]),
                    IsFollower = Convert.ToBoolean(row["IsFollower"]),
                    IsFollowing = Convert.ToBoolean(row["IsFollowing"]),
                    FriendRequestSent = Convert.ToInt32(row["IsFriendRequestSent"]),
                    ProfilePic = row["ProfilePic"].ToString(),
                    CoverPic = row["CoverPic"].ToString(),
                    UserRankID = Convert.ToInt32(row["UserRankID"]),
                    ProfileLikerCount = Convert.ToInt32(stats.GetColumn("ProfileLikerCount")),
                    BirthDate = row.IsNull("BirthDate") ? DateTime.MinValue : Convert.ToDateTime(row["BirthDate"]),
                    Country  = row["Country"].ToString(),
                    Phone = row["Phone"].ToString(),
                    Website = row["Website"].ToString(),
                    CountryFlagPath = row["CountryFlagPath"].ToString(),
                    Location = row["Location"].ToString(),
                    IsPrivateAccount = row.IsNull("IsPrivateAccount") ? false : Convert.ToBoolean(row["IsPrivateAccount"]),
                    IsFollowingRequestSent = Convert.ToBoolean(row["IsFollowingRequestSent"]),
                    IsFollowerRequestSent = Convert.ToBoolean(row["IsFollowerRequestSent"]),
                };
            }).ToList();


            _response.Entity = Users;
            SetContentResult(_response);
            
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get Combo User By ID
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with requested User object </returns>
        public void GetUserInfoByID(int id)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUser user = new ComboUser();
            user.GetUserByUserId(id);

            ComboComment comments = new ComboComment();
            comments.GetPostCommentsCountByUserID(user.ComboUserID);

            UserActivityLog log = new UserActivityLog();
            log.GetActivityDaysByUserID(user.ComboUserID);

            ComboUser stats = new ComboUser();
            stats.GetUserStatisticsByUserId(id);

            List<Models.ComboUser> Users = user.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboUser
                {
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    UserName = row["UserName"].ToString(),
                    DisplayName = row["DisplayName"].ToString(),
                    Password = row["Password"].ToString(),
                    Email = row["Email"].ToString(),
                    Bio = row["Bio"].ToString(),
                    ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                    CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                    GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                    IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                    ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                    ExternalID = row["ExternalID"].ToString(),
                    DeviceID = row["DeviceID"].ToString(),
                    ActivationCode = row.IsNull("ActivationCode") ? Guid.Empty : new Guid(row["ActivationCode"].ToString()),
                    PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString()),
                    FollowersCount = Convert.ToInt32(stats.GetColumn("FollowersCount")),
                    FollowingCount = Convert.ToInt32(stats.GetColumn("FollowingsCount")),
                    FriendsCount = Convert.ToInt32(stats.GetColumn("FriendsCount")),
                    PostsCount = Convert.ToInt32(stats.GetColumn("PostsCount")),
                    PostsLikeCount = Convert.ToInt32(stats.GetColumn("PostsLikeCount")),                    
                    ProfilePic = row["ProfilePic"].ToString(),
                    SecurityQuestion = row["SecurityQuestion"].ToString(),
                    SecurityAnswer = row["SecurityAnswer"].ToString(),
                    UserRankID = Convert.ToInt32(row["UserRankID"]),
                    ProfileLikerCount = Convert.ToInt32(stats.GetColumn("ProfileLikerCount")),
                    SecurityWord = row["SecurityWord"].ToString(),
                    CountryFlagPath = row["CountryFlagPath"].ToString(),
                    Location = row["Location"].ToString(),
                    TotalActivityDays = log.RowCount > 0 ? Convert.ToInt32(log.GetColumn("TotalActivityDays")) : 0,
                    CommentsCount = Convert.ToInt32(comments.GetColumn("TotalCount"))
                };
            }).ToList();


            _response.Entity = Users;
            SetContentResult(_response);

        }


        [WebMethod]
        /// <summary>
        /// Get Combo User By Username/Email & Password
        /// </summary>
        /// <param name="UserName">Username / email</param>
        /// <param name="Password">password</param>
        /// <returns>ComboResponse object with requested User object</returns>
        public void GetUser(string username, string password, string DeviceID)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUser user = new ComboUser();
            if (!user.GetUserByUserNameAndPassword(username, password))
            {
                _response.ErrorCode = 11;
                _response.ErrorMsg = "User doesn't exist";
                _response.bool_result = false;
                if (user.GetUserByUserName(username))
                {
                    _response.ErrorCode = 10;
                    _response.ErrorMsg = "Password not correct";
                }
            }
            else
            {
                // save device id if changed
                user.DeviceID = DeviceID;
                user.Save();
                // get user info
                List<Models.ComboUser> Users = user.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboUser
                    {
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        UserName = row["UserName"].ToString(),
                        DisplayName = row["DisplayName"].ToString(),
                        Password = row["Password"].ToString(),
                        Email = row["Email"].ToString(),
                        Bio = row["Bio"].ToString(),
                        ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                        CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                        GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                        IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                        ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                        ExternalID = row["ExternalID"].ToString(),
                        DeviceID = row["DeviceID"].ToString(),
                        ActivationCode = row.IsNull("ActivationCode") ? Guid.Empty : new Guid(row["ActivationCode"].ToString()),
                        PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString()),
                        SecurityQuestion = row["SecurityQuestion"].ToString(),
                        SecurityAnswer = row["SecurityAnswer"].ToString(),
                        UserRankID = Convert.ToInt32(row["UserRankID"]),
                        SecurityWord = row["SecurityWord"].ToString(),
                        Location = row["Location"].ToString()
                    };
                }).ToList();


                _response.Entity = Users;
            }
            SetContentResult(_response);           
            return;
        }

        [WebMethod]        
        /// <summary>
        /// Add Combo user to db
        /// </summary>
        /// <param name="user">Combo user object to be added</param>
        /// <returns>ComboResponse object with Added User object</returns>
        public void AddUser(Models.ComboUser user)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            BLL.ComboUser newUser = new ComboUser();
            BLL.ComboUser _user = new ComboUser();
            if (_user.GetUserByUserName(user.UserName) || _user.GetUserByUserName(user.Email))
            {
                _response.ErrorCode = 12;
                _response.ErrorMsg = "Username or Email exists before";
                _response.bool_result = false;
                SetContentResult(_response);
                return;
            }

            //if (string.IsNullOrEmpty(user.SecurityQuestion))
            //{
            //    _response.ErrorCode = 14;
            //    _response.ErrorMsg = "No secuity question found";
            //    _response.bool_result = false;
            //    SetContentResult(_response);
            //    return;
            //}

            //if (string.IsNullOrEmpty(user.SecurityAnswer))
            //{
            //    _response.ErrorCode = 15;
            //    _response.ErrorMsg = "No security answer found";
            //    _response.bool_result = false;
            //    SetContentResult(_response);
            //    return;
            //}
            if (string.IsNullOrEmpty(user.SecurityWord))
            {
                _response.ErrorCode = 15;
                _response.ErrorMsg = "No security word found";
                _response.bool_result = false;
                SetContentResult(_response);
                return;
            }
            newUser.AddNew();
            newUser.UserName = user.UserName;
            if (!string.IsNullOrEmpty(user.DisplayName))
                newUser.DisplayName = user.DisplayName;
            newUser.Password = user.Password;
            newUser.Email = user.Email;
            //newUser.SecurityQuestion = user.SecurityQuestion;
            //newUser.SecurityAnswer = user.SecurityAnswer;
            newUser.SecurityWord = user.SecurityWord;
            if (!string.IsNullOrEmpty(user.Bio))
                newUser.Bio = user.Bio;
            if (user.ProfileImgID != 0)
                newUser.ProfileImgID = user.ProfileImgID;
            if (user.CoverImgID != 0)
                newUser.CoverImgID = user.CoverImgID;
            if (user.GenderID != 0)
                newUser.GenderID = user.GenderID;
            newUser.IsActivated = user.IsActivated;
            if (user.ExternalIDType != 0)
            {
                newUser.ExternalIDType = user.ExternalIDType;
                newUser.ExternalID = user.ExternalID;
            }
            if (!string.IsNullOrEmpty(user.DeviceID))
                newUser.DeviceID = user.DeviceID;
            
            // set rank by default
            newUser.UserRankID = 1;

            if (user.BirthDate != DateTime.MinValue)
                newUser.BirthDate = user.BirthDate;
            if (!string.IsNullOrEmpty(user.Country))
                newUser.Country  = user.Country;
            if (!string.IsNullOrEmpty(user.Phone))
                newUser.Phone = user.Phone;
            if (!string.IsNullOrEmpty(user.Website))
                newUser.Website = user.Website;
            if (user.CountryID != 0)
                newUser.CountryID = user.CountryID;
            if (!string.IsNullOrEmpty(user.Location))
                newUser.Location = user.Location;


            try
            {
                newUser.IsPrivateAccount = user.IsPrivateAccount;
            }
            catch (Exception ex)
            {
                
            }

            newUser.Save();

            user.ComboUserID = newUser.ComboUserID;
            _response.Entity = new Models.ComboUser[]{ user};

            try
            {
                MailMessage msg = new MailMessage();
                string body = Combo.Properties.Resources.registrationBody;
                string mail = Combo.Properties.Resources.mail;

                string mailto = user.Email;
                msg.To.Add(mailto);
                msg.From = new MailAddress(mail);
                msg.Subject = Combo.Properties.Resources.registrationSubject;
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.UTF8;

                msg.Body = string.Format(body, user.UserName);

                SmtpClient client = new SmtpClient(Combo.Properties.Resources.mailserver, Convert.ToInt32(Combo.Properties.Resources.port));

                client.UseDefaultCredentials = false;
                //client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential(mail, Combo.Properties.Resources.mailpass);
                client.Send(msg);
            }
            catch (Exception ex)
            {
                //_response.ErrorCode = 9999;
                //_response.ErrorMsg = "An Error Occured.Please try again.<br />" + ex.Message;
                //_response.bool_result = false;
            }


            SetContentResult(_response);
            return;
        }

        [WebMethod]
        /// <summary>
        /// Update Combo user to db
        /// </summary>
        /// <param name="user">Combo user object to be added</param>
        /// <returns>ComboResponse object with updated User object</returns>
        public void UpdateUser(Models.ComboUser user)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            BLL.ComboUser newUser = new ComboUser();
            newUser.LoadByPrimaryKey(user.ComboUserID);
            if (!string.IsNullOrEmpty(user.DisplayName))
                newUser.DisplayName = user.DisplayName;
            if (!string.IsNullOrEmpty(user.Password))
                newUser.Password = user.Password;
            if (!string.IsNullOrEmpty(user.Email))
                newUser.Email = user.Email;
            if (!string.IsNullOrEmpty(user.Bio))
                newUser.Bio = user.Bio;
            if (user.ProfileImgID != 0)
                newUser.ProfileImgID = user.ProfileImgID;
            if (user.CoverImgID != 0)
                newUser.CoverImgID = user.CoverImgID;
            if (user.GenderID != 0)
                newUser.GenderID = user.GenderID;

            if (!string.IsNullOrEmpty(user.SecurityQuestion))
                newUser.SecurityQuestion = user.SecurityQuestion;
            if (!string.IsNullOrEmpty(user.SecurityAnswer))
                newUser.SecurityAnswer = user.SecurityAnswer;
            if (!string.IsNullOrEmpty(user.SecurityWord))
                newUser.SecurityWord = user.SecurityWord;

            if (user.ExternalIDType != 0)
            {
                newUser.ExternalIDType = user.ExternalIDType;
                newUser.ExternalID = user.ExternalID;
            }
            if (!string.IsNullOrEmpty(user.DeviceID))
                newUser.DeviceID = user.DeviceID;

            if (user.BirthDate != DateTime.MinValue)
                newUser.BirthDate = user.BirthDate;
            if (!string.IsNullOrEmpty(user.Country))
                newUser.Country = user.Country;
            if (!string.IsNullOrEmpty(user.Phone))
                newUser.Phone = user.Phone;
            if (!string.IsNullOrEmpty(user.Website))
                newUser.Website = user.Website;
            if (user.CountryID != 0)
                newUser.CountryID = user.CountryID;
            if (!string.IsNullOrEmpty(user.Location))
                newUser.Location = user.Location;

            try
            {
                newUser.IsPrivateAccount = user.IsPrivateAccount;
            }
            catch (Exception ex)
            {

            }

            newUser.Save();

            user.ComboUserID = newUser.ComboUserID;
            user.UserRankID = newUser.UserRankID;



            _response.Entity = new Models.ComboUser[]{ user};

            SetContentResult(_response);
            return;
        }

        [WebMethod]
        /// <summary>
        /// Delete Combo User from db
        /// </summary>
        /// <param name="ID">Combo User ID</param>
        /// <returns>ComboResponse object with Delete Result</returns>
        public void DeleteUser(int ID)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUser user = new ComboUser();
            if (!user.LoadByPrimaryKey(ID))
            {
                _response.ErrorCode = 11;
                _response.ErrorMsg = "User doesn't exist";
                _response.bool_result = false;

            }
            else
            {
                user.MarkAsDeleted();
                user.Save();
            }

            _response.Entity = null;
            SetContentResult(_response);
            return;
        }


        [WebMethod]
        /// <summary>
        /// activate/deactivate Combo User 
        /// </summary>
        /// <param name="ID">Combo User ID</param>
        /// <returns>ComboResponse object </returns>
        public void ToggleDeactivateUser(int ID, bool deactivate)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUser user = new ComboUser();
            if (!user.LoadByPrimaryKey(ID))
            {
                _response.ErrorCode = 11;
                _response.ErrorMsg = "User doesn't exist";
                _response.bool_result = false;

            }
            else
            {
                user.IsDeactivated = deactivate;
                user.Save();
            }

            _response.Entity = null;
            SetContentResult(_response);
            return;
        }


        [WebMethod]
        /// <summary>
        /// send forget pasword code by username
        /// </summary>
        /// <param name="ID">username of Combo User</param>
        /// <returns>ComboResponse object </returns>
        public void ForgetPassword(string Username, string securityWord)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUser user = new ComboUser();
            if (!user.GetUserByUserName(Username))
            {
                _response.ErrorCode = 11;
                _response.ErrorMsg = "User doesn't exist";
                _response.bool_result = false;

            }
            else if (user.SecurityWord != securityWord)
            {
                _response.ErrorCode = 16;
                _response.ErrorMsg = "Security word is not matched to our databse.";
                _response.bool_result = false;

            }
            else
            {
                //user.PassResetCode = Guid.NewGuid();
                //user.Save();


                //try
                //{
                //    MailMessage msg = new MailMessage();
                //    string body = Combo.Properties.Resources.body;
                //    string mail = Combo.Properties.Resources.mail;

                //    string mailto = user.Email;
                //    msg.To.Add(mailto);
                //    msg.From = new MailAddress(mail);
                //    msg.Subject = Combo.Properties.Resources.subject;
                //    msg.IsBodyHtml = true;
                //    msg.BodyEncoding = System.Text.Encoding.UTF8;

                //    msg.Body = string.Format(body, user.UserName, user.PassResetCode.ToString());

                //    SmtpClient client = new SmtpClient(Combo.Properties.Resources.mailserver, Convert.ToInt32(Combo.Properties.Resources.port));

                //    client.UseDefaultCredentials = false;
                //    //client.EnableSsl = true;
                //    client.Credentials = new System.Net.NetworkCredential(mail, Combo.Properties.Resources.mailpass);
                //    client.Send(msg);
                //}
                //catch (Exception ex)
                //{
                //    _response.ErrorCode = 9999;
                //    _response.ErrorMsg = "An Error Occured.Please try again.<br />" + ex.Message;
                //    _response.bool_result = false;
                //}


                List<Models.ComboUser> Users = user.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboUser
                    {
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        UserName = row["UserName"].ToString(),
                        DisplayName = row["DisplayName"].ToString(),
                        Password = row["Password"].ToString(),
                        Email = row["Email"].ToString(),
                        Bio = row["Bio"].ToString(),
                        ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                        CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                        GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                        IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                        ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                        ExternalID = row["ExternalID"].ToString(),
                        DeviceID = row["DeviceID"].ToString(),
                        ActivationCode = row.IsNull("ActivationCode") ? Guid.Empty : new Guid(row["ActivationCode"].ToString()),
                        PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString()),                        
                        UserRankID = Convert.ToInt32(row["UserRankID"]),
                        SecurityWord = row["SecurityWord"].ToString()
                    };
                }).ToList();

                _response.Entity = Users;
            }

            
            SetContentResult(_response);
            return;
        }


        [WebMethod]
        /// <summary>
        /// Toggle follow user 
        /// </summary>
        /// <param name="UserID">UserID to be followed</param>
        /// <param name="FollowerID">follower ID</param>
        /// <returns>ComboResponse object with result</returns>
        public void ToggleLikeFriend(int userId, int LikerId)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";
            bool like = false;

            ProfileLiker Liker = new ProfileLiker();
            if (!Liker.LoadByPrimaryKey(userId, LikerId))
            {
                Liker.AddNew();
                Liker.ComboLikerID = LikerId;
                Liker.ComboUserID = userId;
                Liker.Save();
                like = true;
            }
            else
            {
                Liker.MarkAsDeleted();
                Liker.Save();
            }


            /**************************/
            // save notification and push it to device             
            ComboUser creator = new ComboUser();
            ComboUser P_Liker = new ComboUser();
            creator.LoadByPrimaryKey(userId);
            P_Liker.LoadByPrimaryKey(LikerId);

            ComboNotification notification = new ComboNotification();
            notification.AddNew();
            notification.ComboUserID = creator.ComboUserID;
            if (like)
                notification.NotificationType = (int)Combo.Models.NotificationType.LIKE_PROFILE; // Like friend
            else
                notification.NotificationType = (int)Combo.Models.NotificationType.UNLIKE_PROFILE; // unLike friend
            notification.NotificationDate = DateTime.UtcNow;
            notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject("[{'ComboUserID':" + creator.ComboUserID + ",'ComboFriendID':" + P_Liker.ComboUserID + ",'ComboUsername:'" + P_Liker.UserName + "'" + ",'ComboDisplayName:'" + P_Liker.DisplayName + "', 'IsFollowUser' : " + like + "}]");
            notification.IsRead = false;
            notification.Save();

            List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboNotification
                {
                    ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    IsRead = Convert.ToBoolean(row["IsRead"]),
                    NotificationBody = row["NotificationBody"].ToString(),
                    NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    NotificationType = Convert.ToInt32(row["NotificationType"])
                };
            }).ToList();

            SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), creator.DeviceID);
            /**************************/

            _response.Entity = null;
            SetContentResult(_response);

        }

        private void UpdateUserRank(int UserID)
        {
            ComboUser user = new ComboUser();
            user.GetUserByUserId(UserID);
            
            UserActivityLog log = new UserActivityLog();
            log.GetActivityDaysByUserID(user.ComboUserID);

            ComboPost posts = new ComboPost();
            posts.GetUserPostsCountByUserID(user.ComboUserID);

            ComboComment comments = new ComboComment();
            comments.GetPostCommentsCountByUserID(user.ComboUserID);

            ComboPostLike postLikes = new ComboPostLike();
            postLikes.GetPostLikesCountByUserID(user.ComboUserID);

            ProfileFollower followers = new ProfileFollower();
            followers.GetProfileFollowersCountByUserID(user.ComboUserID);

            ProfileFollower followings = new ProfileFollower();
            followings.GetProfileFollowingCountByUserID(user.ComboUserID);

            ProfileLiker profileLikes = new ProfileLiker();
            profileLikes.GetProfileLikerCountByUserID(user.ComboUserID);

            int oldRank = user.UserRankID;

            if (Convert.ToInt32(log.GetColumn("TotalActivityDays")) > 365 ||
                Convert.ToInt32(posts.GetColumn("TotalPostCount")) > 3000 ||
                Convert.ToInt32(comments.GetColumn("TotalCount")) > 3000 ||
                Convert.ToInt32(postLikes.GetColumn("TotalPostLikes")) > 3000 ||
                Convert.ToInt32(followers.GetColumn("TotalFollowers")) > 3000 ||
                Convert.ToInt32(followings.GetColumn("TotalFollowings")) > 3000 ||
                Convert.ToInt32(profileLikes.GetColumn("TotalProfileLikes")) > 3000)
            {
                user.UserRankID = 5;
            }
            else if (Convert.ToInt32(log.GetColumn("TotalActivityDays")) > 240 ||
                    Convert.ToInt32(posts.GetColumn("TotalPostCount")) > 2000 ||
                    Convert.ToInt32(comments.GetColumn("TotalCount")) > 2000 ||
                    Convert.ToInt32(postLikes.GetColumn("TotalPostLikes")) > 2000 ||
                    Convert.ToInt32(followers.GetColumn("TotalFollowers")) > 2000 ||
                    Convert.ToInt32(followings.GetColumn("TotalFollowings")) > 2000 ||
                    Convert.ToInt32(profileLikes.GetColumn("TotalProfileLikes")) > 2000)
            {
                user.UserRankID = 4;
            }
            else if (Convert.ToInt32(log.GetColumn("TotalActivityDays")) > 120 ||
                    Convert.ToInt32(posts.GetColumn("TotalPostCount")) > 1000 ||
                    Convert.ToInt32(comments.GetColumn("TotalCount")) > 1000 ||
                    Convert.ToInt32(postLikes.GetColumn("TotalPostLikes")) > 1000 ||
                    Convert.ToInt32(followers.GetColumn("TotalFollowers")) > 1000 ||
                    Convert.ToInt32(followings.GetColumn("TotalFollowings")) > 1000 ||
                    Convert.ToInt32(profileLikes.GetColumn("TotalProfileLikes")) > 1000)
            {
                user.UserRankID = 3;
            }
            else if (Convert.ToInt32(log.GetColumn("TotalActivityDays")) > 30 ||
                    Convert.ToInt32(posts.GetColumn("TotalPostCount")) > 500 ||
                    Convert.ToInt32(comments.GetColumn("TotalCount")) > 500 ||
                    Convert.ToInt32(postLikes.GetColumn("TotalPostLikes")) > 500 ||
                    Convert.ToInt32(followers.GetColumn("TotalFollowers")) > 500 ||
                    Convert.ToInt32(followings.GetColumn("TotalFollowings")) > 500 ||
                    Convert.ToInt32(profileLikes.GetColumn("TotalProfileLikes")) > 500)
            {
                user.UserRankID = 2;
            }

            user.Save();
            if (user.UserRankID > oldRank)
            {
                /**************************/
                // save notification and push it to device                            
                UserRank old = new UserRank();
                old.LoadByPrimaryKey(oldRank);

                UserRank newrank = new UserRank();
                newrank.LoadByPrimaryKey(user.UserRankID);

                List<Models.UserRankUpdated> arequest = user.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.UserRankUpdated
                    {                        
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        UserName = user.UserName,
                        DisplayName = user.DisplayName,
                        OldUserRankID = oldRank,
                        NewUserRankID = user.UserRankID,
                        OldRankName = old.Name,
                        NewRankName = newrank.Name,
                        ProfilePic = row["ProfilePic"].ToString()
                    };
                }).ToList();

                ComboNotification notification = new ComboNotification();
                notification.AddNew();
                notification.ComboUserID = user.ComboUserID;
                notification.NotificationType = (int)Combo.Models.NotificationType.UPDATE_USER_RANK; // update rank 
                notification.NotificationDate = DateTime.UtcNow;
                notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(arequest);
                notification.IsRead = false;
                notification.Save();

                List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboNotification
                    {
                        ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        IsRead = Convert.ToBoolean(row["IsRead"]),
                        NotificationBody = row["NotificationBody"].ToString(),
                        NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        NotificationType = Convert.ToInt32(row["NotificationType"])
                    };
                }).ToList();

                SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), user.DeviceID);
                /**************************/
            }

        }
        #endregion

        #region Posts
        const int PostsPageSize = 50;
        const int CommentsPageSize = 20;
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetPosts(int UserID, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.GetPostByUserID(UserID);
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboPostLike
                        {
                            ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboComment
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            ComboUserName = r["UserName"].ToString(),
                            ProfilePic = r["ProfilePic"].ToString(),
                            CommentText = r["CommentText"].ToString(),
                            CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        };
                    }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);

                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();


                    // get user mention 
                    CommentUserTag CommentuserTags = new CommentUserTag();
                    CommentuserTags.GetUserTagsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentUserTag
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    CommentHashTag Commenthastags = new CommentHashTag();
                    Commenthastags.GetHashTagsByCommnetID(_itemcomm.ComboCommentID);
                    _itemcomm.HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();

                // get user mention 
                PostUserTag userTags = new PostUserTag();
                userTags.GetUserTagsByPostID(item.ComboPostID);
                item.UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostUserTag
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        UserName = r["Username"].ToString(),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();

                // get hashtags 
                PostHashTag hastags = new PostHashTag();
                hastags.GetHashTagsByPostID(item.ComboPostID);
                item.HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostHashTag
                    {
                        HashTagID = Convert.ToInt32(r["HashTagID"]),
                        TagName = r["Name"].ToString(),                        
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();
            }

            _response.Entity = Posts;
            SetContentResult(_response);

            // calculate user rank in another thread
            // and send notifications with followers birthday 
            ThreadPool.QueueUserWorkItem(delegate
            {
                if (AddActivityLog(UserID, DateTime.Now.Date))
                {
                    SendFollowersBirthdaysNotifications(UserID);
                    UpdateUserRank(UserID);
                }
            });

            //return _response;

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetUserPosts(int UserID, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.GetUserPostByUserID(UserID);
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboPostLike
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        UserName = r["UserName"].ToString(),
                    };
                }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();

                    // get user mention 
                    CommentUserTag CommentuserTags = new CommentUserTag();
                    CommentuserTags.GetUserTagsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentUserTag
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    CommentHashTag Commenthastags = new CommentHashTag();
                    Commenthastags.GetHashTagsByCommnetID(_itemcomm.ComboCommentID);
                    _itemcomm.HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();


                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();


                // get user mention 
                PostUserTag userTags = new PostUserTag();
                userTags.GetUserTagsByPostID(item.ComboPostID);
                item.UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostUserTag
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        UserName = r["Username"].ToString(),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();

                // get hashtags 
                PostHashTag hastags = new PostHashTag();
                hastags.GetHashTagsByPostID(item.ComboPostID);
                item.HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostHashTag
                    {
                        HashTagID = Convert.ToInt32(r["HashTagID"]),
                        TagName = r["Name"].ToString(),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();
            }

            _response.Entity = Posts;
            SetContentResult(_response);
            //return _response;

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void ExplorePosts(int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.ExplorePosts();
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboPostLike
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        UserName = r["UserName"].ToString(),
                    };
                }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();

                    // get user mention 
                    CommentUserTag CommentuserTags = new CommentUserTag();
                    CommentuserTags.GetUserTagsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentUserTag
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    CommentHashTag Commenthastags = new CommentHashTag();
                    Commenthastags.GetHashTagsByCommnetID(_itemcomm.ComboCommentID);
                    _itemcomm.HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();

                // get user mention 
                PostUserTag userTags = new PostUserTag();
                userTags.GetUserTagsByPostID(item.ComboPostID);
                item.UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostUserTag
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        UserName = r["Username"].ToString(),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();

                // get hashtags 
                PostHashTag hastags = new PostHashTag();
                hastags.GetHashTagsByPostID(item.ComboPostID);
                item.HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostHashTag
                    {
                        HashTagID = Convert.ToInt32(r["HashTagID"]),
                        TagName = r["Name"].ToString(),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();
            }

            _response.Entity = Posts;
            SetContentResult(_response);
            //return _response;

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void SearchPosts(string filterText, int requester,int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.SearchPosts(filterText, requester);
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboPostLike
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        UserName = r["UserName"].ToString(),
                    };
                }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();


                    // get user mention 
                    CommentUserTag CommentuserTags = new CommentUserTag();
                    CommentuserTags.GetUserTagsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentUserTag
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    CommentHashTag Commenthastags = new CommentHashTag();
                    Commenthastags.GetHashTagsByCommnetID(_itemcomm.ComboCommentID);
                    _itemcomm.HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();

                // get user mention 
                PostUserTag userTags = new PostUserTag();
                userTags.GetUserTagsByPostID(item.ComboPostID);
                item.UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostUserTag
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        UserName = r["Username"].ToString(),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();

                // get hashtags 
                PostHashTag hastags = new PostHashTag();
                hastags.GetHashTagsByPostID(item.ComboPostID);
                item.HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostHashTag
                    {
                        HashTagID = Convert.ToInt32(r["HashTagID"]),
                        TagName = r["Name"].ToString(),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();
            }

            _response.Entity = Posts;
            SetContentResult(_response);
            //return _response;

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetPhotoPosts(int UserID, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.GetPhotoPostsByUserID(UserID);
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboPostLike
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        UserName = r["UserName"].ToString(),
                    };
                }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();

                    // get user mention 
                    CommentUserTag CommentuserTags = new CommentUserTag();
                    CommentuserTags.GetUserTagsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentUserTag
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    CommentHashTag Commenthastags = new CommentHashTag();
                    Commenthastags.GetHashTagsByCommnetID(_itemcomm.ComboCommentID);
                    _itemcomm.HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();

                // get user mention 
                PostUserTag userTags = new PostUserTag();
                userTags.GetUserTagsByPostID(item.ComboPostID);
                item.UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostUserTag
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        UserName = r["Username"].ToString(),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();

                // get hashtags 
                PostHashTag hastags = new PostHashTag();
                hastags.GetHashTagsByPostID(item.ComboPostID);
                item.HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostHashTag
                    {
                        HashTagID = Convert.ToInt32(r["HashTagID"]),
                        TagName = r["Name"].ToString(),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();
            }

            _response.Entity = Posts;
            SetContentResult(_response);
            //return _response;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetAudioPosts(int UserID, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.GetAudioPostsByUserID(UserID);
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboPostLike
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        UserName = r["UserName"].ToString(),
                    };
                }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();

                    // get user mention 
                    CommentUserTag CommentuserTags = new CommentUserTag();
                    CommentuserTags.GetUserTagsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentUserTag
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    CommentHashTag Commenthastags = new CommentHashTag();
                    Commenthastags.GetHashTagsByCommnetID(_itemcomm.ComboCommentID);
                    _itemcomm.HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();

                // get user mention 
                PostUserTag userTags = new PostUserTag();
                userTags.GetUserTagsByPostID(item.ComboPostID);
                item.UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostUserTag
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        UserName = r["Username"].ToString(),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();

                // get hashtags 
                PostHashTag hastags = new PostHashTag();
                hastags.GetHashTagsByPostID(item.ComboPostID);
                item.HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostHashTag
                    {
                        HashTagID = Convert.ToInt32(r["HashTagID"]),
                        TagName = r["Name"].ToString(),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();
            }

            _response.Entity = Posts;
            SetContentResult(_response);
            //return _response;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetVedioPosts(int UserID, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.GetVedioPostsByUserID(UserID);
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboPostLike
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        UserName = r["UserName"].ToString(),
                    };
                }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();

                    // get user mention 
                    CommentUserTag CommentuserTags = new CommentUserTag();
                    CommentuserTags.GetUserTagsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentUserTag
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    CommentHashTag Commenthastags = new CommentHashTag();
                    Commenthastags.GetHashTagsByCommnetID(_itemcomm.ComboCommentID);
                    _itemcomm.HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();

                // get user mention 
                PostUserTag userTags = new PostUserTag();
                userTags.GetUserTagsByPostID(item.ComboPostID);
                item.UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostUserTag
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        UserName = r["Username"].ToString(),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();

                // get hashtags 
                PostHashTag hastags = new PostHashTag();
                hastags.GetHashTagsByPostID(item.ComboPostID);
                item.HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostHashTag
                    {
                        HashTagID = Convert.ToInt32(r["HashTagID"]),
                        TagName = r["Name"].ToString(),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();
            }

            _response.Entity = Posts;
            SetContentResult(_response);
            //return _response;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetTextPosts(int UserID, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.GetTextPostsByUserID(UserID);
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboPostLike
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        UserName = r["UserName"].ToString(),
                    };
                }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();

                    // get user mention 
                    CommentUserTag CommentuserTags = new CommentUserTag();
                    CommentuserTags.GetUserTagsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentUserTag
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    CommentHashTag Commenthastags = new CommentHashTag();
                    Commenthastags.GetHashTagsByCommnetID(_itemcomm.ComboCommentID);
                    _itemcomm.HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();

                // get user mention 
                PostUserTag userTags = new PostUserTag();
                userTags.GetUserTagsByPostID(item.ComboPostID);
                item.UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostUserTag
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        UserName = r["Username"].ToString(),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();

                // get hashtags 
                PostHashTag hastags = new PostHashTag();
                hastags.GetHashTagsByPostID(item.ComboPostID);
                item.HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostHashTag
                    {
                        HashTagID = Convert.ToInt32(r["HashTagID"]),
                        TagName = r["Name"].ToString(),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();
            }

            _response.Entity = Posts;
            SetContentResult(_response);
            //return _response;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetLikedPosts(int UserID, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.GetLikedPostByUserID(UserID);
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboPostLike
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        UserName = r["UserName"].ToString(),
                    };
                }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();

                    // get user mention 
                    CommentUserTag CommentuserTags = new CommentUserTag();
                    CommentuserTags.GetUserTagsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentUserTag
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    CommentHashTag Commenthastags = new CommentHashTag();
                    Commenthastags.GetHashTagsByCommnetID(_itemcomm.ComboCommentID);
                    _itemcomm.HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();

                // get user mention 
                PostUserTag userTags = new PostUserTag();
                userTags.GetUserTagsByPostID(item.ComboPostID);
                item.UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostUserTag
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        UserName = r["Username"].ToString(),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();

                // get hashtags 
                PostHashTag hastags = new PostHashTag();
                hastags.GetHashTagsByPostID(item.ComboPostID);
                item.HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostHashTag
                    {
                        HashTagID = Convert.ToInt32(r["HashTagID"]),
                        TagName = r["Name"].ToString(),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();
            }

            _response.Entity = Posts;
            SetContentResult(_response);
            //return _response;

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get Post By ID
        /// </summary>
        /// <param name="ID">ID of Post</param>
        /// <returns>ComboResponse object with requested Post object </returns>
        public void GetPostByID(int id, int CommentPage)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost post = new ComboPost();
            post.GetPostByID(id);
            ComboPostLike likes = new ComboPostLike();
            ComboPostAttachment attachments = new ComboPostAttachment();
            ComboComment comments = new ComboComment();

            likes.GetPostLikesByPostID(post.ComboPostID);
            attachments.GetPostAttachmentsByPostID(post.ComboPostID);
            comments.GetPostCommentsByPostID(post.ComboPostID);

            PostUserTag userTags = new PostUserTag();
            userTags.GetUserTagsByPostID(post.ComboPostID);

            PostHashTag hastags = new PostHashTag();
            hastags.GetHashTagsByPostID(post.ComboPostID);

            ComboComment totalCount = new ComboComment();
            totalCount.GetPostCommentsCount(post.ComboPostID);

            ComboPostShare shareCount = new ComboPostShare();
            shareCount.GetPostShareCount(post.ComboPostID);

            
            
            List<Models.ComboPost> Post = post.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"]),
                    CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount")),
                    ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount")),
                    Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboPostLike
                        {
                            ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList(),
                    // get top 20 comment for post
                    Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboComment
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            ComboUserName = r["UserName"].ToString(),
                            ProfilePic = r["ProfilePic"].ToString(),
                            CommentText = r["CommentText"].ToString(),
                            CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        };
                    }).Skip(CommentPage * CommentsPageSize).Take(CommentsPageSize).ToList(),
                    Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList(),

                    // get user mention 

                    UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.PostUserTag
                        {
                            ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList(),

                    // get hashtags 

                    HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.PostHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList()

                };
            }).ToList();

            foreach (Models.ComboPost item in Post)
            {
                List<Models.ComboComment> comm = (List<Models.ComboComment>)item.Comments;
                for (int i = 0; i < comm.Count;i++ )
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(comm[i].ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(comm[i].ComboCommentID);
                    comm[i].Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    comm[i].Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();

                    // get user mention 
                    CommentUserTag CommentuserTags = new CommentUserTag();
                    CommentuserTags.GetUserTagsByCommentID(comm[i].ComboCommentID);
                    comm[i].UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentUserTag
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    CommentHashTag Commenthastags = new CommentHashTag();
                    Commenthastags.GetHashTagsByCommnetID(comm[i].ComboCommentID);
                    comm[i].HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();
                }
                
            }
            _response.Entity = Post;
            SetContentResult(_response);

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetPostsByHashTagName(string TagName,int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            HashTag tag = new HashTag();
            tag.GetHashTagByName(TagName);
            if (tag.RowCount > 0)
            {
                ComboPost posts = new ComboPost();
                posts.GetPostsByHashTagID(tag.HashTagID);
                List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboPost
                    {
                        ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        ComboUserName = row["UserName"].ToString(),
                        ProfilePic = row["ProfilePic"].ToString(),
                        PostText = row["PostText"].ToString(),
                        PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                    };
                }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


                foreach (Models.ComboPost item in Posts)
                {
                    ComboPostLike likes = new ComboPostLike();
                    likes.GetPostLikesByPostID(item.ComboPostID);
                    item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboPostLike
                        {
                            ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();

                    ComboComment totalCount = new ComboComment();
                    totalCount.GetPostCommentsCount(item.ComboPostID);

                    item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                    ComboPostShare shareCount = new ComboPostShare();
                    shareCount.GetPostShareCount(item.ComboPostID);

                    item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                    ComboComment comments = new ComboComment();
                    comments.GetTopPostCommentsByPostID(item.ComboPostID);
                    // get top 3 comments for each post
                    item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboComment
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            ComboUserName = r["UserName"].ToString(),
                            ProfilePic = r["ProfilePic"].ToString(),
                            CommentText = r["CommentText"].ToString(),
                            CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        };
                    }).ToList();

                    List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                    foreach (Models.ComboComment _itemcomm in _comm)
                    {
                        ComboCommentLike c_likes = new ComboCommentLike();
                        ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                        c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                        c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                        _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                        {
                            return new Models.ComboCommentLike
                            {
                                ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                                ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                                UserName = r["UserName"].ToString(),
                            };
                        }).ToList();
                        _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                        {
                            return new Models.Attachment
                            {
                                AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                                Path = r["Path"].ToString(),
                                AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                                ThumbsPath = r["ThumbsPath"].ToString()
                            };
                        }).ToList();

                        // get user mention 
                        CommentUserTag CommentuserTags = new CommentUserTag();
                        CommentuserTags.GetUserTagsByCommentID(_itemcomm.ComboCommentID);
                        _itemcomm.UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                        {
                            return new Models.CommentUserTag
                            {
                                ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                                UserName = r["Username"].ToString(),
                                ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                                Offset = Convert.ToInt32(r["Offset"])
                            };
                        }).ToList();

                        // get hashtags 
                        CommentHashTag Commenthastags = new CommentHashTag();
                        Commenthastags.GetHashTagsByCommnetID(_itemcomm.ComboCommentID);
                        _itemcomm.HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                        {
                            return new Models.CommentHashTag
                            {
                                HashTagID = Convert.ToInt32(r["HashTagID"]),
                                TagName = r["Name"].ToString(),
                                Offset = Convert.ToInt32(r["Offset"])
                            };
                        }).ToList();
                    }

                    item.Comments = _comm;

                    ComboPostAttachment attachments = new ComboPostAttachment();
                    attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                    item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();

                    // get user mention 
                    PostUserTag userTags = new PostUserTag();
                    userTags.GetUserTagsByPostID(item.ComboPostID);
                    item.UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.PostUserTag
                        {
                            ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    PostHashTag hastags = new PostHashTag();
                    hastags.GetHashTagsByPostID(item.ComboPostID);
                    item.HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.PostHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();
                }

                _response.Entity = Posts;
            }
            else
                _response.Entity = null;
            SetContentResult(_response);
            //return _response;

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetPostsByHashTagID(int TagID, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            
            ComboPost posts = new ComboPost();
            posts.GetPostsByHashTagID(TagID);
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboPostLike
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        UserName = r["UserName"].ToString(),
                    };
                }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();

                    // get user mention 
                    CommentUserTag CommentuserTags = new CommentUserTag();
                    CommentuserTags.GetUserTagsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.UserTags = CommentuserTags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentUserTag
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            UserName = r["Username"].ToString(),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();

                    // get hashtags 
                    CommentHashTag Commenthastags = new CommentHashTag();
                    Commenthastags.GetHashTagsByCommnetID(_itemcomm.ComboCommentID);
                    _itemcomm.HashTags = Commenthastags.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.CommentHashTag
                        {
                            HashTagID = Convert.ToInt32(r["HashTagID"]),
                            TagName = r["Name"].ToString(),
                            Offset = Convert.ToInt32(r["Offset"])
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();

                // get user mention 
                PostUserTag userTags = new PostUserTag();
                userTags.GetUserTagsByPostID(item.ComboPostID);
                item.UserTags = userTags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostUserTag
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        UserName = r["Username"].ToString(),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();

                // get hashtags 
                PostHashTag hastags = new PostHashTag();
                hastags.GetHashTagsByPostID(item.ComboPostID);
                item.HashTags = hastags.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.PostHashTag
                    {
                        HashTagID = Convert.ToInt32(r["HashTagID"]),
                        TagName = r["Name"].ToString(),
                        Offset = Convert.ToInt32(r["Offset"])
                    };
                }).ToList();
            }

            _response.Entity = Posts;           
            SetContentResult(_response);
            //return _response;

        }



        [WebMethod]
        /// <summary>
        /// Add Combo post to db
        /// </summary>
        /// <param name="user">Combo post object to be added</param>
        /// <returns>ComboResponse object with Added post object</returns>
        public void AddPost(Models.ComboPost post)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            BLL.ComboPost newPost = new ComboPost();            
            newPost.AddNew();

            if (post.ComboUserID != 0)
                newPost.ComboUserID = post.ComboUserID;
            else
            {
                _response.ErrorCode = 30;
                _response.ErrorMsg = "Can't insert post. No user id .";
                _response.bool_result = false;
                SetContentResult(_response);
                return;
            }
            
            newPost.PostText = post.PostText.Replace("\n"," ");
            newPost.PostDate = DateTime.UtcNow;
                        
            newPost.Save();

            JavaScriptSerializer js = new JavaScriptSerializer();
            Models.Attachment[] att = js.Deserialize<Models.Attachment[]>(js.Serialize(post.Attachments));
            if (att != null)
            {
                ComboPostAttachment attachment = new ComboPostAttachment();
                foreach (Models.Attachment item in att)
                {
                    attachment.AddNew();
                    attachment.AttachmentID = item.AttachmentID;
                    attachment.ComboPostID = newPost.ComboPostID;

                }
                attachment.Save();
            }

            ComboPostAttachment notificationAtt = new ComboPostAttachment();
            notificationAtt.GetPostAttachmentsByPostID(newPost.ComboPostID);

            Models.PostUserTag[] userTags = js.Deserialize<Models.PostUserTag[]>(js.Serialize(post.UserTags));
            if (userTags != null)
            {
                PostUserTag usertag = new PostUserTag();
                foreach (Models.PostUserTag item in userTags)
                {
                    usertag.AddNew();
                    usertag.ComboUserID = item.ComboUserID;
                    usertag.ComboPostID = newPost.ComboPostID;
                    usertag.Offset = item.Offset;

                    
                    /**************************/
                    // save notification and push it to device                     
                    ComboUser creator = new ComboUser();
                    ComboUser tagged = new ComboUser();
                    creator.GetUserByUserId(newPost.ComboUserID);
                    tagged.GetUserByUserId(item.ComboUserID);                    
                    List<Models.PostUserTag> postTag = new List<Models.PostUserTag>();
                    postTag.Add(new Models.PostUserTag
                    {
                        ComboPostID = newPost.ComboPostID,
                        CreatorUserName = creator.UserName,
                        CreatorProfilePic = creator.GetColumn("ProfilePic").ToString(),
                        ComboUserID = tagged.ComboUserID,
                        UserName = tagged.UserName,
                        ProfilePic = tagged.GetColumn("ProfilePic").ToString(),
                        PostText = newPost.PostText,
                        Offset = item.Offset,
                        Attachments = notificationAtt.DefaultView.Table.AsEnumerable().Select(r =>
                        {
                            return new Models.Attachment
                            {
                                AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                                Path = r["Path"].ToString(),
                                AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                                ThumbsPath = r["ThumbsPath"].ToString()
                            };
                        }).ToList(),
                    });
                    
                    ComboNotification notification = new ComboNotification();
                    notification.AddNew();
                    notification.ComboUserID = tagged.ComboUserID;
                    notification.NotificationType = (int)Combo.Models.NotificationType.TAG_USER_IN_POST; // tag user to post 
                    notification.NotificationDate = DateTime.UtcNow;
                    notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(postTag);
                    notification.IsRead = false;
                    notification.Save();

                    NotificationUserSettings settings = new NotificationUserSettings();
                    settings.LoadByPrimaryKey(tagged.ComboUserID, (int)Combo.Models.NotificationType.TAG_USER_IN_POST);
                    bool notify = false;
                    if (settings.RowCount == 0)
                        notify = true;
                    else
                        notify = settings.CanGetNotification(item.ComboUserID, newPost.ComboUserID, (int)Combo.Models.NotificationType.TAG_USER_IN_POST);
                    if (notify)
                    {
                        List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                        {
                            return new Models.ComboNotification
                            {
                                ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                                ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                                IsRead = Convert.ToBoolean(row["IsRead"]),
                                NotificationBody = row["NotificationBody"].ToString(),
                                NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                                NotificationType = Convert.ToInt32(row["NotificationType"])
                            };
                        }).ToList();

                        SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), tagged.DeviceID);
                    }
                    /**************************/

                }
                usertag.Save();
            }


            Models.PostHashTag[] hashTags = js.Deserialize<Models.PostHashTag[]>(js.Serialize(post.HashTags));
            if (hashTags != null)
            {
                PostHashTag posthashtag = new PostHashTag();
                
                foreach (Models.PostHashTag item in hashTags)
                {
                    HashTag currenttag = new HashTag();
                    
                    if (!currenttag.GetHashTagByName(item.TagName))
                    {
                        currenttag.AddNew();
                        currenttag.Name = item.TagName;
                        currenttag.Save();                        
                    }
                    
                    posthashtag.AddNew();
                    posthashtag.HashTagID = currenttag.HashTagID;
                    posthashtag.ComboPostID = newPost.ComboPostID;
                    posthashtag.Offset = item.Offset;
                }
                posthashtag.Save(); 
            }

            post.ComboPostID = newPost.ComboPostID;
            post.PostDate = newPost.PostDate.Subtract(new DateTime(1970, 1, 1)).TotalSeconds;
            _response.Entity = new Models.ComboPost[] { post };

            SetContentResult(_response);
            return;
        }

        [WebMethod]
        /// <summary>
        /// Update Combo user to db
        /// </summary>
        /// <param name="user">Combo user object to be added</param>
        /// <returns>ComboResponse object with updated User object</returns>
        public void UpdatePost(Models.ComboPost post)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            BLL.ComboPost newPost = new ComboPost();
            newPost.LoadByPrimaryKey(post.ComboPostID);
            newPost.PostText = post.PostText.Replace("\n", " "); ;
            newPost.PostDate = DateTime.UtcNow;
            newPost.Save();

            JavaScriptSerializer js = new JavaScriptSerializer();
            Models.Attachment[] att = js.Deserialize<Models.Attachment[]>(js.Serialize(post.Attachments));

            ComboPostAttachment attachment = new ComboPostAttachment();
            foreach (Models.Attachment item in att)
            {
                try
                {
                    attachment.AddNew();
                    attachment.AttachmentID = item.AttachmentID;
                    attachment.ComboPostID = newPost.ComboPostID;
                    attachment.Save(); 
                }
                catch (Exception ex)
                {
                    
                }

            }

            post.PostDate = newPost.PostDate.Subtract(new DateTime(1970, 1, 1)).TotalSeconds;
            _response.Entity = new Models.ComboPost[] { post };

            SetContentResult(_response);
            return;
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Delete Post By ID
        /// </summary>
        /// <param name="ID">ID of Post</param>
        /// <returns>ComboResponse object </returns>
        public void DeletePost(int id)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost post = new ComboPost();
            post.LoadByPrimaryKey(id);
            post.IsDeleted = true;
            post.Save();
            _response.Entity = null;
            SetContentResult(_response);

        }       

        [WebMethod]
        /// <summary>
        /// Toggle Like Post By ID
        /// </summary>
        /// <param name="ID">ID of Post</param>
        /// <param name="ID">userid of user</param>
        /// <returns>ComboResponse object with total likes  </returns>
        public void ToggleLikePostByID(int id,int userid)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPostAttachment att = new ComboPostAttachment();
            att.GetPostAttachmentsByPostID(id);
            
            ComboPostLike likes = new ComboPostLike();
            if (!likes.LoadByPrimaryKey(userid, id))
            {
                likes.AddNew();
                likes.ComboPostID = id;
                likes.ComboUserID = userid;
                likes.Save();
                
                // save notification and push it to device 
                ComboPost post = new ComboPost();
                post.LoadByPrimaryKey(id);
                ComboUser creator = new ComboUser();
                ComboUser liker = new ComboUser();
                creator.LoadByPrimaryKey(post.ComboUserID);
                liker.GetUserByUserId(userid);
                if (creator.ComboUserID != liker.ComboUserID)
                {
                    List<Models.ComboPostLike> alike = likes.DefaultView.Table.AsEnumerable().Select(row =>
                        {
                            return new Models.ComboPostLike
                            {
                                ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                                ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                                UserName = liker.UserName,
                                DisplayName = liker.DisplayName,
                                PostText = post.PostText,
                                ProfilePic = liker.GetColumn("ProfilePic").ToString(),
                                Attachments = att.DefaultView.Table.AsEnumerable().Select(r =>
                                {
                                    return new Models.Attachment
                                    {
                                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                                        Path = r["Path"].ToString(),
                                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                                        ThumbsPath = r["ThumbsPath"].ToString()
                                    };
                                }).ToList(),
                            };
                        }).ToList();

                    ComboNotification notification = new ComboNotification();
                    notification.AddNew();
                    notification.ComboUserID = post.ComboUserID;
                    notification.NotificationType = (int)Combo.Models.NotificationType.LIKE; // like 
                    notification.NotificationDate = DateTime.UtcNow;
                    notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(alike);
                    notification.IsRead = false;
                    notification.Save();

                    NotificationUserSettings settings = new NotificationUserSettings();
                    settings.LoadByPrimaryKey(creator.ComboUserID, (int)Combo.Models.NotificationType.LIKE);
                    bool notify = false;
                    if (settings.RowCount == 0)
                        notify = true;
                    else
                        notify = settings.CanGetNotification(creator.ComboUserID, liker.ComboUserID, (int)Combo.Models.NotificationType.LIKE);
                    if (notify)
                    {
                        List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                            {
                                return new Models.ComboNotification
                                {
                                    ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                                    IsRead = Convert.ToBoolean(row["IsRead"]),
                                    NotificationBody = row["NotificationBody"].ToString(),
                                    NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                                    NotificationType = Convert.ToInt32(row["NotificationType"])
                                };
                            }
                            ).ToList();

                        string notification_response = SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), creator.DeviceID);
                    }
                }
            }
            else
            {
                likes.MarkAsDeleted();
                likes.Save();
            }

            likes.GetPostLikesByPostID(id);
                        
            List<Models.ComboPostLike> Alllikes = likes.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPostLike
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    UserName = row["UserName"].ToString(),
                    DisplayName = row["DisplayName"].ToString(),
                };
            }).ToList();


            _response.Entity = Alllikes;
            SetContentResult(_response);

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetFollowingPosts(int UserID, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.GetFollowingPostsByUserID(UserID);
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboPostLike
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        UserName = r["UserName"].ToString(),
                    };
                }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();
            }

            _response.Entity = Posts;
            SetContentResult(_response);
            //return _response;

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetFriendsPosts(int UserID, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.GetFriendsPostsByUserID(UserID);
            List<Models.ComboPost> Posts = posts.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    IsDownloadable = (row["IsPostsDownloadable"] == DBNull.Value) ? false : Convert.ToBoolean(row["IsPostsDownloadable"])
                };
            }).Skip(Page * PostsPageSize).Take(PostsPageSize).ToList();


            foreach (Models.ComboPost item in Posts)
            {
                ComboPostLike likes = new ComboPostLike();
                likes.GetPostLikesByPostID(item.ComboPostID);
                item.Likes = likes.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboPostLike
                    {
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        UserName = r["UserName"].ToString(),
                    };
                }).ToList();

                ComboComment totalCount = new ComboComment();
                totalCount.GetPostCommentsCount(item.ComboPostID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboPostShare shareCount = new ComboPostShare();
                shareCount.GetPostShareCount(item.ComboPostID);

                item.ShareCount = Convert.ToInt32(shareCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopPostCommentsByPostID(item.ComboPostID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboPostID = Convert.ToInt32(r["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    ComboCommentLike c_likes = new ComboCommentLike();
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    c_likes.GetCommentLikesByCommentID(_itemcomm.ComboCommentID);
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    _itemcomm.Likes = c_likes.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.ComboCommentLike
                        {
                            ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                            ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                            UserName = r["UserName"].ToString(),
                        };
                    }).ToList();
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboPostAttachment attachments = new ComboPostAttachment();
                attachments.GetPostAttachmentsByPostID(item.ComboPostID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();
            }

            _response.Entity = Posts;
            SetContentResult(_response);
            //return _response;

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Report Post By ID
        /// </summary>
        /// <param name="ID">ID of Post</param>
        /// <returns>ComboResponse object </returns>
        public void ReportPost(int id, string description)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPostReport post = new ComboPostReport();
            post.AddNew();
            post.ComboPostID = id;
            post.ReportDate = DateTime.UtcNow;
            post.ReportText = description;
            post.Save();

            _response.Entity = null;
            SetContentResult(_response);

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Report Post By ID
        /// </summary>
        /// <param name="ID">ID of Post</param>
        /// <returns>ComboResponse object </returns>
        public void SharePost(int PostId, int UserId)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPostShare post = new ComboPostShare();
            post.AddNew();
            post.ComboPostID = PostId;
            post.ShareDate = DateTime.UtcNow;
            post.ComboUserID = UserId;
            post.Save();

            /**************************/
            // save notification and push it to device  
            ComboPost ref_post = new ComboPost();
            ref_post.LoadByPrimaryKey(PostId);

            ComboPostAttachment att = new ComboPostAttachment();
            att.GetPostAttachmentsByPostID(PostId);

            ComboUser creator = new ComboUser();
            ComboUser requester = new ComboUser();
            creator.LoadByPrimaryKey(ref_post.ComboUserID);
            requester.LoadByPrimaryKey(UserId);
            if (creator.ComboUserID != requester.ComboUserID)
            {
                List<Models.ComboSharePost> info = post.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboSharePost
                    {
                        ComboFriendID = requester.ComboUserID,
                        ComboUserID = creator.ComboUserID,
                        ComboUserName = creator.UserName,
                        ComboFriendName = requester.UserName,
                        ComboFriendDisplayName = requester.DisplayName,
                        ComboPostID = Convert.ToInt32(row["ComboPostID"].ToString()),
                        PostText = ref_post.PostText,
                        Attachments = att.DefaultView.Table.AsEnumerable().Select(r =>
                        {
                            return new Models.Attachment
                            {
                                AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                                Path = r["Path"].ToString(),
                                AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                                ThumbsPath = r["ThumbsPath"].ToString()
                            };
                        }).ToList(),
                    };
                }).ToList();

                ComboNotification notification = new ComboNotification();
                notification.AddNew();
                notification.ComboUserID = creator.ComboUserID;
                notification.NotificationType = (int)Combo.Models.NotificationType.SHARE_POST; // share post
                notification.NotificationDate = DateTime.UtcNow;
                notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(info);
                notification.IsRead = false;
                notification.Save();

                NotificationUserSettings settings = new NotificationUserSettings();
                settings.LoadByPrimaryKey(creator.ComboUserID, (int)Combo.Models.NotificationType.SHARE_POST);
                bool notify = false;
                if (settings.RowCount == 0)
                    notify = true;
                else
                    notify = settings.CanGetNotification(creator.ComboUserID, requester.ComboUserID, (int)Combo.Models.NotificationType.SHARE_POST);
                if (notify)
                {
                    List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                    {
                        return new Models.ComboNotification
                        {
                            ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                            ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                            IsRead = Convert.ToBoolean(row["IsRead"]),
                            NotificationBody = row["NotificationBody"].ToString(),
                            NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                            NotificationType = Convert.ToInt32(row["NotificationType"])
                        };
                    }).ToList();

                    SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), creator.DeviceID);
                }
            }
            /**************************/


            _response.Entity = null;
            SetContentResult(_response);

        }       

       
        #endregion

        #region Comments
        [WebMethod]
        /// <summary>
        /// Add Combo commnet to db
        /// </summary>
        /// <param name="user">Combo comment object to be added</param>
        /// <returns>ComboResponse object with Added comment object</returns>
        public void AddComment(Models.ComboComment comment)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            BLL.ComboComment newComment = new ComboComment();
            newComment.AddNew();

            if (comment.ComboUserID != 0)
                newComment.ComboUserID = comment.ComboUserID;
            else
            {
                _response.ErrorCode = 30;
                _response.ErrorMsg = "Can't insert commnet. No user id .";
                _response.bool_result = false;
                SetContentResult(_response);
                return;
            }

            if (comment.ComboPostID != 0)
                newComment.ComboPostID = comment.ComboPostID;
            else
            {
                _response.ErrorCode = 31;
                _response.ErrorMsg = "Can't insert comment. No post id .";
                _response.bool_result = false;
                SetContentResult(_response);
                return;
            }

            newComment.CommentText = comment.CommentText.Replace("\n", " "); ;
            newComment.CommentDate = DateTime.UtcNow;

            newComment.Save();

            JavaScriptSerializer js = new JavaScriptSerializer();
            Models.Attachment[] att = js.Deserialize<Models.Attachment[]>(js.Serialize(comment.Attachments));
            if (att != null)
            {
                ComboCommentAttachment attachment = new ComboCommentAttachment();
                foreach (Models.Attachment item in att)
                {
                    attachment.AddNew();
                    attachment.AttachmentID = item.AttachmentID;
                    attachment.ComboCommnetID = newComment.ComboCommentID;

                }
                attachment.Save();
            }

            ComboCommentAttachment notificationAtt = new ComboCommentAttachment ();
            notificationAtt.GetCommentAttachmentsByCommentID(newComment.ComboCommentID);

            Models.CommentUserTag[] userTags = js.Deserialize<Models.CommentUserTag[]>(js.Serialize(comment.UserTags));
            if (userTags != null)
            {
                CommentUserTag usertag = new CommentUserTag();
                foreach (Models.CommentUserTag item in userTags)
                {
                    usertag.AddNew();
                    usertag.ComboUserID = item.ComboUserID;
                    usertag.ComboCommentID = newComment.ComboCommentID;
                    usertag.Offset = item.Offset;


                    /**************************/
                    // save notification and push it to device                     
                    ComboUser commentcreator = new ComboUser();
                    ComboUser tagged = new ComboUser();
                    commentcreator.GetUserByUserId(newComment.ComboUserID);
                    tagged.GetUserByUserId(item.ComboUserID);
                    List<Models.CommentUserTag> postTag = new List<Models.CommentUserTag>();
                    postTag.Add(new Models.CommentUserTag
                    {
                        ComboCommentID = newComment.ComboCommentID,
                        ComboUserID = tagged.ComboUserID,
                        UserName = tagged.UserName,
                        Offset = item.Offset,
                        ComboPostID = newComment.ComboPostID,
                        CreatorUserID = commentcreator.ComboUserID,
                        CreatorUserName= commentcreator.UserName,
                        CreatorProfilePic = commentcreator.GetColumn("ProfilePic").ToString(),
                        CommentText = newComment.CommentText,
                        Attachments = notificationAtt.DefaultView.Table.AsEnumerable().Select(r =>
                        {
                            return new Models.Attachment
                            {
                                AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                                Path = r["Path"].ToString(),
                                AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                                ThumbsPath = r["ThumbsPath"].ToString()
                            };
                        }).ToList(),
                    });

                    ComboNotification notification = new ComboNotification();
                    notification.AddNew();
                    notification.ComboUserID = tagged.ComboUserID;
                    notification.NotificationType = (int)Combo.Models.NotificationType.TAG_USER_IN_POST; // tag user to post 
                    notification.NotificationDate = DateTime.UtcNow;
                    notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(postTag);
                    notification.IsRead = false;
                    notification.Save();

                    NotificationUserSettings settings = new NotificationUserSettings();
                    settings.LoadByPrimaryKey(tagged.ComboUserID, (int)Combo.Models.NotificationType.TAG_USER_IN_POST);
                    bool notify = false;
                    if (settings.RowCount == 0)
                        notify = true;
                    else
                        notify = settings.CanGetNotification(tagged.ComboUserID, commentcreator.ComboUserID, (int)Combo.Models.NotificationType.TAG_USER_IN_POST);
                    if (notify)
                    {
                        List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                        {
                            return new Models.ComboNotification
                            {
                                ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                                ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                                IsRead = Convert.ToBoolean(row["IsRead"]),
                                NotificationBody = row["NotificationBody"].ToString(),
                                NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                                NotificationType = Convert.ToInt32(row["NotificationType"])
                            };
                        }).ToList();

                        SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), tagged.DeviceID);
                    }
                    /**************************/

                }
                usertag.Save();
            }


            Models.CommentHashTag[] hashTags = js.Deserialize<Models.CommentHashTag[]>(js.Serialize(comment.HashTags));
            if (hashTags != null)
            {
                CommentHashTag commentthashtag = new CommentHashTag();

                foreach (Models.CommentHashTag item in hashTags)
                {
                    HashTag currenttag = new HashTag();

                    if (!currenttag.GetHashTagByName(item.TagName))
                    {
                        currenttag.AddNew();
                        currenttag.Name = item.TagName;
                        currenttag.Save();
                    }

                    commentthashtag.AddNew();
                    commentthashtag.HashTagID = currenttag.HashTagID;
                    commentthashtag.ComboCommentID = newComment.ComboCommentID;
                    commentthashtag.Offset = item.Offset;
                }
                commentthashtag.Save();
            }


            /**************************/
            // save notification and push it to device 
            ComboPost post = new ComboPost();
            post.LoadByPrimaryKey(comment.ComboPostID);
            ComboUser creator = new ComboUser();
            ComboUser commentor = new ComboUser();
            ComboPostAttachment postatt = new ComboPostAttachment();
            postatt.GetPostAttachmentsByPostID(comment.ComboPostID);
            creator.GetUserByUserId(post.ComboUserID);
            commentor.GetUserByUserId(comment.ComboUserID);
            if (creator.ComboUserID != commentor.ComboUserID)
            {
                List<Models.ComboComment> acomment = newComment.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboComment
                    {
                        ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        ComboUserName = commentor.UserName,
                        ComboDisplayName = commentor.DisplayName,
                        CommentText = newComment.CommentText,
                        CommentDate = newComment.CommentDate.Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        ProfilePic = commentor.GetColumn("ProfilePic").ToString(),
                        PostAttachemnts = postatt.DefaultView.Table.AsEnumerable().Select(r =>
                        {
                            return new Models.Attachment
                            {
                                AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                                Path = r["Path"].ToString(),
                                AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                                ThumbsPath = r["ThumbsPath"].ToString()
                            };
                        }).ToList(),
                    };
                }).ToList();

                ComboNotification notification = new ComboNotification();
                notification.AddNew();
                notification.ComboUserID = post.ComboUserID;
                notification.NotificationType = (int)Combo.Models.NotificationType.COMMENT_ON_POST; // add comment to post 
                notification.NotificationDate = DateTime.UtcNow;
                notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(acomment);
                notification.IsRead = false;
                notification.Save();

                NotificationUserSettings settings = new NotificationUserSettings();
                settings.LoadByPrimaryKey(creator.ComboUserID, (int)Combo.Models.NotificationType.COMMENT_ON_POST);
                bool notify = false;
                if (settings.RowCount == 0)
                    notify = true;
                else
                    notify = settings.CanGetNotification(creator.ComboUserID, commentor.ComboUserID, (int)Combo.Models.NotificationType.COMMENT_ON_POST);
                if (notify)
                {
                    List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                    {
                        return new Models.ComboNotification
                        {
                            ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                            ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                            IsRead = Convert.ToBoolean(row["IsRead"]),
                            NotificationBody = row["NotificationBody"].ToString(),
                            NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                            NotificationType = Convert.ToInt32(row["NotificationType"])
                        };
                    }).ToList();

                    SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), creator.DeviceID);
                }
            }
            /**************************/

            comment.ComboCommentID = newComment.ComboCommentID;
            comment.CommentDate = newComment.CommentDate.Subtract(new DateTime(1970, 1, 1)).TotalSeconds;
            _response.Entity = new Models.ComboComment[] { comment };

            SetContentResult(_response);
            return;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Delete comment By ID
        /// </summary>
        /// <param name="ID">ID of comment</param>
        /// <returns>ComboResponse object </returns>
        public void DeleteCommnet(int id)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboComment comment = new ComboComment();
            comment.LoadByPrimaryKey(id);
            comment.IsDeleted = true;
            comment.Save();
            _response.Entity = null;
            SetContentResult(_response);

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Report Comment By ID
        /// </summary>
        /// <param name="ID">ID of comment</param>
        /// <returns>ComboResponse object </returns>
        public void ReportComment(int id, string description)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboCommentReport comment = new ComboCommentReport();
            comment.AddNew();
            comment.ComboCommentID = id;
            comment.ReportDate = DateTime.UtcNow;
            comment.ReportText = description;
            comment.Save();

            _response.Entity = null;
            SetContentResult(_response);

        }

        #endregion

        #region Followers
        const int FollowersPageSize = 20;
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo Users following user with specified id 
        /// </summary>
        /// <returns>ComboResponse object with List of all followers Users </returns>
        public void GetProfileFollowers(int userID, int pageIndex)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ProfileFollower user = new ProfileFollower();
            user.GetProfileFollowersByUserID(userID);
            List<Models.ComboUser> Users = user.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboUser
                {
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    UserName = row["UserName"].ToString(),
                    DisplayName = row["DisplayName"].ToString(),
                    Password = row["Password"].ToString(),
                    Email = row["Email"].ToString(),
                    Bio = row["Bio"].ToString(),
                    ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                    CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                    GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                    IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                    ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                    ExternalID = row["ExternalID"].ToString(),
                    DeviceID = row["DeviceID"].ToString(),
                    ActivationCode = row.IsNull("ActivationCode") ? Guid.Empty : new Guid(row["ActivationCode"].ToString()),
                    PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString()),                    
                    ProfilePic = row["ProfilePic"].ToString(),
                };
            }).Skip(pageIndex * FollowersPageSize).Take(FollowersPageSize).ToList();


            _response.Entity = Users;
            SetContentResult(_response);
            //return _response;

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo Users followed by user with specified id 
        /// </summary>
        /// <returns>ComboResponse object with List of all following Users </returns>
        public void GetProfileFollowing(int userID, int pageIndex)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ProfileFollower user = new ProfileFollower();
            user.GetProfileFollowingByUserID(userID);
            List<Models.ComboUser> Users = user.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboUser
                {
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    UserName = row["UserName"].ToString(),
                    DisplayName = row["DisplayName"].ToString(),
                    Password = row["Password"].ToString(),
                    Email = row["Email"].ToString(),
                    Bio = row["Bio"].ToString(),
                    ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                    CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                    GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                    IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                    ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                    ExternalID = row["ExternalID"].ToString(),
                    DeviceID = row["DeviceID"].ToString(),
                    ActivationCode = row.IsNull("ActivationCode") ? Guid.Empty : new Guid(row["ActivationCode"].ToString()),
                    PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString()),
                    ProfilePic = row["ProfilePic"].ToString(),
                };
            }).Skip(pageIndex * FollowersPageSize).Take(FollowersPageSize).ToList();


            _response.Entity = Users;
            SetContentResult(_response);
            //return _response;

        }

        [WebMethod]
        /// <summary>
        /// Toggle follow user 
        /// </summary>
        /// <param name="UserID">UserID to be followed</param>
        /// <param name="FollowerID">follower ID</param>
        /// <returns>ComboResponse object with result</returns>
        public void ToggleFollowFriend(int userId, int FollowerId)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";
            bool follow = false;

            ProfileFollower follower = new ProfileFollower();
            if (!follower.LoadByPrimaryKey(userId, FollowerId))
            {
                follower.AddNew();
                follower.ComboFollowerID = FollowerId;
                follower.ComboUserID = userId;
                follower.IsRequestApproved = true;
                follower.Save();
                follow = true;
            }
            else
            {
                follower.MarkAsDeleted();
                follower.Save();
            }


            /**************************/
            // save notification and push it to device             
            ComboUser creator = new ComboUser();
            ComboUser commentor = new ComboUser();
            creator.GetUserByUserId(userId);
            commentor.GetUserByUserId(FollowerId);

            List<Models.FollowRequest> arequest = follower.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.FollowRequest
                {
                    ComboFriendID = Convert.ToInt32(row["ComboFollowerID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = commentor.UserName,
                    ComboDisplayName = commentor.DisplayName,
                    ProfilePic= creator.GetColumn("ProfilePic").ToString(),
                    FriendProfilePic = commentor.GetColumn("ProfilePic").ToString(),
                    IsFollowUser = follow
                };
            }).ToList();

            ComboNotification notification = new ComboNotification();
            notification.AddNew();
            notification.ComboUserID = creator.ComboUserID;
            if (follow)
                notification.NotificationType = (int)Combo.Models.NotificationType.FOLLOW_FIREND; // follow friend
            else
                notification.NotificationType = (int)Combo.Models.NotificationType.UNFOLLOW_FRIEND; // unfollow friend
            notification.NotificationDate = DateTime.UtcNow;
            notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(arequest);
            notification.IsRead = false;
            notification.Save();

            NotificationUserSettings settings = new NotificationUserSettings();
            settings.LoadByPrimaryKey(creator.ComboUserID, (int)Combo.Models.NotificationType.FOLLOW_FIREND);
            bool notify = false;
            if (settings.RowCount == 0)
                notify = true;
            else
                notify = settings.CanGetNotification(creator.ComboUserID, commentor.ComboUserID, (int)Combo.Models.NotificationType.FOLLOW_FIREND);
            if (notify)
            {
                List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboNotification
                    {
                        ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        IsRead = Convert.ToBoolean(row["IsRead"]),
                        NotificationBody = row["NotificationBody"].ToString(),
                        NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        NotificationType = Convert.ToInt32(row["NotificationType"])
                    };
                }).ToList();

                SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), creator.DeviceID);
            }
            /**************************/

            _response.Entity = null;
            SetContentResult(_response);

        }

        [WebMethod]
        /// <summary>
        /// Toggle follow user 
        /// </summary>
        /// <param name="UserID">UserID to be followed</param>
        /// <param name="FollowerID">follower ID</param>
        /// <returns>ComboResponse object with result</returns>
        public void RequestFollowFriend(int userId, int FollowerId)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";
            bool follow = false;

            ProfileFollower follower = new ProfileFollower();
            if (!follower.LoadByPrimaryKey(userId, FollowerId))
            {
                follower.AddNew();
                follower.ComboFollowerID = FollowerId;
                follower.ComboUserID = userId;
                follower.IsRequestApproved = false;
                follower.Save();
                follow = true;
            }
            else
            {
                follower.MarkAsDeleted();
                follower.Save();
            }


            /**************************/
            // save notification and push it to device             
            ComboUser creator = new ComboUser();
            ComboUser commentor = new ComboUser();
            creator.GetUserByUserId(userId);
            commentor.GetUserByUserId(FollowerId);

            List<Models.FollowRequest> arequest = follower.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.FollowRequest
                {
                    ComboFriendID = Convert.ToInt32(row["ComboFollowerID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = commentor.UserName,
                    ComboDisplayName = commentor.DisplayName,
                    ProfilePic = creator.GetColumn("ProfilePic").ToString(),
                    FriendProfilePic = commentor.GetColumn("ProfilePic").ToString(),
                    IsFollowUser = follow
                };
            }).ToList();

            ComboNotification notification = new ComboNotification();
            notification.AddNew();
            notification.ComboUserID = creator.ComboUserID;
            if (follow)
                notification.NotificationType = (int)Combo.Models.NotificationType.FOLLOW_FIREND; // follow friend
            else
                notification.NotificationType = (int)Combo.Models.NotificationType.UNFOLLOW_FRIEND; // unfollow friend
            notification.NotificationDate = DateTime.UtcNow;
            notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(arequest);
            notification.IsRead = false;
            notification.Save();

            NotificationUserSettings settings = new NotificationUserSettings();
            settings.LoadByPrimaryKey(creator.ComboUserID, (int)Combo.Models.NotificationType.FOLLOW_FIREND);
            bool notify = false;
            if (settings.RowCount == 0)
                notify = true;
            else
                notify = settings.CanGetNotification(creator.ComboUserID, commentor.ComboUserID, (int)Combo.Models.NotificationType.FOLLOW_FIREND);
            if (notify)
            {
                List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboNotification
                    {
                        ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        IsRead = Convert.ToBoolean(row["IsRead"]),
                        NotificationBody = row["NotificationBody"].ToString(),
                        NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        NotificationType = Convert.ToInt32(row["NotificationType"])
                    };
                }).ToList();

                SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), creator.DeviceID);
            }
            /**************************/

            _response.Entity = null;
            SetContentResult(_response);

        }


        [WebMethod]
        /// <summary>
        /// Toggle follow user 
        /// </summary>
        /// <param name="UserID">UserID to be followed</param>
        /// <param name="FollowerID">follower ID</param>
        /// <returns>ComboResponse object with result</returns>
        public void RespondToRequestFollowFriend(int userId, int FollowerId, bool IsApproved)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";
            bool follow = false;

            ProfileFollower follower = new ProfileFollower();
            follower.LoadByPrimaryKey(userId, FollowerId); 
            if (IsApproved)
            {                               
                follower.IsRequestApproved = IsApproved;
                follower.Save();
                follow = true;
            }
            else
            {
                follower.MarkAsDeleted();
                follower.Save();
            }


            /**************************/
            // save notification and push it to device 
            if (IsApproved)
            {            
                ComboUser creator = new ComboUser();
                ComboUser commentor = new ComboUser();
                creator.GetUserByUserId(userId);
                commentor.GetUserByUserId(FollowerId);

                List<Models.FollowRequest> arequest = follower.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.FollowRequest
                    {
                        ComboFriendID = Convert.ToInt32(row["ComboFollowerID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        ComboUserName = commentor.UserName,
                        ComboDisplayName = commentor.DisplayName,
                        ProfilePic = creator.GetColumn("ProfilePic").ToString(),
                        FriendProfilePic = commentor.GetColumn("ProfilePic").ToString(),
                        IsFollowUser = follow
                    };
                }).ToList();

                ComboNotification notification = new ComboNotification();
                notification.AddNew();
                notification.ComboUserID = commentor.ComboUserID;

                notification.NotificationType = (int)Combo.Models.NotificationType.ACCEPT_FOLLOW_REQUEST; // accept follow friend
                notification.NotificationDate = DateTime.UtcNow;
                notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(arequest);
                notification.IsRead = false;
                notification.Save();

                NotificationUserSettings settings = new NotificationUserSettings();
                settings.LoadByPrimaryKey(commentor.ComboUserID, (int)Combo.Models.NotificationType.FOLLOW_FIREND);
                bool notify = false;
                if (settings.RowCount == 0)
                    notify = true;
                else
                    notify = settings.CanGetNotification(commentor.ComboUserID, creator.ComboUserID, (int)Combo.Models.NotificationType.FOLLOW_FIREND);
                if (notify)
                {
                    List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                    {
                        return new Models.ComboNotification
                        {
                            ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                            ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                            IsRead = Convert.ToBoolean(row["IsRead"]),
                            NotificationBody = row["NotificationBody"].ToString(),
                            NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                            NotificationType = Convert.ToInt32(row["NotificationType"])
                        };
                    }).ToList();

                    SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), commentor.DeviceID);
                }
            }
            /**************************/

            _response.Entity = null;
            SetContentResult(_response);

        }

        #endregion

        #region Friends
        const int FriendsPageSize = 20;
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo Users following user with specified id 
        /// </summary>
        /// <returns>ComboResponse object with List of all followers Users </returns>
        public void GetFriends(int userID, int pageIndex)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUserFriend user = new ComboUserFriend();
            user.GetFriendsByUserID(userID);
            List<Models.ComboUser> Users = user.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboUser
                {
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    UserName = row["UserName"].ToString(),
                    DisplayName = row["DisplayName"].ToString(),
                    Password = row["Password"].ToString(),
                    Email = row["Email"].ToString(),
                    Bio = row["Bio"].ToString(),
                    ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                    CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                    GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                    IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                    ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                    ExternalID = row["ExternalID"].ToString(),
                    DeviceID = row["DeviceID"].ToString(),
                    ActivationCode = row.IsNull("ActivationCode") ? Guid.Empty : new Guid(row["ActivationCode"].ToString()),
                    PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString()),
                    ProfilePic = row["ProfilePic"].ToString(),
                };
            }).Skip(pageIndex * FriendsPageSize).Take(FriendsPageSize).ToList();


            _response.Entity = Users;
            SetContentResult(_response);
            //return _response;

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo Users following user with specified id 
        /// </summary>
        /// <returns>ComboResponse object with List of all followers Users </returns>
        public void SearchForFriends(int userID, string searchText,int pageIndex)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUserFriend user = new ComboUserFriend();
            user.SearchForFriendsByUserID(userID,searchText);
            List<Models.ComboUser> Users = user.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboUser
                {
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    UserName = row["UserName"].ToString(),
                    DisplayName = row["DisplayName"].ToString(),
                    Password = row["Password"].ToString(),
                    Email = row["Email"].ToString(),
                    Bio = row["Bio"].ToString(),
                    ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                    CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                    GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                    IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                    ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                    ExternalID = row["ExternalID"].ToString(),
                    DeviceID = row["DeviceID"].ToString(),
                    ActivationCode = row.IsNull("ActivationCode") ? Guid.Empty : new Guid(row["ActivationCode"].ToString()),
                    PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString()),
                    ProfilePic = row["ProfilePic"].ToString(),
                };
            }).Skip(pageIndex * FriendsPageSize).Take(FriendsPageSize).ToList();


            _response.Entity = Users;
            SetContentResult(_response);
            //return _response;

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo Users following user with specified id 
        /// </summary>
        /// <returns>ComboResponse object with List of all followers Users </returns>
        public void SearchOnFriends(int userID, string searchText, int pageIndex)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUserFriend user = new ComboUserFriend();
            user.SearchOnFriendsByUserID(userID, searchText);
            List<Models.ComboUser> Users = user.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboUser
                {
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    UserName = row["UserName"].ToString(),
                    DisplayName = row["DisplayName"].ToString(),
                    Password = row["Password"].ToString(),
                    Email = row["Email"].ToString(),
                    Bio = row["Bio"].ToString(),
                    ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                    CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                    GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                    IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                    ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                    ExternalID = row["ExternalID"].ToString(),
                    DeviceID = row["DeviceID"].ToString(),
                    ActivationCode = row.IsNull("ActivationCode") ? Guid.Empty : new Guid(row["ActivationCode"].ToString()),
                    PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString()),
                    ProfilePic = row["ProfilePic"].ToString(),
                };
            }).Skip(pageIndex * FriendsPageSize).Take(FriendsPageSize).ToList();


            _response.Entity = Users;
            SetContentResult(_response);
            //return _response;

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo Users following user with specified id 
        /// </summary>
        /// <returns>ComboResponse object with List of all followers Users </returns>
        public void SearchForTagging(int userID, string searchText, int postID, int pageIndex)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUserFriend user = new ComboUserFriend();
            user.SearchForTaggingByUserID(userID, searchText, postID);
            List<Models.ComboUser> Users = user.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboUser
                {
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    UserName = row["UserName"].ToString(),
                    DisplayName = row["DisplayName"].ToString(),
                    Password = row["Password"].ToString(),
                    Email = row["Email"].ToString(),
                    Bio = row["Bio"].ToString(),
                    ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                    CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                    GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                    IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                    ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                    ExternalID = row["ExternalID"].ToString(),
                    DeviceID = row["DeviceID"].ToString(),
                    ActivationCode = row.IsNull("ActivationCode") ? Guid.Empty : new Guid(row["ActivationCode"].ToString()),
                    PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString()),
                    ProfilePic = row["ProfilePic"].ToString(),
                };
            }).Skip(pageIndex * FriendsPageSize).Take(FriendsPageSize).ToList();


            _response.Entity = Users;
            SetContentResult(_response);
            //return _response;

        }

        [WebMethod]
        /// <summary>
        /// Add Friend user 
        /// </summary>
        /// <param name="UserID">UserID to be followed</param>
        /// <param name="FollowerID">follower ID</param>
        /// <returns>ComboResponse object with result</returns>
        public void AddFriend(int userId, int FriendId)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";


            ComboUserFriend friend = new ComboUserFriend();
            if (!friend.LoadByPrimaryKey(userId, FriendId))
            {
                friend.AddNew();
                friend.ComboFriendID = FriendId;
                friend.ComboUserID = userId;
                friend.RequestApproved = false;
                friend.Save();

                /**************************/
                // save notification and push it to device                 
                ComboUser creator = new ComboUser();
                ComboUser requester = new ComboUser();
                creator.LoadByPrimaryKey(userId);
                requester.LoadByPrimaryKey(FriendId);

                List<Models.ComboFriendRequest> arequest = friend.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboFriendRequest
                    {
                        ComboFriendID = Convert.ToInt32(row["ComboFriendID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        ComboUserName = creator.UserName,
                        ComboFriendName = requester.UserName,
                        ComboFriendDisplayName = requester.DisplayName
                    };
                }).ToList();

                ComboNotification notification = new ComboNotification();
                notification.AddNew();
                notification.ComboUserID = creator.ComboUserID;
                notification.NotificationType = (int)Combo.Models.NotificationType.ADD_FRIEND; // friend request
                notification.NotificationDate = DateTime.UtcNow;
                notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(arequest);
                notification.IsRead = false;
                notification.Save();

                List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboNotification
                    {
                        ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        IsRead = Convert.ToBoolean(row["IsRead"]),
                        NotificationBody = row["NotificationBody"].ToString(),
                        NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        NotificationType = Convert.ToInt32(row["NotificationType"])
                    };
                }).ToList();

                SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), creator.DeviceID);
                /**************************/
            }
            
            _response.Entity = null;
            SetContentResult(_response);

        }


        [WebMethod]
        /// <summary>
        /// Add Friend user 
        /// </summary>
        /// <param name="UserID">UserID to be followed</param>
        /// <param name="FollowerID">follower ID</param>
        /// <returns>ComboResponse object with result</returns>
        public void RemoveFriend(int userId, int FriendId)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";
            bool unfriend = false;

            ComboUserFriend friend = new ComboUserFriend();
            if (friend.LoadByPrimaryKey(userId, FriendId))
            {
                friend.MarkAsDeleted();                
                friend.Save();
                unfriend = true;
            }
            else if (friend.LoadByPrimaryKey(FriendId, userId))
            {
                friend.MarkAsDeleted();
                friend.Save();
                unfriend = true;
            }

            if (unfriend)
            {

                /**************************/
                // save notification and push it to device                 
                ComboUser creator = new ComboUser();
                ComboUser requester = new ComboUser();
                creator.LoadByPrimaryKey(userId);
                requester.LoadByPrimaryKey(FriendId);

                List<Models.ComboFriendRequest> arequest = friend.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboFriendRequest
                    {
                        ComboFriendID = Convert.ToInt32(row["ComboFriendID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        ComboUserName = creator.UserName,
                        ComboFriendName = requester.UserName,
                        ComboFriendDisplayName = requester.DisplayName
                    };
                }).ToList();

                ComboNotification notification = new ComboNotification();
                notification.AddNew();
                notification.ComboUserID = creator.ComboUserID;
                notification.NotificationType = (int)Combo.Models.NotificationType.UNFRIEND; // unfriend 
                notification.NotificationDate = DateTime.UtcNow;
                notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(arequest);
                notification.IsRead = false;
                notification.Save();

                List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboNotification
                    {
                        ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        IsRead = Convert.ToBoolean(row["IsRead"]),
                        NotificationBody = row["NotificationBody"].ToString(),
                        NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        NotificationType = Convert.ToInt32(row["NotificationType"])
                    };
                }).ToList();

                SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), creator.DeviceID);
                /**************************/
 
            }

            _response.Entity = null;
            SetContentResult(_response);

        }

        [WebMethod]
        /// <summary>
        /// ban Friend user 
        /// </summary>
        /// <param name="UserID">UserID </param>
        /// <param name="FollowerID">banned ID</param>
        /// <param name="IsBanned">bool is banned</param>
        /// <returns>ComboResponse object with result</returns>
        public void ToggleBanFriend(int userId, int FriendId, bool IsBanned)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";


            ComboUserFriend friend = new ComboUserFriend();
            if (friend.LoadByPrimaryKey(userId, FriendId))
            {                                
                friend.IsBanned = IsBanned;
                friend.Save();
            }

            _response.Entity = null;
            SetContentResult(_response);

        }


        [WebMethod]
        /// <summary>
        /// Add Friend user 
        /// </summary>
        /// <param name="UserID">UserID to be followed</param>
        /// <param name="FollowerID">follower ID</param>
        /// <returns>ComboResponse object with result</returns>
        public void RespondToFriendRequest(int userId, int FriendId, bool isAccepted)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";


            ComboUserFriend friend = new ComboUserFriend();
            if (friend.LoadByPrimaryKey(userId, FriendId))
            {
                if (isAccepted)
                {
                    friend.RequestApproved = true;
                }
                else
                {
                    friend.MarkAsDeleted();
                }
                friend.Save();

                if (isAccepted)
                {
                    /**************************/
                    // save notification and push it to device                 
                    ComboUser creator = new ComboUser();
                    ComboUser requester = new ComboUser();
                    creator.LoadByPrimaryKey(userId);
                    requester.LoadByPrimaryKey(FriendId);

                    List<Models.ComboFriendRequest> arequest = friend.DefaultView.Table.AsEnumerable().Select(row =>
                    {
                        return new Models.ComboFriendRequest
                        {
                            ComboFriendID = Convert.ToInt32(row["ComboFriendID"]),
                            ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                            ComboUserName = creator.UserName,
                            ComboFriendName = requester.UserName,
                            ComboFriendDisplayName = requester.DisplayName
                        };
                    }).ToList();

                    ComboNotification notification = new ComboNotification();
                    notification.AddNew();
                    notification.ComboUserID = requester.ComboUserID;
                    notification.NotificationType = (int)Combo.Models.NotificationType.ACCEPT_FRIEND; // accept friend request
                    notification.NotificationDate = DateTime.UtcNow;
                    notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(arequest);
                    notification.IsRead = false;
                    notification.Save();

                    List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                    {
                        return new Models.ComboNotification
                        {
                            ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                            ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                            IsRead = Convert.ToBoolean(row["IsRead"]),
                            NotificationBody = row["NotificationBody"].ToString(),
                            NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                            NotificationType = Convert.ToInt32(row["NotificationType"])
                        };
                    }).ToList();

                    SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), requester.DeviceID);
                    /**************************/
                }
            }
            
            _response.Entity = null;
            SetContentResult(_response);

        }
        #endregion

        #region Msgs
        const int MsgsPageSize = 20;
        const int MsgsCommentsPageSize = 20;
        [WebMethod]
        /// <summary>
        /// Add Combo post to db
        /// </summary>
        /// <param name="user">Combo post object to be added</param>
        /// <returns>ComboResponse object with Added post object</returns>
        public void AddMessage(Models.ComboMessage msg)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            if (string.IsNullOrEmpty(msg.ToIds))
            {
                _response.ErrorCode = 30;
                _response.ErrorMsg = "Can't add Msg. No to id .";
                _response.bool_result = false;
                SetContentResult(_response);
                return;
            }

            if (msg.ToIds.Split(',').Length == 0)
            {
                _response.ErrorCode = 30;
                _response.ErrorMsg = "Can't add Msg. No to idsor error in format .";
                _response.bool_result = false;
                SetContentResult(_response);
                return;
            }

            BLL.ComboMsg newMsg = new ComboMsg();
            newMsg.AddNew();

            if (msg.ComboUserID != 0)
                newMsg.ComboUserID = msg.ComboUserID;
            else
            {
                _response.ErrorCode = 30;
                _response.ErrorMsg = "Can't add Msg. No user id .";
                _response.bool_result = false;
                SetContentResult(_response);
                return;
            }

            newMsg.MsgText = msg.MsgText.Replace("\n", " "); ;
            newMsg.MsgDate = DateTime.UtcNow;
            newMsg.IsRead = false;
            newMsg.Save();
            

            string[] ToIds = msg.ToIds.Split(',');
            ComboUserMsg tomsg = new ComboUserMsg();
            foreach (string item in ToIds)
            {
                tomsg.AddNew();
                tomsg.ComboUserID = Convert.ToInt32(item);
                tomsg.ComboMsgID = newMsg.ComboMsgID;
            }
            tomsg.Save();

            /**************************/
            // save notification and push it to device             
            ComboUser creator = new ComboUser();
            ComboUser commentor = new ComboUser();
            creator.GetUserByUserId(newMsg.ComboUserID);
            

            List<Models.ComboMessage> amsg = newMsg.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboMessage
                {
                    ComboMsgID = Convert.ToInt32(row["ComboMsgID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = creator.UserName,
                    ComboUserDisplayName = creator.DisplayName,
                    MsgText = newMsg.MsgText,
                    MsgDate = newMsg.MsgDate.Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    ProfilePic = creator.GetColumn("ProfilePic").ToString()
                };
            }).ToList();

            foreach (string item in ToIds)
            {
                ComboNotification notification = new ComboNotification();
                notification.AddNew();
                notification.ComboUserID = Convert.ToInt32(item);
                notification.NotificationType = (int)Combo.Models.NotificationType.RECEIVE_MSG; // new Msg recieved
                notification.NotificationDate = DateTime.UtcNow;
                notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(amsg);
                notification.IsRead = false;
                notification.Save();

                commentor.GetUserByUserId(Convert.ToInt32(item));

                NotificationUserSettings settings = new NotificationUserSettings();
                settings.LoadByPrimaryKey(Convert.ToInt32(item), (int)Combo.Models.NotificationType.RECEIVE_MSG);
                bool notify = false;
                if (settings.RowCount == 0)
                    notify = true;
                else
                    notify = settings.CanGetNotification(commentor.ComboUserID, creator.ComboUserID, (int)Combo.Models.NotificationType.FOLLOW_FIREND);
                if (notify)
                {
                    List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                    {
                        return new Models.ComboNotification
                        {
                            ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                            ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                            IsRead = Convert.ToBoolean(row["IsRead"]),
                            NotificationBody = row["NotificationBody"].ToString(),
                            NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                            NotificationType = Convert.ToInt32(row["NotificationType"])
                        };
                    }).ToList();

                    SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), commentor.DeviceID);
                }
            }
            /**************************/

            JavaScriptSerializer js = new JavaScriptSerializer();
            Models.Attachment[] att = js.Deserialize<Models.Attachment[]>(js.Serialize(msg.Attachments));

            ComboMsgAttachment attachment = new ComboMsgAttachment();
            foreach (Models.Attachment item in att)
            {
                attachment.AddNew();
                attachment.AttachmentID = item.AttachmentID;
                attachment.ComboMsgID = newMsg.ComboMsgID;

            }
            attachment.Save();

            msg.ComboMsgID = newMsg.ComboMsgID;
            msg.MsgDate = newMsg.MsgDate.Subtract(new DateTime(1970, 1, 1)).TotalSeconds;
            _response.Entity = new Models.ComboMessage[] { msg };

            SetContentResult(_response);
            return;
        }

        [WebMethod]
        /// <summary>
        /// Add Combo commnet to db
        /// </summary>
        /// <param name="user">Combo comment object to be added</param>
        /// <returns>ComboResponse object with Added comment object</returns>
        public void AddMessageComment(Models.ComboComment comment)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            BLL.ComboComment newComment = new ComboComment();
            newComment.AddNew();

            if (comment.ComboUserID != 0)
                newComment.ComboUserID = comment.ComboUserID;
            else
            {
                _response.ErrorCode = 30;
                _response.ErrorMsg = "Can't insert commnet. No user id .";
                _response.bool_result = false;
                SetContentResult(_response);
                return;
            }

            if (comment.ComboMsgID != 0)
                newComment.ComboMsgID = comment.ComboMsgID;
            else
            {
                _response.ErrorCode = 31;
                _response.ErrorMsg = "Can't insert comment. No Msg id .";
                _response.bool_result = false;
                SetContentResult(_response);
                return;
            }

            newComment.CommentText = comment.CommentText.Replace("\n", " "); ;
            newComment.CommentDate = DateTime.UtcNow;
            newComment.IsRead = false;
            newComment.Save();

            /**************************/
            // save notification and push it to device 
            ComboMsg post = new ComboMsg();
            post.LoadByPrimaryKey(comment.ComboMsgID);
            ComboUser creator = new ComboUser();
            ComboUser commentor = new ComboUser();
            creator.LoadByPrimaryKey(post.ComboUserID);
            commentor.GetUserByUserId(comment.ComboUserID);

            if (creator.ComboUserID != commentor.ComboUserID)
            {
                List<Models.ComboComment> acomment = newComment.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboComment
                    {
                        ComboMsgID = Convert.ToInt32(row["ComboMsgID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        ComboUserName = commentor.UserName,
                        ComboDisplayName = commentor.DisplayName,
                        CommentText = newComment.CommentText,
                        CommentDate = newComment.CommentDate.Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        ProfilePic = commentor.GetColumn("ProfilePic").ToString()
                    };
                }).ToList();

                ComboNotification notification = new ComboNotification();
                notification.AddNew();
                notification.ComboUserID = post.ComboUserID;
                notification.NotificationType = (int)Combo.Models.NotificationType.COMMENT_ON_MESSAGE; // add comment to post 
                notification.NotificationDate = DateTime.UtcNow;
                notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(acomment);
                notification.IsRead = false;
                notification.Save();

                NotificationUserSettings settings = new NotificationUserSettings();
                settings.LoadByPrimaryKey(creator.ComboUserID, (int)Combo.Models.NotificationType.COMMENT_ON_MESSAGE);
                bool notify = false;
                if (settings.RowCount == 0)
                    notify = true;
                else
                    notify = settings.CanGetNotification(creator.ComboUserID, commentor.ComboUserID, (int)Combo.Models.NotificationType.COMMENT_ON_MESSAGE);
                if (notify)
                {
                    List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                    {
                        return new Models.ComboNotification
                        {
                            ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                            ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                            IsRead = Convert.ToBoolean(row["IsRead"]),
                            NotificationBody = row["NotificationBody"].ToString(),
                            NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                            NotificationType = Convert.ToInt32(row["NotificationType"])
                        };
                    }).ToList();

                    SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), creator.DeviceID);
                }
            }
            /**************************/

            JavaScriptSerializer js = new JavaScriptSerializer();
            Models.Attachment[] att = js.Deserialize<Models.Attachment[]>(js.Serialize(comment.Attachments));

            ComboMsgAttachment attachment = new ComboMsgAttachment();
            foreach (Models.Attachment item in att)
            {
                attachment.AddNew();
                attachment.AttachmentID = item.AttachmentID;
                attachment.ComboMsgID = newComment.ComboMsgID;

            }
            attachment.Save();

            comment.ComboCommentID = newComment.ComboCommentID;
            comment.CommentDate = newComment.CommentDate.Subtract(new DateTime(1970, 1, 1)).TotalSeconds;
            _response.Entity = new Models.ComboComment[] { comment };

            SetContentResult(_response);
            return;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetMessages(int UserID, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboMsg Messages = new ComboMsg();
            Messages.GetUserMessages(UserID);
            List<Models.ComboMessage> Msgs = Messages.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboMessage
                {
                    ComboMsgID = Convert.ToInt32(row["ComboMsgID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    MsgText = row["MsgText"].ToString(),
                    MsgDate = Convert.ToDateTime(row["MsgDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    ToIds = row["ToIds"].ToString().Replace("\"", "'")
                };
            }).Skip(Page * MsgsPageSize).Take(MsgsPageSize).ToList();


            foreach (Models.ComboMessage item in Msgs)
            {                
                ComboComment totalCount = new ComboComment();
                totalCount.GetMsgCommentsCount(item.ComboMsgID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetTopMsgsCommentsByPostID(item.ComboMsgID);
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboMsgID = Convert.ToInt32(r["ComboMsgID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {
                    
                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();
                    
                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);
                    
                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboMsgAttachment attachments = new ComboMsgAttachment();
                attachments.GetMsgAttachmentsByPostID(item.ComboMsgID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();
            }

            _response.Entity = Msgs;
            SetContentResult(_response);
            //return _response;

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetMessagesBetweenUsers(int _1stUserID,int _2ndUserID ,int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboMsg Messages = new ComboMsg();
            Messages.GetMessagesBetweenUsers(_1stUserID, _2ndUserID);
            List<Models.ComboMessage> Msgs = Messages.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboMessage
                {
                    ComboMsgID = Convert.ToInt32(row["ComboMsgID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    MsgText = row["MsgText"].ToString(),
                    MsgDate = Convert.ToDateTime(row["MsgDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    ToIds = row["ToIds"].ToString().Replace("\"", "'")
                };
            }).Skip(Page * MsgsPageSize).Take(MsgsPageSize).ToList();


            foreach (Models.ComboMessage item in Msgs)
            {
                ComboComment totalCount = new ComboComment();
                totalCount.GetMsgCommentsCount(item.ComboMsgID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetMsgsCommentsByMsgID(item.ComboMsgID, "asc");
                // get top 3 comments for each post
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboMsgID = Convert.ToInt32(r["ComboMsgID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).Skip(Page * MsgsCommentsPageSize).Take(MsgsCommentsPageSize).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {

                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();

                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);

                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboMsgAttachment attachments = new ComboMsgAttachment();
                attachments.GetMsgAttachmentsByPostID(item.ComboMsgID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();
            }

            _response.Entity = Msgs;
            SetContentResult(_response);
            //return _response;

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Posts by Userid
        /// </summary>
        /// <param name="ID">ID of Combo User</param>
        /// <returns>ComboResponse object with List of all posts for User</returns>
        public void GetMessageComments(int MsgID, int Page, string order)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";
            if (string.IsNullOrEmpty(order) || (order != "asc" && order != "desc"))
            {
                order = "asc";
            }


            ComboMsg Messages = new ComboMsg();
            Messages.GetMessageById(MsgID);
            List<Models.ComboMessage> Msgs = Messages.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboMessage
                {
                    ComboMsgID = Convert.ToInt32(row["ComboMsgID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboUserName = row["UserName"].ToString(),
                    ProfilePic = row["ProfilePic"].ToString(),
                    MsgText = row["MsgText"].ToString(),
                    MsgDate = Convert.ToDateTime(row["MsgDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    ToIds = row["ToIds"].ToString().Replace("\"", "'")
                };
            }).ToList();


            foreach (Models.ComboMessage item in Msgs)
            {
                ComboComment totalCount = new ComboComment();
                totalCount.GetMsgCommentsCount(item.ComboMsgID);

                item.CommentsCount = Convert.ToInt32(totalCount.GetColumn("TotalCount"));

                ComboComment comments = new ComboComment();
                comments.GetMsgsCommentsByMsgID(item.ComboMsgID, order);
                
                item.Comments = comments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.ComboComment
                    {
                        ComboCommentID = Convert.ToInt32(r["ComboCommentID"]),
                        ComboMsgID = Convert.ToInt32(r["ComboMsgID"]),
                        ComboUserID = Convert.ToInt32(r["ComboUserID"]),
                        ComboUserName = r["UserName"].ToString(),
                        ProfilePic = r["ProfilePic"].ToString(),
                        CommentText = r["CommentText"].ToString(),
                        CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    };
                }).Skip(Page * MsgsCommentsPageSize).Take(MsgsCommentsPageSize).ToList();

                List<Models.ComboComment> _comm = item.Comments as List<Models.ComboComment>;
                foreach (Models.ComboComment _itemcomm in _comm)
                {

                    ComboCommentAttachment c_attachments = new ComboCommentAttachment();

                    c_attachments.GetCommentAttachmentsByCommentID(_itemcomm.ComboCommentID);

                    _itemcomm.Attachments = c_attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                            ThumbsPath = r["ThumbsPath"].ToString()
                        };
                    }).ToList();
                }

                item.Comments = _comm;

                ComboMsgAttachment attachments = new ComboMsgAttachment();
                attachments.GetMsgAttachmentsByPostID(item.ComboMsgID);
                item.Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                {
                    return new Models.Attachment
                    {
                        AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                        Path = r["Path"].ToString(),
                        AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"]),
                        ThumbsPath = r["ThumbsPath"].ToString()
                    };
                }).ToList();
            }

            _response.Entity = Msgs;
            SetContentResult(_response);
            //return _response;

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Delete Post By ID
        /// </summary>
        /// <param name="ID">ID of Post</param>
        /// <returns>ComboResponse object </returns>
        public void DeleteMsg(int id)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboMsg msg = new ComboMsg();
            msg.LoadByPrimaryKey(id);
            msg.IsDeleted = true;
            msg.Save();
            _response.Entity = null;
            SetContentResult(_response);

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo Users notifications user with specified id 
        /// </summary>
        /// <returns>ComboResponse object with List of all notifications</returns>
        public void GetCountUnReadMsgsComments(int userID)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboMsg Msgs = new ComboMsg();
            Msgs.GetUnReadMsgComments(userID);
            string result = "[{ 'TotalCount' : " + Msgs.GetColumn("MsgCommentsCounter").ToString() + " }]";
            _response.Entity = result;
            SetContentResult(_response);
            //return _response;

        }

        #endregion

        #region Global
        private void SetContentResult(dynamic data)
        {
            string result = Newtonsoft.Json.JsonConvert.SerializeObject(data);
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
            HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
            HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
            HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.
        }

       
        public void GeneralUpload(int userId)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            try
            {
                if (HttpContext.Current.Request.Files.Count != 0)
                {
                    var ext = Path.GetExtension(HttpContext.Current.Request.Files[0].FileName);
                    var fileName = Path.GetFileName(HttpContext.Current.Request.Files[0].FileName);

                    if (HttpContext.Current.Request.Files[0].FileName.LastIndexOf("\\") != -1)
                    {
                        fileName = HttpContext.Current.Request.Files[0].FileName.Remove(0, HttpContext.Current.Request.Files[0].FileName.LastIndexOf("\\")).ToLower();
                    }

                    DirectoryInfo dir = new DirectoryInfo(Server.MapPath("~/userfiles/" + userId.ToString()));
                    if (!dir.Exists)
                        dir.Create();

                    string FilePath = "/userfiles/" + userId.ToString() + fileName + ext;


                    string location = HttpContext.Current.Server.MapPath("~/" + FilePath);
                    HttpContext.Current.Request.Files[0].SaveAs(location);

                    BLL.Attachment newfile = new BLL.Attachment();
                    newfile.AddNew();
                    newfile.Path = FilePath;
                    newfile.Save();

                    Models.Attachment responseText = new Models.Attachment();
                    responseText.AttachmentID = newfile.AttachmentID;
                    responseText.Path = newfile.Path;

                    _response.Entity = responseText;
                    SetContentResult(_response);
                }
                else
                {
                    _response.bool_result = false;
                    _response.ErrorCode = 21;
                    _response.ErrorMsg = "No file found.";
                }
            }
            catch (Exception ex)
            {
                _response.bool_result = false;
                _response.ErrorCode = 20;
                _response.ErrorMsg = "Error while uploading file.";
            }

            SetContentResult(_response);    
        }
        #endregion

        #region noftifications
        /// <summary>
        /// APIKEY from google 
        /// </summary>
        const string APIKEY = "AIzaSyCn_Ln5KVlD-QVt6Mt2DJa8Zr7WvYQqEaE";
        const string PROJECTID = "507532714952";
                               
        const int NotificationPageSize = 20;
        /// <summary>
        /// send push notifications to Android devices
        /// </summary>
        /// <param name="postData">data to be sent</param>
        /// <param name="regID">device id </param>
        /// <param name="postDataContentType"></param>
        /// <returns>result from server about sending status</returns>
        [WebMethod]
        public string SendGCMNotification(string postData, string regID , string postDataContentType = "application/json")
        {
            ServicePointManager.ServerCertificateValidationCallback += new RemoteCertificateValidationCallback(ValidateServerCertificate);

            //
            //  MESSAGE CONTENT
            postData = "{ \"registration_ids\": [ \"" + regID + "\" ], " + "\"data\": {" + "\"message\": " + postData + "}}";

            byte[] byteArray = Encoding.UTF8.GetBytes(postData);

            //
            //  CREATE REQUEST
            HttpWebRequest Request = (HttpWebRequest)WebRequest.Create("https://android.googleapis.com/gcm/send");
            Request.Method = "POST";
            Request.KeepAlive = false;
            Request.ContentType = "application/json";
            Request.Headers.Add(string.Format("project_id: {0}", PROJECTID));     
            Request.Headers.Add(string.Format("Authorization: key={0}", APIKEY));            

            Request.ContentLength = byteArray.Length;

            Stream dataStream = Request.GetRequestStream();
            dataStream.Write(byteArray, 0, byteArray.Length);
            dataStream.Close();

            //
            //  SEND MESSAGE
            try
            {
                WebResponse Response = Request.GetResponse();
                HttpStatusCode ResponseCode = ((HttpWebResponse)Response).StatusCode;
                if (ResponseCode.Equals(HttpStatusCode.Unauthorized) || ResponseCode.Equals(HttpStatusCode.Forbidden))
                {
                    var text = "Unauthorized - need new token";
                }
                else if (!ResponseCode.Equals(HttpStatusCode.OK))
                {
                    var text = "Response from web service isn't OK";
                }

                StreamReader Reader = new StreamReader(Response.GetResponseStream());
                string responseLine = Reader.ReadToEnd();
                Reader.Close();

                return responseLine;
            }
            catch (Exception e)
            {
                WebException wex = (WebException)e;
                var s = wex.Response.GetResponseStream();
                string ss = "";
                int lastNum = 0;
                do
                {
                    lastNum = s.ReadByte();
                    ss += (char)lastNum;
                } while (lastNum != -1);
                s.Close();
                s = null;
                
                return e.Message + "### " + ss;
            }
            
        }


        private static bool ValidateServerCertificate(
                                                    object sender,
                                                    X509Certificate certificate,
                                                    X509Chain chain,
                                                    SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }

        
        
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo Users notifications user with specified id 
        /// </summary>
        /// <returns>ComboResponse object with List of all notifications</returns>
        public void GetNotifications(int userID, int pageIndex)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboNotification notifications = new ComboNotification();
            notifications.GetNotificationsbyUserId(userID);
            List<Models.ComboNotification> allnotifications = notifications.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboNotification
                {
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                    IsRead = Convert.ToBoolean(row["IsRead"]),
                    NotificationBody = row["NotificationBody"].ToString(),
                    NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                    NotificationType = Convert.ToInt32(row["NotificationType"])
                };
            }).Skip(pageIndex * NotificationPageSize).Take(NotificationPageSize).ToList();


            _response.Entity = allnotifications;
            SetContentResult(_response);
            //return _response;

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo Users notifications user with specified id 
        /// </summary>
        /// <returns>ComboResponse object with List of all notifications</returns>
        public void GetCountUnReadNotifications(int userID)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboNotification notifications = new ComboNotification();
            notifications.GetCountUnReadNotificationsbyUserId(userID);
            string result = "[{ 'TotalCount' : " + notifications.GetColumn("TotalCount").ToString() + " }]";
            _response.Entity = result;
            SetContentResult(_response);
            //return _response;

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo Users notifications user with specified id 
        /// </summary>
        /// <returns>ComboResponse object with List of all notifications</returns>
        public void GetCountUnReadNotificationsAndUnReadMsgComments(int userID)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboNotification notifications = new ComboNotification();
            notifications.GetCountUnReadNotificationsbyUserId(userID);

            ComboMsg Msgs = new ComboMsg();
            Msgs.GetUnReadMsgComments(userID);
            
            string result = "[{ 'TotalNotificationsCount' : " + notifications.GetColumn("TotalCount").ToString() + ", 'TotalMsgCommentsCount' : " + Msgs.GetColumn("MsgCommentsCounter").ToString() + " }]";
            _response.Entity = result;
            SetContentResult(_response);
            //return _response;

        }
        

        [WebMethod]
        /// <summary>
        /// Toggle Notification isread By ID
        /// </summary>
        /// <param name="ID">ID of notification</param>
        /// <param name="IsRead">true or false</param>
        /// <returns>ComboResponse object </returns>
        public void ToggleNotificationIsRead(int id, bool isRead)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";


            ComboNotification notification = new ComboNotification();
            if (notification.LoadByPrimaryKey(id))
            {
                notification.IsRead = isRead;
                notification.Save();

            }


            _response.Entity = null;
            SetContentResult(_response);

        }


        private void SendFollowersBirthdaysNotifications(int UserID)
        {
            ProfileFollower followers = new ProfileFollower();
            ComboUser NotifiedUser = new ComboUser();
            NotifiedUser.GetUserByUserId(UserID);
            followers.GetProfileFollowersByUserID(UserID);
            for (int i = 0; i < followers.RowCount; i++)
            {
                ComboUser current = new ComboUser();
                current.GetUserByUserId(followers.ComboFollowerID);

                List<Models.ComboUser> info = current.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboUser
                    {
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        UserName = row["UserName"].ToString(),
                        DisplayName = row["DisplayName"].ToString(),
                        Password = row["Password"].ToString(),
                        Email = row["Email"].ToString(),
                        Bio = row["Bio"].ToString(),
                        ProfileImgID = row.IsNull("ProfileImgID") ? 0 : Convert.ToInt32(row["ProfileImgID"]),
                        CoverImgID = row.IsNull("CoverImgID") ? 0 : Convert.ToInt32(row["CoverImgID"]),
                        GenderID = row.IsNull("GenderID") ? 0 : Convert.ToInt32(row["GenderID"]),
                        IsActivated = row.IsNull("IsActivated") ? false : Convert.ToBoolean(row["IsActivated"]),
                        ExternalIDType = row.IsNull("ExternalIDType") ? 0 : Convert.ToInt32(row["ExternalIDType"]),
                        ExternalID = row["ExternalID"].ToString(),
                        DeviceID = row["DeviceID"].ToString(),
                        ProfilePic = row["ProfilePic"].ToString(),
                        CoverPic = row["CoverPic"].ToString(),
                        UserRankID = Convert.ToInt32(row["UserRankID"]),
                        BirthDate = row.IsNull("BirthDate") ? DateTime.MinValue : Convert.ToDateTime(row["BirthDate"]),
                        Country = row["Country"].ToString(),
                        Phone = row["Phone"].ToString(),
                        Website = row["Website"].ToString(),
                        CountryFlagPath = row["CountryFlagPath"].ToString(),
                        Location = row["Location"].ToString(),
                        IsPrivateAccount = row.IsNull("IsPrivateAccount") ? false : Convert.ToBoolean(row["IsPrivateAccount"]),
                    };
                }).ToList();

                ComboNotification notification = new ComboNotification();
                notification.AddNew();
                notification.ComboUserID = NotifiedUser.ComboUserID;
                notification.NotificationType = (int)Combo.Models.NotificationType.FOLLOWER_BIRTHDAY; // like 
                notification.NotificationDate = DateTime.UtcNow;
                notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(info);
                notification.IsRead = false;
                notification.Save();


                List<Models.ComboNotification> notificationJson = notification.DefaultView.Table.AsEnumerable().Select(row =>
                {
                    return new Models.ComboNotification
                    {
                        ComboNotificationID = Convert.ToInt32(row["ComboNotificationID"]),
                        ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                        IsRead = Convert.ToBoolean(row["IsRead"]),
                        NotificationBody = row["NotificationBody"].ToString(),
                        NotificationDate = Convert.ToDateTime(row["NotificationDate"].ToString()).Subtract(new DateTime(1970, 1, 1)).TotalSeconds,
                        NotificationType = Convert.ToInt32(row["NotificationType"])
                    };
                }).ToList();

                SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), NotifiedUser.DeviceID);

                followers.MoveNext();
            }
        }
        #endregion

        #region UserSettings
        [WebMethod]
        /// <summary>
        /// Toggle IsDownloadable setting for a user By ID
        /// </summary>        
        /// <param name="ID">userid of user</param>
        /// <returns>ComboResponse object with total likes  </returns>
        public void ToggleIsDownloadablePosts(int userid, bool IsDownloadable)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";


            ComboUserSettings setting = new ComboUserSettings();
            if (!setting.GetSettingsByUserId(userid))
            {
                setting.AddNew();
                setting.IsPostsDownloadable = IsDownloadable;
                setting.ComboUserID = userid;
                setting.Save();
            }
            else
            {
                setting.IsPostsDownloadable = IsDownloadable;                
                setting.Save();
            }


            _response.Entity = null;
            SetContentResult(_response);

        }

        [WebMethod]
        /// <summary>
        /// Set from who user need to receive notifications By ID
        /// </summary>        
        /// <param name="ID">userid of user</param>
        /// <returns>ComboResponse object with user settings</returns>
        public void SetNotificationSettings(object NotificationUserSetting)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";


            NotificationUserSettings setting = new NotificationUserSettings();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Models.NotificationUserSetting[] usersettings = js.Deserialize<Models.NotificationUserSetting[]>(js.Serialize(NotificationUserSetting));
            if (usersettings != null)
            {
                foreach (Models.NotificationUserSetting item in usersettings)
	            {
                    if (!setting.LoadByPrimaryKey(item.ComboUserID, item.NotificationTypeID))
                    {
                        setting.AddNew();
                        setting.NotificationTypeID = item.NotificationTypeID;
                        setting.ComboUserID = item.ComboUserID;
                        setting.Status = item.Status;
                        setting.Save();
                    }
                    else
                    {
                        setting.Status = item.Status;
                        setting.Save();
                    }
	            }
                
            }


            _response.Entity = null;
            SetContentResult(_response);

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All combo User notifications settings with specified id 
        /// </summary>
        /// <returns>ComboResponse object with List of all notifications settings</returns>
        public void GetNotificationSettings(int userID)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            NotificationUserSettings settings = new NotificationUserSettings();
            settings.GetNotificationSettingsbyUserId(userID);
            List<Models.NotificationUserSetting> allnotifications = settings.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.NotificationUserSetting
                {
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    NotificationTypeID = Convert.ToInt32(row["NotificationTypeID"]),
                    Status = Convert.ToInt16(row["Status"])
                };
            }).ToList();


            _response.Entity = allnotifications;
            SetContentResult(_response);
            //return _response;

        }
        #endregion 

        #region ActivityLog
        public bool AddActivityLog(int userID, DateTime date)
        {
            try
            {
                int discount = 0;
                UserActivityLog log = new UserActivityLog();                
                if (log.GetLastActivityByUserID(userID))
                {
                    // get between days only i.e. 
                    // last day 01/03/2015 - current date  04/03/2015 
                    // the between days not equal 3 it's only 2 ( 02/03/2015 - 03-03-2015 )
                    // so diff = current date - last date - 1
                    discount = date.Subtract(log.Date).Days - 1; 
                }
                log.AddNew();
                log.ComboUserID = userID;
                log.Date = date;
                log.DaysToDiscount = discount;
                log.Save();
                // if save success
                return true;
            }
            catch (Exception ex)
            {
                //if save fail - duplicate entry
                return false;
            }
        }
        #endregion

        #region Country
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Get All Countries
        /// </summary>
        /// <returns>ComboResponse object with List of all Countries</returns>
        public void GetCountries()
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            Country country = new Country();
            country.LoadAll();
            List<Models.Country> AllCountries = country.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.Country
                {
                    CountryID = Convert.ToInt32(row["CountryID"]),
                    Name = row["Name"].ToString(),
                    IconPath = row["IconPath"].ToString()
                };
            }).ToList();


            _response.Entity = AllCountries;
            SetContentResult(_response);
            //return _response;

        }
        #endregion

        #region HashTags
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        /// <summary>
        /// Search hash tags 
        /// </summary>
        /// <returns>ComboResponse object with List of all hashtags matched</returns>
        public void SearchHashTagByName(string hashTag)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            HashTag tags = new HashTag();
            tags.GetHashTagByName(hashTag);
            List<Models.HashTag> Tags = tags.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.HashTag
                {
                    HashTagID = Convert.ToInt32(row["HashTagID"]),
                    TagName = row["Name"].ToString()
                };
            }).ToList();


            _response.Entity = Tags;
            SetContentResult(_response);
            //return _response;

        }
        #endregion

    }
}
