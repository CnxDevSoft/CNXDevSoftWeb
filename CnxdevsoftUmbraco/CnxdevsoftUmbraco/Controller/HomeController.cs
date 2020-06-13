using Cnxdevsoft.Service.Common.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web.Models;
using Umbraco.Web.Mvc;

namespace CnxdevsoftUmbraco.Controller
{
    public class HomeController : RenderMvcController
    {
        //private readonly ICnxdevsoftService _cnxdevsoftService;
        //public HomeController(
        //         ICnxdevsoftService cnxdevsoftService
        //    )
        //{
        //    _cnxdevsoftService = cnxdevsoftService;

        //}
        public override ActionResult Index(ContentModel model)
        {
            // you are in control here!

            // return a 'model' to the selected template/view for this page.
            return CurrentTemplate(model);
        }
    }
}