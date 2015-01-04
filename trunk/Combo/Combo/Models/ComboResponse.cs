using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class ComboResponse
    {
        /// <summary>
        /// db Entity returned to caller 
        /// </summary>        
        public object Entity { get; set; }
        /// <summary>
        /// Error code returned if error exists
        /// 0 - means no error 
        /// errors starting with "1" for login/registeration errors 
        /// 10 - password not correct
        /// 11 - username not found
        /// 12 - username exists before
        /// 13 - email is required
        /// 20 - error while uploading file
        /// 21 - no file found
        /// 30 - no user id
        /// 31 - no post id
        /// 9999 - General Error
        /// </summary>
        public int ErrorCode { get; set; }
        /// <summary>
        /// Error message returned from server
        /// </summary>
        public string ErrorMsg { get; set; }
        /// <summary>
        /// describe whether request executed successfully or not
        /// true - request executed successfully
        /// false - request executed with errors 
        /// </summary>
        public bool bool_result { get; set; }
    }
    
    
}