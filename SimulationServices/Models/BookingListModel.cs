using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SimulationServices.Models
{
    public class BookingListModel
    {
        [Required(ErrorMessage = "TrainNumber is required")]
        public int TrainNumber { get; set; }

        [Required(ErrorMessage = "ModeOfJourney is required")]
        public int ModeOfJourney { get; set; }

        [Required(ErrorMessage = "NoOfSeats is required")]
        public int NoOfSeats { get; set; }

        [Required(ErrorMessage = "TotalFare is required")]
        public int TotalFare { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Required(ErrorMessage = "Name is required")]
        [DataType(DataType.Text)]
        public string Name { get; set; }

        [Required(ErrorMessage = "Source is required")]
        [DataType(DataType.Text)]
        public string Source { get; set; }

        [Required(ErrorMessage = "Destination is required")]
        [DataType(DataType.Text)]
        public string Destination { get; set; }

        [Required(ErrorMessage = "DOJ is required")]
        [DataType(DataType.DateTime)]
        public DateTime DOJ { get; set; }
    }
}