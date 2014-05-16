using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Helper
{
    public class BoundProperty : Attribute
    {
        public string HeaderText { get; set; }
        public string DataFormat { get; set; }
        public int DisplayOrder { get; set; }

        public string PropertyName { get; set; }
    }
}
