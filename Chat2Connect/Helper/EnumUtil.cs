using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Helper
{
    public static class EnumUtil
    {
        public static IEnumerable<T> GetValues<T>()
        {
            return Enum.GetValues(typeof(T)).Cast<T>();
        }

        /// <summary>
        /// Try to parse string to enum type
        /// </summary>
        /// <typeparam name="T">Type of the enum</typeparam>
        /// <param name="name">enum string</param>
        /// <returns></returns>
        public static T ParseEnum<T>(string name)
        {
            if (Enum.IsDefined(typeof(T), name))
                return (T)Enum.Parse(typeof(T), name, true);
            throw new NotImplementedException(String.Format("Invalid name '{0}' Of type '{1}'", name, typeof(T).Name));
        }

        /// <summary>
        /// parse enum from its value
        /// </summary>
        /// <typeparam name="T">type of the enum</typeparam>
        /// <param name="value">value to parse</param>
        /// <returns></returns>
        public static T ParseEnum<T>(int value)
        {
            if (value == 0)
                value = 1;
            if (Enum.IsDefined(typeof(T), value))
                return (T)Enum.ToObject(typeof(T), value);
            throw new Exception("invalid value of enum");
        }

        public static bool HasValue<T>(int value)
        {
            if (Enum.IsDefined(typeof(T), value))
                return true;
            return false;
        }
    }

}
