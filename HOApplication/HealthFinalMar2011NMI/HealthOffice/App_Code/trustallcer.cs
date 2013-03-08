using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Security.Policy;
using System.Security.Cryptography;

namespace Policy
{
    public class TrsutAll : ICertificatePolicy
    {
        public bool CheckValidationResult(ServicePoint sp, X509Certificate cert, WebRequest request, int problem)
        {
            if (problem == -2146762487 || problem == 0 || problem == -2146762481)
                return true;

            return false;
        }
    }
}