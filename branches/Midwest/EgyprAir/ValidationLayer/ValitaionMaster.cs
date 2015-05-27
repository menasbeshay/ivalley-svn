using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Flight_BLL;
namespace ValidationLayer
{
    public class ValidationMaster : ValidationBase
    {
        public ValidationMaster()
        {

        }

        /// <summary>
        /// Validate data against rules 
        /// set validationResult with validation process result
        /// </summary>
        public void Validate(DataTable dt, ValidationRuleToApply rule)
        {
            switch (rule)
            {
                case ValidationRuleToApply.WORKING_HOURS:
                    DutyLimitation maxHours = new DutyLimitation(dt);
                    maxHours.ValidationMain();
                    // get messages
                    ValidationMsg.AddRange(maxHours.ValidationMsg);
                    break;
                case ValidationRuleToApply.FLIGHT_DUTY_PERIOD:
                    // apply validation rule
                    MaxDaily_FDB maxFDP = new MaxDaily_FDB(dt);
                    maxFDP.ValidationMain();
                    // get messages
                    ValidationMsg.AddRange(maxFDP.ValidationMsg);
                    break;
                case ValidationRuleToApply.REST_PERIOD:
                    // apply validation rule
                    RestPeriod restPeriod = new RestPeriod(dt);
                    restPeriod.ValidationMain();
                    // get messages
                    ValidationMsg.AddRange(restPeriod.ValidationMsg);
                    break;
                default:
                    break;
            }

            
        }
    }
}
