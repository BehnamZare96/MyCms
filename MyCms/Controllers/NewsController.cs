using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyCms.Controllers
{
    public class NewsController : Controller
    {
        // GET: News
        MyCmsContext db = new MyCmsContext();
        private IPageGroupRepository pageGroupRepository;
        private IPageRepository pageRepository;
        private IPageCommentRepository pageCommentRepository;
        public NewsController()
        {
            pageGroupRepository = new PageGroupRepository(db);
            pageRepository = new PageRepository(db);
            pageCommentRepository = new PageCommentRepository(db);
        }
        public ActionResult ShowGroups()
        {
            return PartialView(pageGroupRepository.GetGroupsForViews());
        }

        public ActionResult ShowGroupsInMenu()
        {
            return PartialView(pageGroupRepository.GetAllGroups());
        }

        public ActionResult TopNews()
        {
            return PartialView(pageRepository.TopNews());
        }

        public ActionResult LatesNews()
        {
            return PartialView(pageRepository.LastNews());
        }

        [Route("Archive")]
        public ActionResult ArchiveNews()
        {
            return View(pageRepository.GetAllPage());
        }

        [Route("Group/{id}/{title}")]
        public ActionResult ShowNewsByGroupId(int id,string title)
        {
            ViewBag.name = title;
            return View(pageRepository.ShowPageByGroupId(id));
        }

        [Route("News/{id}")]
        public ActionResult ShowNews(int id)
        {
            var news = pageRepository.GetPageById(id);

            if (news == null)
            {
                return HttpNotFound();
            }

            news.Visit += 1;
            pageRepository.UpdatePage(news);
            pageRepository.Save();

            return View(news);
        }

        public ActionResult AddComment(int id, string name, string email,string comment)
        {
            PageComment AddComment = new PageComment()
            {
                CreateDate = DateTime.Now,
                PageID = id,
                Comment = comment,
                Email = email,
                Name = name
            };

            pageCommentRepository.AddComment(AddComment);
            return PartialView("ShowComment", pageCommentRepository.GetCommentByNewsId(id));
        }

        public ActionResult ShowComment(int id)
        {
            return PartialView(pageCommentRepository.GetCommentByNewsId(id));
        }
    }
}