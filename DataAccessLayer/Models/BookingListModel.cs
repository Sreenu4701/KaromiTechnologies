using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Models
{
    class BookingListModel
    {
        public int TrainNumber { get; set; }
        public int ModeOfJourney { get; set; }
        public int NoOfSeats { get; set; }
        public int TotalFare { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }
        public string Source { get; set; }
        public string Destination { get; set; }
        public DateTime DOJ { get; set; }

    }
}
