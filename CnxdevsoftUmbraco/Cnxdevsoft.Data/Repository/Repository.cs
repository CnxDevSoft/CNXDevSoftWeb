using Cnxdevsoft.Data.Models;
using Cnxdevsoft.Data.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cnxdevsoft.Data.Repository
{
    public class Repository<T> : IRepository<T> where T : class
    {

        public CnxdevsoftContext _context = null;
        public DbSet<T> table = null;
        public Repository()
        {

            this._context = new CnxdevsoftContext();
            this._context.Configuration.ValidateOnSaveEnabled = false;
            this.table = _context.Set<T>();
        }
        public Repository(CnxdevsoftContext _context)
        {
            this._context = _context;
            this.table = _context.Set<T>();
        }
        public IEnumerable<T> GetAll()
        {

            return table.ToList();
        }

        public T GetById(int id)
        {
            return table.Find(id);
        }
        public void Insert(T obj)
        {
            table.Add(obj);
        }
        public void Update(T obj)
        {
            table.Attach(obj);
            _context.Entry(obj).State = EntityState.Modified;
        }
        public void Delete(int id)
        {
            var data = table.Find(id);
            table.Remove(data);
        }
        public void Save()
        {
            _context.SaveChanges();
        }

    }
}
