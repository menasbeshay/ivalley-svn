using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    [Serializable()]
    public class ClientCommand
    {
        public ClientCommand()
        {

        }

        public enum msgType 
        {
            JoinRoom ,
            LeaveRoom,
            Message  
        }

        public msgType MessageType { get; set; }
        public string Sender { get; set; }
        public int ChatRoomID { get; set; }
        public int CategoryId { get; set; }
        public int SubCategoryId { get; set; }
        public string Message { get; set; }
    }
}
