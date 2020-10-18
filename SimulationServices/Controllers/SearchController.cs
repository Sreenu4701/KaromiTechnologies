using SimulationServices.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using HttpGetAttribute = System.Web.Http.HttpGetAttribute;
using DataAccessLayer;

namespace SimulationServices.Controllers
{
    public class SearchController : Controller
    {
        // GET: api/Search
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Search/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Search
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Search/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Search/5
        public void Delete(int id)
        {
        }




        [HttpGet]
        public JsonResult GetListOfTrains(SearchModel searchModel)
        {
            Search search = new Search();
            List<DataAccessLayer.Models.SearchListModel> searchList = new List<DataAccessLayer.Models.SearchListModel>();
            searchList = search.SearchTrains(searchModel.FromStation, searchModel.ToStation, searchModel.DOJ);

            return Json(searchList);
        }

        

        //public ActionResult Index()
        //{
        //    ViewBag.Title = "Home Page";

        //    return View();
        //}
    }
}
