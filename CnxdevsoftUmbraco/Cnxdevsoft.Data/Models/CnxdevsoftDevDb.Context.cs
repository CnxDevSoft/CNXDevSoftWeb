﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CnxDevSoftDevEntities : DbContext
    {
        public CnxDevSoftDevEntities()
            : base("name=CnxDevSoftDevEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<cmsContentNu> cmsContentNu { get; set; }
        public virtual DbSet<cmsContentType> cmsContentType { get; set; }
        public virtual DbSet<cmsContentTypeAllowedContentType> cmsContentTypeAllowedContentType { get; set; }
        public virtual DbSet<cmsDictionary> cmsDictionary { get; set; }
        public virtual DbSet<cmsDocumentType> cmsDocumentType { get; set; }
        public virtual DbSet<cmsLanguageText> cmsLanguageText { get; set; }
        public virtual DbSet<cmsMacro> cmsMacro { get; set; }
        public virtual DbSet<cmsMacroProperty> cmsMacroProperty { get; set; }
        public virtual DbSet<cmsMember> cmsMember { get; set; }
        public virtual DbSet<cmsMemberType> cmsMemberType { get; set; }
        public virtual DbSet<cmsPropertyType> cmsPropertyType { get; set; }
        public virtual DbSet<cmsPropertyTypeGroup> cmsPropertyTypeGroup { get; set; }
        public virtual DbSet<cmsTagRelationship> cmsTagRelationship { get; set; }
        public virtual DbSet<cmsTags> cmsTags { get; set; }
        public virtual DbSet<cmsTemplate> cmsTemplate { get; set; }
        public virtual DbSet<umbracoAccess> umbracoAccess { get; set; }
        public virtual DbSet<umbracoAccessRule> umbracoAccessRule { get; set; }
        public virtual DbSet<umbracoAudit> umbracoAudit { get; set; }
        public virtual DbSet<umbracoCacheInstruction> umbracoCacheInstruction { get; set; }
        public virtual DbSet<umbracoConsent> umbracoConsent { get; set; }
        public virtual DbSet<umbracoContent> umbracoContent { get; set; }
        public virtual DbSet<umbracoContentSchedule> umbracoContentSchedule { get; set; }
        public virtual DbSet<umbracoContentVersion> umbracoContentVersion { get; set; }
        public virtual DbSet<umbracoContentVersionCultureVariation> umbracoContentVersionCultureVariation { get; set; }
        public virtual DbSet<umbracoDataType> umbracoDataType { get; set; }
        public virtual DbSet<umbracoDocument> umbracoDocument { get; set; }
        public virtual DbSet<umbracoDocumentCultureVariation> umbracoDocumentCultureVariation { get; set; }
        public virtual DbSet<umbracoDocumentVersion> umbracoDocumentVersion { get; set; }
        public virtual DbSet<umbracoDomain> umbracoDomain { get; set; }
        public virtual DbSet<umbracoExternalLogin> umbracoExternalLogin { get; set; }
        public virtual DbSet<umbracoKeyValue> umbracoKeyValue { get; set; }
        public virtual DbSet<umbracoLanguage> umbracoLanguage { get; set; }
        public virtual DbSet<umbracoLock> umbracoLock { get; set; }
        public virtual DbSet<umbracoLog> umbracoLog { get; set; }
        public virtual DbSet<umbracoMediaVersion> umbracoMediaVersion { get; set; }
        public virtual DbSet<umbracoNode> umbracoNode { get; set; }
        public virtual DbSet<umbracoPropertyData> umbracoPropertyData { get; set; }
        public virtual DbSet<umbracoRedirectUrl> umbracoRedirectUrl { get; set; }
        public virtual DbSet<umbracoRelation> umbracoRelation { get; set; }
        public virtual DbSet<umbracoRelationType> umbracoRelationType { get; set; }
        public virtual DbSet<umbracoServer> umbracoServer { get; set; }
        public virtual DbSet<umbracoUser> umbracoUser { get; set; }
        public virtual DbSet<umbracoUser2NodeNotify> umbracoUser2NodeNotify { get; set; }
        public virtual DbSet<umbracoUserGroup> umbracoUserGroup { get; set; }
        public virtual DbSet<umbracoUserGroup2App> umbracoUserGroup2App { get; set; }
        public virtual DbSet<umbracoUserGroup2NodePermission> umbracoUserGroup2NodePermission { get; set; }
        public virtual DbSet<umbracoUserLogin> umbracoUserLogin { get; set; }
        public virtual DbSet<umbracoUserStartNode> umbracoUserStartNode { get; set; }
    }
}