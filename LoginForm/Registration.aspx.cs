using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Threading.Tasks;

namespace LoginForm
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpClient client = new HttpClient();

                client.DefaultRequestHeaders.Add("User-Agent", "PostmanRuntime/7.29.2");

                 CallApi(client);
            }
        }

        static void CallApi(HttpClient client)
        {
            var json = client.GetStringAsync("https://api.github.com/orgs/dotnet/repos");
        }
    }
}