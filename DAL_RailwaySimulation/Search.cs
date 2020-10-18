using System;
using System.Data.SqlTypes;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using DAL_RailwaySimulation.Models;

namespace DAL_RailwaySimulation
{
	public class Search
	{
		public List<SearchListModel> SearchTrains(string sourceStop, string destStop, DateTime doj)
		{

			private const string connString = "Data Source=.;Initial Catalog=KaromiTechDB;Integrated Security=SSPI;";

		SqlConnection conObj = new SqlConnection(connString);
		SqlCommand cmdObj = new SqlCommand("SELECT * FROM UFN_Search(sourceStop, destStop, doj)", conObj);
		List<SearchListModel> trainsList = new List<SearchListModel>();

		SqlDataAdapter adObj = new SqlDataAdapter(cmdObj);
	        try
	        {
	            adObj.Fill(data);
	            foreach (DataRow row in data.Tables[0].Rows)
		        {
		        	SearchListModel searchListModel = new SearchListModel();
		searchListModel.TrainNumber = Convert.ToInt32(row["TrainNumber"]);
		        	searchListModel.TrainName = Convert.ToString(row["TrainName"]);
		        	searchListModel.Source = Convert.ToString(row["Source"]);
		        	searchListModel.Destination = Convert.ToString(row["Destination"]);
		        	searchListModel.Stops = Convert.ToString(row["Stops"]);
		        	searchListModel.SourcesTime = Convert.ToString(row["SLTime"]);
		        	searchListModel.DestinationsTime = Convert.ToString(row["DLTime"]);

		        	trainsList.Add(searchListModel);	        	
		        }
}

			catch
{
	trainsList = null;
}

return trainsList;
        }


public int BookingList()
{

}
    }

}
