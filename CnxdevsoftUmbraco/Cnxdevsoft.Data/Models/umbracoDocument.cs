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
    
    public partial class umbracoDocument
    {
        public int nodeId { get; set; }
        public bool published { get; set; }
        public bool edited { get; set; }
    
        public virtual umbracoContent umbracoContent { get; set; }
    }
}
