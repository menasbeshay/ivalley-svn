using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace ValidationLayer
{
    public class LimitSingleFlyPeriod_Rule : ValidationBase
    {
        #region Properties
        #endregion

        #region Events

        /// <summary>
        /// Class Constructor
        /// </summary>
        public LimitSingleFlyPeriod_Rule()
        {

        }

        #endregion

        #region Methods

        public DataTable GetAllDataForRule()
        {
            DataTable dtResult = new DataTable();

            return dtResult;



        }

        public void ValidationMain()
        {
            /// 1- load prepared data from DB ( Validation Tables )
            /// 2- Loop on LocalDataTable we have ( sent from GUI ) - ( Get day by Day )
            /// 3- Loop inside each day ( sector count - First Takeoff time - Last landing time  )
            /// inside ( loop 3 ) -> Get Number value from DB table (TABLE A)  ACCLIMATIZED LOCAL TIME (*)
            /// inside ( loop 3) -> Based on Previous .. do calculation using the Equation 
        }

        #endregion


    }
}
