using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(vstudio.Startup))]
namespace vstudio
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
