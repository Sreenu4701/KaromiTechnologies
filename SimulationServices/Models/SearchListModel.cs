using System;
using System.Collections.Generic;
using System.Text;

namespace SimulationServices.Models
{
    public class SearchListModel
    {
        public int TrainNumber { get; set; }
        public string TrainName { get; set; }
        public string Source { get; set; }
        public string Destination { get; set; }
        public string Stops { get; set; }
        public string SourcesTime { get; set; }
        public string DestinationsTime { get; set; }
        public List<Source> Sources { get; set; }
        public List<Destination> Destinations { get; set; }

    }

    public class Source
    {
        public string SourceName { get; set; }
        public DateTime SourceTime { get; set; }
    }

    public class Destination
    {
        public string DestinationName { get; set; }
        public DateTime DestinationTime { get; set; }
    }
}
