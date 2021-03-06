﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class ChangeMemberType : Log
    {
        public ChangeMemberType()
        {
            Type = Helper.Enums.LogType.ChangeMemberType;
        }

        [Helper.BoundProperty(HeaderText = "إنتهاء الترقية", DisplayOrder = 3, DataFormat = Helper.Date.DateStringFormat)]
        public DateTime NewTypeExpiryDate { get; set; }

        [Helper.BoundProperty(HeaderText = "النيكنيم", DisplayOrder = 1)]
        public string MemberName { get; set; }

        [Helper.BoundProperty(HeaderText = "نوع الترقية", DisplayOrder = 2)]
        public string NewTypeName { get; set; }

        [Helper.BoundProperty(HeaderText = "النقاط", DisplayOrder = 4)]
        public int Points { get; set; }

        [Helper.BoundProperty(HeaderText = "النيكنيم القديم", DisplayOrder = 5)]
        public string OldName { get; set; }
    }
}
