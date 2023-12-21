<%@ Application Language="C#" %>
<%@ Import Namespace="MyNewWebsite" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
        Application.Add("Company", "ITPreneur,Deccaan Gymkhana,Pune");
    }
    void Session_Start(object sender,EventArgs e)
    {
        Session.Add("UserId", "");
        Session.Add("LoginName", "");
        Session.Add("UserRights", null);
    }
    void Session_End(object sender,EventArgs e)
    {
        Session.Clear();
        //Session.Add("UserId", "");
        //Session.Add("UserPass", "");
    }
</script>
