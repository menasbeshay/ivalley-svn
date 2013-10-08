using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JBuddy;
namespace WhiteChatClient.Logic
{
    public static class CurrentUser
    {
        #region fields
        
        static Client client;
        #endregion

        #region properties
        public static Client Client
        {
            get 
            {
                if (client != null)
                    return client;
                else
                    return null;
            }
            set
            {
                client = value;
            }
            
        }
        #endregion

        #region methods
        
        
        #endregion
    }
}
