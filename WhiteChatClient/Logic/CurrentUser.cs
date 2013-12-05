using System;
using System.Collections.Generic;
using System.Text;
using Bricksoft;
using Bricksoft.IM.Yahoo;
namespace WhiteChatClient.Logic
{
    public static class CurrentUser
    {
        #region fields
        static YahooClient client = new YahooClient();
        public static Dictionary<string, string> Emotions = new Dictionary<string, string>();
        #endregion

        #region properties
        public static YahooClient Client
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
        public static void LoadEmotions()
        {
            Emotions.Add(":((", "Images/20.gif");
            Emotions.Add(":))", "Images/21.gif");
            Emotions.Add(":|", "Images/22.gif");
            Emotions.Add("/:)", "Images/23.gif");
            Emotions.Add(">:)", "Images/19.gif");
            Emotions.Add(";;)", "Images/5.gif");
            Emotions.Add(":)", "Images/1.gif");
            Emotions.Add(":(", "Images/2.gif");
            Emotions.Add(";)", "Images/3.gif");
            Emotions.Add(":D", "Images/4.gif");
            Emotions.Add(">:D<", "Images/6.gif");
            Emotions.Add(":-/", "Images/7.gif");
            Emotions.Add(":x", "Images/8.gif");
            Emotions.Add(":\">", "Images/9.gif");
            Emotions.Add(":P", "Images/10.gif");
            Emotions.Add(":-*", "Images/11.gif");
            Emotions.Add("=((", "Images/12.gif");
            Emotions.Add(":-O", "Images/13.gif");
            Emotions.Add("X(", "Images/14.gif");
            Emotions.Add(":>", "Images/15.gif");
            Emotions.Add("B-)", "Images/16.gif");
            Emotions.Add(":-S", "Images/17.gif");
            Emotions.Add("#:-S", "Images/18.gif");
            Emotions.Add("=))", "Images/24.gif");
            Emotions.Add("O:-)", "Images/25.gif");
            Emotions.Add(":-B", "Images/26.gif");
            Emotions.Add("=;", "Images/27.gif");
            /*Emotions.Add(":)", "Images.28.gif");
            Emotions.Add(":)", "Images.29.gif");
            Emotions.Add(":)", "Images.30.gif");
            Emotions.Add(":)", "Images.31.gif");
            Emotions.Add(":)", "Images.32.gif");
            Emotions.Add(":)", "Images.33.gif");
            Emotions.Add(":)", "Images.34.gif");
            Emotions.Add(":)", "Images.35.gif");
            Emotions.Add(":)", "Images.36.gif");
            Emotions.Add(":)", "Images.37.gif");
            Emotions.Add(":)", "Images.38.gif");
            Emotions.Add(":)", "Images.39.gif");
            Emotions.Add(":)", "Images.40.gif");
            Emotions.Add(":)", "Images.41.gif");
            Emotions.Add(":)", "Images.42.gif");
            Emotions.Add(":)", "Images.43.gif");
            Emotions.Add(":)", "Images.44.gif");
            Emotions.Add(":)", "Images.45.gif");
            Emotions.Add(":)", "Images.46.gif");
            Emotions.Add(":)", "Images.47.gif");
            Emotions.Add(":)", "Images.48.gif");
            Emotions.Add(":)", "Images.49.gif");
            Emotions.Add(":)", "Images.50.gif");
            Emotions.Add(":)", "Images.51.gif");
            Emotions.Add(":)", "Images.52.gif");
            Emotions.Add(":)", "Images.53.gif");
            Emotions.Add(":)", "Images.54.gif");
            Emotions.Add(":)", "Images.55.gif");
            Emotions.Add(":)", "Images.56.gif");
            Emotions.Add(":)", "Images.57.gif");
            Emotions.Add(":)", "Images.58.gif");
            Emotions.Add(":)", "Images.59.gif");
            Emotions.Add(":)", "Images.60.gif");
            Emotions.Add(":)", "Images.61.gif");
            Emotions.Add(":)", "Images.62.gif");
            Emotions.Add(":)", "Images.63.gif");
            Emotions.Add(":)", "Images.64.gif");
            Emotions.Add(":)", "Images.65.gif");
            Emotions.Add(":)", "Images.66.gif");
            Emotions.Add(":)", "Images.67.gif");
            Emotions.Add(":)", "Images.68.gif");
            Emotions.Add(":)", "Images.69.gif");
            Emotions.Add(":)", "Images.70.gif");
            Emotions.Add(":)", "Images.71.gif");
            Emotions.Add(":)", "Images.72.gif");
            Emotions.Add(":)", "Images.73.gif");
            Emotions.Add(":)", "Images.74.gif");
            Emotions.Add(":)", "Images.75.gif");*/
            
        }

        public static void ClearEmtions()
        {
            Emotions.Clear();
        }
        
        #endregion
    }
}
