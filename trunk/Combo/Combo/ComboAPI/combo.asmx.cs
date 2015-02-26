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
                    UserRankID = Convert.ToInt32(row["UserRankID"])
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
                    IsFriendRequestSent = Convert.ToBoolean(row["IsFriendRequestSent"]),
                    ProfilePic = row["ProfilePic"].ToString(),
                    CoverPic = row["CoverPic"].ToString(),
                    UserRankID = Convert.ToInt32(row["UserRankID"])
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
                    UserRankID = Convert.ToInt32(row["UserRankID"])
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
                        UserRankID = Convert.ToInt32(row["UserRankID"])
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

            if (string.IsNullOrEmpty(user.SecurityQuestion))
            {
                _response.ErrorCode = 14;
                _response.ErrorMsg = "No secuity question found";
                _response.bool_result = false;
                SetContentResult(_response);
                return;
            }

            if (string.IsNullOrEmpty(user.SecurityAnswer))
            {
                _response.ErrorCode = 15;
                _response.ErrorMsg = "No security answer found";
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
            newUser.SecurityQuestion = user.SecurityQuestion;
            newUser.SecurityAnswer = user.SecurityAnswer;
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
            newUser.Save();

            user.ComboUserID = newUser.ComboUserID;
            _response.Entity = new Models.ComboUser[]{ user};
            
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

            if (user.ExternalIDType != 0)
            {
                newUser.ExternalIDType = user.ExternalIDType;
                newUser.ExternalID = user.ExternalID;
            }
            if (!string.IsNullOrEmpty(user.DeviceID))
                newUser.DeviceID = user.DeviceID;
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
        public void ForgetPassword(string Username, string question , string answer)
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
            else if (user.SecurityQuestion != question || user.SecurityAnswer != answer)
            {
                _response.ErrorCode = 16;
                _response.ErrorMsg = "Security question or answer are not matched to our databse.";
                _response.bool_result = false;

            }
            else
            {
                user.PassResetCode = Guid.NewGuid();
                user.Save();


                try
                {
                    MailMessage msg = new MailMessage();
                    string body = Combo.Properties.Resources.body;
                    string mail = Combo.Properties.Resources.mail;

                    string mailto = user.Email;
                    msg.To.Add(mailto);
                    msg.From = new MailAddress(mail);
                    msg.Subject = Combo.Properties.Resources.subject;
                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.UTF8;

                    msg.Body = string.Format(body, user.UserName, user.PassResetCode.ToString());

                    SmtpClient client = new SmtpClient(Combo.Properties.Resources.mailserver, Convert.ToInt32(Combo.Properties.Resources.port));

                    client.UseDefaultCredentials = false;
                    //client.EnableSsl = true;
                    client.Credentials = new System.Net.NetworkCredential(mail, Combo.Properties.Resources.mailpass);
                    client.Send(msg);
                }
                catch (Exception ex)
                {
                    _response.ErrorCode = 9999;
                    _response.ErrorMsg = "An Error Occured.Please try again.<br />" + ex.Message;
                    _response.bool_result = false;
                }
            }

            _response.Entity = null;
            SetContentResult(_response);
            return;
        }
        #endregion

        #region Posts
        const int PostsPageSize = 20;
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
        public void SearchPosts(string filterText, int Page)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboPost posts = new ComboPost();
            posts.SearchPosts(filterText);
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
        /// Get Post By ID
        /// </summary>
        /// <param name="ID">ID of Post</param>
        /// <returns>ComboResponse object with requested Post object </returns>
        public void GePostByID(int id, int CommentPage)
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
                    Likes =  likes.DefaultView.Table.AsEnumerable().Select(r =>
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
                }
                
            }
            _response.Entity = Post;
            SetContentResult(_response);

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
                liker.LoadByPrimaryKey(userid);

                List<Models.ComboPostLike> alike = likes.DefaultView.Table.AsEnumerable().Select(row =>
                    {
                        return new Models.ComboPostLike
                        {
                            ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                            ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                            UserName = liker.UserName,
                            DisplayName = liker.DisplayName
                        };
                    }
                    ).ToList();

                ComboNotification notification = new ComboNotification();
                notification.AddNew();
                notification.ComboUserID = post.ComboUserID;
                notification.NotificationType = (int)Combo.Models.NotificationType.LIKE; // like 
                notification.NotificationDate= DateTime.UtcNow;
                notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject(alike);
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
                    }
                    ).ToList();

                string notification_response = SendGCMNotification(Newtonsoft.Json.JsonConvert.SerializeObject(notificationJson), creator.DeviceID);
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
   
            ComboUser creator = new ComboUser();
            ComboUser requester = new ComboUser();
            creator.LoadByPrimaryKey(ref_post.ComboUserID);
            requester.LoadByPrimaryKey(UserId);

            List<Models.ComboSharePost> info = post.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboSharePost
                {
                    ComboFriendID = requester.ComboUserID,
                    ComboUserID = creator.ComboUserID,
                    ComboUserName = creator.UserName,
                    ComboFriendName = requester.UserName,
                    ComboFriendDisplayName = requester.DisplayName,
                    ComboPostID = Convert.ToInt32(row["ComboPostID"].ToString())
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


            /**************************/
            // save notification and push it to device 
            ComboPost post = new ComboPost();
            post.LoadByPrimaryKey(comment.ComboPostID);
            ComboUser creator = new ComboUser();
            ComboUser commentor = new ComboUser();
            creator.GetUserByUserId(post.ComboUserID);
            commentor.GetUserByUserId(comment.ComboUserID);

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
                    ProfilePic = commentor.GetColumn("ProfilePic").ToString()
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
            comment.ComboCommentID = newComment.ComboCommentID;
            comment.CommentDate = newComment.CommentDate.Subtract(new DateTime(1970, 1, 1)).TotalSeconds;
            _response.Entity = new Models.ComboComment[] { comment };

            SetContentResult(_response);
            return;
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
            creator.LoadByPrimaryKey(userId);
            commentor.LoadByPrimaryKey(FollowerId);            

            ComboNotification notification = new ComboNotification();
            notification.AddNew();
            notification.ComboUserID = creator.ComboUserID;
            if (follow)
                notification.NotificationType = (int)Combo.Models.NotificationType.FOLLOW_FIREND; // follow friend
            else
                notification.NotificationType = (int)Combo.Models.NotificationType.UNFOLLOW_FRIEND; // unfollow friend
            notification.NotificationDate = DateTime.UtcNow;
            notification.NotificationBody = Newtonsoft.Json.JsonConvert.SerializeObject("[{'ComboUserID':" + creator.ComboUserID + ",'ComboFriendID':" + commentor.ComboUserID + ",'ComboUsername:'" + commentor.UserName + "'" + ",'ComboDisplayName:'" + commentor.DisplayName +"', 'IsFollowUser' : " + follow + "}]");
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
                return e.Message;
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
        #endregion 
    }
}
