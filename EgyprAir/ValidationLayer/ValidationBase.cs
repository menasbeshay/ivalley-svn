using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ValidationLayer
{
    public abstract class ValidationBase
    {
        /// has properties about
        /// 1- validation type (warning , block or not working)
        /// 2- Validation Message 
        /// 3- validation result
        private int _ruleConfigType;
        private List<string> _validationMsg;
        private bool _result;
        public ValidationBase()
        {
            ValidationMsg = new List<string>();
        }
        public enum RuleConfigurationType
        {
            Warning = 1, 
            Blocking = 2, 
            Ignore = 3
        }

        public RuleConfigurationType RuleConfigType
        {
            get { return (RuleConfigurationType)_ruleConfigType; }
            set { _ruleConfigType = (int)value; }

        }

        public List<string> ValidationMsg
        {
            get { return _validationMsg; }
            set { _validationMsg = value; }
        }

        public bool ValidationResult
        {
            get { return _result; }
            set { _result = value; }
        }
 
    }

    public enum ValidationRuleToApply
    {
        WORKING_HOURS = 0,
        FLIGHT_DUTY_PERIOD = 1
    }
}
