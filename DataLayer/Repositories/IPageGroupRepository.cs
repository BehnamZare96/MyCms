using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public interface IPageGroupRepository:IDisposable
    {
        IEnumerable<PageGroup> GetAllGroups();
        PageGroup GetGroupById(int groupid);
        bool InsertGroup(PageGroup pageGroup);
        bool UpdateGroup(PageGroup pageGroup);
        bool DeleteGroup(PageGroup pageGroup);
        bool DeleteGroup(int groupid);
        void Save();

        IEnumerable<ShowGroupViewModel> GetGroupsForViews();
    }
}
