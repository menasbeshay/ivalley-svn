using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace Helper
{
    public class DataBinding
    {
        public static List<Helper.BoundProperty> GetBoundFields<T>()
        {
            List<Helper.BoundProperty> fields = new List<BoundProperty>();
            var properties=typeof(T).GetProperties();
            return GetBoundFields(fields, properties);
        }

        public static List<Helper.BoundProperty> GetBoundFields(object val)
        {
            List<Helper.BoundProperty> fields = new List<BoundProperty>();
            var properties = val.GetType().GetProperties();
            return GetBoundFields(fields, properties);
        }
        private static List<BoundProperty> GetBoundFields(List<Helper.BoundProperty> fields, PropertyInfo[] properties)
        {
            foreach (PropertyInfo propertyInfo in properties)
            {
                foreach (object attribute in propertyInfo.GetCustomAttributes(true))
                {
                    if (attribute is Helper.BoundProperty)
                    {
                        var field = (Helper.BoundProperty)attribute;
                        field.PropertyName = propertyInfo.Name;
                        fields.Add(field);
                    }
                }
            }

            return fields.OrderBy(f => f.DisplayOrder).ToList(); ;
        }
    }
}
