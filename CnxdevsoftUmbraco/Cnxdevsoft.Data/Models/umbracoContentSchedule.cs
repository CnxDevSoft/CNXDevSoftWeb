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
    
    public partial class umbracoContentSchedule
    {
        public System.Guid id { get; set; }
        public int nodeId { get; set; }
        public Nullable<int> languageId { get; set; }
        public System.DateTime date { get; set; }
        public string action { get; set; }
    
        public virtual umbracoContent umbracoContent { get; set; }
        public virtual umbracoLanguage umbracoLanguage { get; set; }
    }
}