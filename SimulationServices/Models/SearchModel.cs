using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SimulationServices.Models
{
    public class SearchModel
    {

        [Required(ErrorMessage = "From Station is required")]
        [DataType(DataType.Text)]
        public string FromStation { get; set; }

        [Required(ErrorMessage = "To Station is required")]
        [DataType(DataType.Text)]
        public string ToStation { get; set; }

        [Required(ErrorMessage = "Date ogf Journey is required")]
        [DataType(DataType.DateTime)]
        public DateTime DOJ { get; set; }
    }
}