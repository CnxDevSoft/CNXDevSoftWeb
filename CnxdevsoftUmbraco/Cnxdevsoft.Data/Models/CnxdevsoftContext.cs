using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace Cnxdevsoft.Data.Models
{
    public class CnxdevsoftContext : DbContext
    {
        public CnxdevsoftContext() : base("Default") { }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            Database.SetInitializer<CnxdevsoftContext>(null);
            //modelBuilder.Entity<User>().ToTable("Users");
            base.OnModelCreating(modelBuilder);
        }
    }
}