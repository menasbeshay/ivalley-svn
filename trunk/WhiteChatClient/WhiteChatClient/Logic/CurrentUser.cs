using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WhiteChatClient.Logic
{
    public class CurrentUser
    {
        #region fields
        private bool _isOnline;
        #endregion

        #region properties
        public bool IsOnLine { get { return _isOnline; } set { _isOnline = value; } }
        #endregion

        #region methods
        public CurrentUser()
        {
            IsOnLine = false;
        }
        #endregion
    }
}
