using DataAccessLayer;
using SimulationServices.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
using System.Windows.Forms;

namespace SimulationServices.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult RailwaySearch()
        {
            ViewBag.Title = "Home Page";

            return View();
        }

        [HttpGet]
        public JsonResult GetListOfTrains(string src, string dest, DateTime doj)
        {
            Search search = new Search();
            List<DataAccessLayer.Models.SearchListModel> searchList = new List<DataAccessLayer.Models.SearchListModel>();
            searchList = search.SearchTrains(src, dest, doj);

            return Json(searchList);
        }

        [HttpPost]
        public int BookingList(BookingListModel details)
        {
            int status = 0;
            try
            {
                Search search = new Search();
                status = search.RailwayBookingList(details.TrainNumber, details.Name, details.Email, details.DOJ, details.ModeOfJourney, details.NoOfSeats, details.TotalFare, details.Source, details.Destination);
            }
            catch
            {
                status = -99;
            }
            if (status == 1)
            {
                SendEmail(details.Email);
            }

            return status;
        }

        private void SendEmail(string toAddress)
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("KaromiNewTech@gmail.com");
                mail.To.Add(toAddress);
                mail.Subject = "Test Mail";
                mail.Body = "This is for testing SMTP mail from GMAIL";

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("username", "password");
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
                MessageBox.Show("mail Send");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }



        //public IActionResult Customers_Read([DataSourceRequest] DataSourceRequest request)
        //{
        //    return Json(GetCustomers().ToDataSourceResult(request));
        //}

        //private static IEnumerable<CustomerViewModel> GetCustomers()
        //{
        //    using (var northwind = new SampleEntitiesDataContext())
        //    {
        //        return northwind.Customers.Select(customer => new SearchListModel
        //        {
        //            CustomerID = customer.CustomerID,
        //            CompanyName = customer.CompanyName,
        //            ContactName = customer.ContactName,
        //            ContactTitle = customer.ContactTitle,
        //            Address = customer.Address,
        //            City = customer.City,
        //            Region = customer.Region,
        //            PostalCode = customer.PostalCode,
        //            Country = customer.Country,
        //            Phone = customer.Phone,
        //            Fax = customer.Fax,
        //            Bool = customer.Bool
        //        }).ToList();
        //    }
        //}


    }
}
