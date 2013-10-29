using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class ClientCommand
    {
        public ClientCommand()
        {

        }

        public string Sender { get; set; }
        public string ChatRoomName { get; set; }
        public int CategoryId { get; set; }
        public int SubCategoryId { get; set; }
    }
}
