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
        /// 
        private int _ruleConfigType;
        private List<string> _validationMsg;
        protected enum RuleConfigurationType
        {
            Warning = 0, 
            Blocking = 1, 
            Ignore = 2
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
 
    }
}
