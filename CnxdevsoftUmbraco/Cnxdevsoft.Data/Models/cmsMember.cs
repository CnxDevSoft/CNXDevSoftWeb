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
    
    public partial class cmsMember
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public cmsMember()
        {
            this.umbracoNode = new HashSet<umbracoNode>();
        }
    
        public int nodeId { get; set; }
        public string Email { get; set; }
        public string LoginName { get; set; }
        public string Password { get; set; }
    
        public virtual umbracoContent umbracoContent { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<umbracoNode> umbracoNode { get; set; }
    }
}
