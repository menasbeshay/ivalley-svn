using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ITravel.Startup))]
namespace ITravel
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
