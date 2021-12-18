using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public class PageRepository : IPageRepository
    {
        private MyCmsContext db;

        public PageRepository(MyCmsContext context)
        {
            this.db = context;
        }
        public IEnumerable<Page> GetAllPage()
        {
            return db.Pages;
        }

        public Page GetPageById(int pageid)
        {
            return db.Pages.Find(pageid);
        }

        public bool InsertPage(Page page)
        {
            try
            {
                db.Pages.Add(page);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool UpdatePage(Page page)
        {
            try
            {
                db.Entry(page).State = EntityState.Modified;
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool DeletePage(Page page)
        {
            try
            {
                db.Entry(page).State = EntityState.Deleted;
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool DeletePage(int pageid)
        {
            try
            {
                var group = GetPageById(pageid);
                DeletePage(group);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public void Save()
        {
            db.SaveChanges();
        }

        public void Dispose()
        {
            db.Dispose();
        }

        public IEnumerable<Page> TopNews(int take = 4)
        {
            return db.Pages.OrderByDescending(p => p.Visit).Take(take);
        }

        public IEnumerable<Page> PagesInSlider()
        {
            return db.Pages.Where(p => p.ShowInSlider == true);
        }

        public IEnumerable<Page> LastNews(int take = 4)
        {
            return db.Pages.OrderByDescending(p => p.CreateDate).Take(take);
        }

        public IEnumerable<Page> ShowPageByGroupId(int groupId)
        {
            return db.Pages.Where(p => p.GroupID == groupId);
        }

        public IEnumerable<Page> SearchPage(string search)
        {
            return db.Pages.Where(p => p.Title.Contains(search) || p.ShortDescription.Contains(search) || 
            p.tag.Contains(search) || p.Text.Contains(search)).Distinct();
        }
    }
}
