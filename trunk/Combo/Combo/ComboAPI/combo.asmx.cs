﻿using Combo.BLL;
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
                    PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString())
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
        public void GetUserByID(int id)
        {
            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";

            ComboUser user = new ComboUser();
            user.LoadByPrimaryKey(id);
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
                    PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString())
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
        public void GetUser(string username, string password)
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
                        PassResetCode = row.IsNull("PassResetCode") ? Guid.Empty : new Guid(row["PassResetCode"].ToString())
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
            newUser.AddNew();
            newUser.UserName = user.UserName;
            if (!string.IsNullOrEmpty(user.DisplayName))
                newUser.DisplayName = user.DisplayName;
            newUser.Password = user.Password;
            newUser.Email = user.Email;
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
            
            if (user.ExternalIDType != 0)
            {
                newUser.ExternalIDType = user.ExternalIDType;
                newUser.ExternalID = user.ExternalID;
            }
            if (!string.IsNullOrEmpty(user.DeviceID))
                newUser.DeviceID = user.DeviceID;
            newUser.Save();

            user.ComboUserID = newUser.ComboUserID;
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
        /// send forget pasword code by username
        /// </summary>
        /// <param name="ID">username of Combo User</param>
        /// <returns>ComboResponse object </returns>
        public void ForgetPassword(string Username)
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
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString())                    
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
                            CommentText = r["CommentText"].ToString(),
                            CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()),
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
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"])
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
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"])
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
            post.LoadByPrimaryKey(id);
            ComboPostLike likes = new ComboPostLike();
            ComboPostAttachment attachments = new ComboPostAttachment();
            ComboComment comments = new ComboComment();

            likes.GetPostLikesByPostID(post.ComboPostID);
            attachments.GetPostAttachmentsByPostID(post.ComboPostID);
            comments.GetPostCommentsByPostID(post.ComboPostID);
            
            List<Models.ComboPost> Post = post.DefaultView.Table.AsEnumerable().Select(row =>
            {
                return new Models.ComboPost
                {
                    ComboPostID = Convert.ToInt32(row["ComboPostID"]),
                    ComboUserID = Convert.ToInt32(row["ComboUserID"]),
                    PostText = row["PostText"].ToString(),
                    PostDate = Convert.ToDateTime(row["PostDate"].ToString()),
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
                            CommentText = r["CommentText"].ToString(),
                            CommentDate = Convert.ToDateTime(r["CommentDate"].ToString()),                            
                        };
                    }).Skip(CommentPage * CommentsPageSize).Take(CommentsPageSize).ToList(),
                    Attachments = attachments.DefaultView.Table.AsEnumerable().Select(r =>
                    {
                        return new Models.Attachment
                        {
                            AttachmentID = Convert.ToInt32(r["AttachmentID"]),
                            Path = r["Path"].ToString(),
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"])
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
                            AttachmentTypeID = Convert.ToInt32(r["AttachmentTypeID"])
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
            
            newPost.PostText = post.PostText;
            newPost.PostDate = DateTime.Now;
                        
            newPost.Save();

            JavaScriptSerializer js = new JavaScriptSerializer();
            Models.Attachment[] att = js.Deserialize<Models.Attachment[]>(js.Serialize(post.Attachments));

            ComboPostAttachment attachment = new ComboPostAttachment();
            foreach (Models.Attachment item in att)
            {
                attachment.AddNew();
                attachment.AttachmentID = item.AttachmentID;
                attachment.ComboPostID = newPost.ComboPostID;
                  
            }
            attachment.Save();  

            post.ComboPostID = newPost.ComboPostID;
            post.PostDate = newPost.PostDate;
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
            newPost.PostText = post.PostText;
            newPost.PostDate = DateTime.Now;
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

            post.PostDate = newPost.PostDate;
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
                    UserName = row["UserName"].ToString()
                };
            }).ToList();


            _response.Entity = Alllikes;
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

            newComment.CommentText = comment.CommentText;
            newComment.CommentDate = DateTime.Now;

            newComment.Save();

            JavaScriptSerializer js = new JavaScriptSerializer();
            Models.Attachment[] att = js.Deserialize<Models.Attachment[]>(js.Serialize(comment.Attachments));

            ComboCommentAttachment attachment = new ComboCommentAttachment();
            foreach (Models.Attachment item in att)
            {
                attachment.AddNew();
                attachment.AttachmentID = item.AttachmentID;
                attachment.ComboCommnetID = newComment.ComboCommentID;

            }
            attachment.Save();

            comment.ComboCommentID = newComment.ComboCommentID;
            comment.CommentDate = newComment.CommentDate;
            _response.Entity = new Models.ComboComment[] { comment };

            SetContentResult(_response);
            return;
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
    }
}
