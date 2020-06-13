using Cnxdevsoft.Data.Models;
using Cnxdevsoft.Service.Common.Interface;
using Cnxdevsoft.Service.Common.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cnxdevsoft.Service.Common
{
    public class CommonServiceFactory  : IDisposable
    {

        private readonly CnxdevsoftContext _db = new CnxdevsoftContext();
        public ICnxdevsoftService CnxdevsoftService()
        {
            return new CnxdevsoftService();
        }
        public void Dispose()
        {
            _db.Dispose();
            GC.SuppressFinalize(this);
        }
    }
}
