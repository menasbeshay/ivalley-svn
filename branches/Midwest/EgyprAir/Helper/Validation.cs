using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Flight_BLL;
namespace Helper
{
    public class Validation
    {        
        public Validation() 
        {            
        }
        
        public bool EnableFlightTimeValidation
        {
            get 
            {
                return IsEnabledFlightTimeValidation();
            }
        }

        private bool IsEnabledFlightTimeValidation()
        {
            SystemSettings settings = new SystemSettings();
            settings.LoadAll();
            if (settings.IsColumnNull(SystemSettings.ColumnNames.EnableFlightTimeLimitaion))
                return false;
            return settings.EnableFlightTimeLimitaion;
        }

        public ValidationMsg IsPilotValidToDuty(int PilotID, DateTime DutyDate)
        {            
            int weekhours = 0;
            int weekmins = 0;
            int monthhours = 0;
            int monthmins = 0;
            int yearhours = 0;
            int yearmins = 0;
            ValidationMsg validationMsg = new ValidationMsg();
            validationMsg.IsValid = true;
            if (EnableFlightTimeValidation)            
            {
                Pilot currentPilot = new Pilot();
                currentPilot.GetPilotHoursWithinRange(PilotID, DutyDate.AddDays(-7), DutyDate);
                int.TryParse(currentPilot.GetColumn("GrandTotalHours").ToString(), out weekhours);
                int.TryParse(currentPilot.GetColumn("GrandTotalMins").ToString(), out weekmins);

                currentPilot.GetPilotHoursWithinRange(PilotID, DutyDate.AddDays(-30), DutyDate);
                int.TryParse(currentPilot.GetColumn("GrandTotalHours").ToString(), out monthhours);
                int.TryParse(currentPilot.GetColumn("GrandTotalMins").ToString(), out monthmins);

                currentPilot.GetPilotHoursWithinRange(PilotID, DutyDate.AddDays(-365), DutyDate);
                int.TryParse(currentPilot.GetColumn("GrandTotalHours").ToString(), out yearhours);
                int.TryParse(currentPilot.GetColumn("GrandTotalMins").ToString(), out yearmins);

                if (weekhours >= 50)
                {
                    validationMsg.Messages.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.WEEK_HOURS_EXCCEDED));
                    validationMsg.IsValid = false;
                }
                if (monthhours >= 100)
                {
                    validationMsg.Messages.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.MONTH_HOURS_EXCCEDED));
                    validationMsg.IsValid = false;
                }
                if (yearhours >= 900)
                {
                    validationMsg.Messages.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.YEAR_HOURS_EXCCEDED));
                    validationMsg.IsValid = false;
                }
            }
            return validationMsg;
        }

        public ValidationMsg IsCrewValidToDuty(int CrewID, DateTime DutyDate)
        {
            int weekhours = 0;
            int weekmins = 0;
            
            ValidationMsg validationMsg = new ValidationMsg();
            validationMsg.IsValid = true;
            if (EnableFlightTimeValidation)
            {
                Crew currentCrew = new Crew();
                currentCrew.GetPilotHoursWithinRange(CrewID, DutyDate.AddDays(-7), DutyDate);
                int.TryParse(currentCrew.GetColumn("GrandTotalHours").ToString(), out weekhours);
                int.TryParse(currentCrew.GetColumn("GrandTotalMins").ToString(), out weekmins);

                /*currentCrew.GetPilotHoursWithinRange(CrewID, DutyDate.AddDays(-30), DutyDate);
                int.TryParse(currentCrew.GetColumn("GrandTotalHours").ToString(), out monthhours);
                int.TryParse(currentCrew.GetColumn("GrandTotalMins").ToString(), out monthmins);

                currentCrew.GetPilotHoursWithinRange(CrewID, DutyDate.AddDays(-365), DutyDate);
                int.TryParse(currentCrew.GetColumn("GrandTotalHours").ToString(), out yearhours);
                int.TryParse(currentCrew.GetColumn("GrandTotalMins").ToString(), out yearmins);*/

                if (weekhours >= 55)
                {
                    validationMsg.Messages.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.WEEK_HOURS_EXCCEDED));
                    validationMsg.IsValid = false;
                }
               /* if (monthhours >= 100)
                {
                    validationMsg.Messages.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.MONTH_HOURS_EXCCEDED));
                    validationMsg.IsValid = false;
                }
                if (yearhours >= 900)
                {
                    validationMsg.Messages.Add(Helper.EnumUtils.ToDescriptionString(ValidationMessages.YEAR_HOURS_EXCCEDED));
                    validationMsg.IsValid = false;
                }*/
            }
            return validationMsg;
        }
    }
}
