using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MTSA.Startup))]
namespace MTSA
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
