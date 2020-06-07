using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Mvc;
using umbraco.NodeFactory;

using umbraco.interfaces;
using UrlRewritingNet.Web;
using UrlRewritingNet.Configuration;
using System.Text.RegularExpressions;


/// <summary>
/// Summary description for Global
/// </summary>
public class Global : Umbraco.Web.UmbracoApplication
{
    public void Init(HttpApplication application)
    {
     //   application.PreRequestHandlerExecute += new EventHandler(application_PreRequestHandlerExecute);
      //  application.EndRequest += (new EventHandler(this.Application_EndRequest));
    }
    public static void RegisterRoutes(RouteCollection routes)
    {


    }


    protected override void OnApplicationStarted(object sender, EventArgs e)
    {
        base.OnApplicationStarted(sender, e);
        CNXDEVSOFTCORE.CNXCore.CNXConfig.getConfig(Server.MapPath("/") + "\\ANC_Sys.conf", "umbraco", Server.MapPath("/") + "\\control.log");
        CNXDEVSOFTCORE.CNXCore.CNXConfig.initContext();
       
    //    RegisterRoutes(RouteTable.Routes);
    }

    private void application_PreRequestHandlerExecute(object sender, EventArgs e)
    {
        try
        {            
            if (Session != null && Session.IsNewSession)
            {
                
            }

        }
        catch { }
    }

    private void Application_BeginRequest(object sender, EventArgs e)
    {
        

    }

    private void Application_EndRequest(object sender, EventArgs e)
    {
        
    }

    private void Application_Error(object sender, EventArgs e)
    {
      //  Exception exception = Server.GetLastError();
     //   Server.ClearError();      
        
 
    }

}