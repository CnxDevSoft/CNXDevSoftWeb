//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Cnxdevsoft.Data.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class umbracoUserStartNode
    {
        public int id { get; set; }
        public int userId { get; set; }
        public int startNode { get; set; }
        public int startNodeType { get; set; }
    
        public virtual umbracoNode umbracoNode { get; set; }
        public virtual umbracoUser umbracoUser { get; set; }
    }
}
