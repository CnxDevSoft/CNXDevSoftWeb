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
    
    public partial class umbracoPropertyData
    {
        public int id { get; set; }
        public int versionId { get; set; }
        public int propertyTypeId { get; set; }
        public Nullable<int> languageId { get; set; }
        public string segment { get; set; }
        public Nullable<int> intValue { get; set; }
        public Nullable<decimal> decimalValue { get; set; }
        public Nullable<System.DateTime> dateValue { get; set; }
        public string varcharValue { get; set; }
        public string textValue { get; set; }
    
        public virtual cmsPropertyType cmsPropertyType { get; set; }
        public virtual umbracoContentVersion umbracoContentVersion { get; set; }
        public virtual umbracoLanguage umbracoLanguage { get; set; }
    }
}
