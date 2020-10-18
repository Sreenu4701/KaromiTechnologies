using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using DataAccessLayer.Models;

namespace DataAccessLayer
{
	public class Search
	{
		private const string connString = "Data Source=.;Initial Catalog=KaromiTechDB;Integrated Security=SSPI;";
		SqlConnection conObj = new SqlConnection(connString);

		public List<SearchListModel> SearchTrains(string sourceStop, string destStop, DateTime doj)
		{
			SqlCommand cmdObj = new SqlCommand("SELECT * FROM UFN_Search(sourceStop, destStop, doj)", conObj);
			List<SearchListModel> trainsList = new List<SearchListModel>();
			DataSet data = new DataSet();
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

					string[] StopsList = searchListModel.Stops.Split(',');
					string[] SourcesTimeList = searchListModel.SourcesTime.Split(',');
					string[] DestinationsList = searchListModel.DestinationsTime.Split(',');
					List<Source> tempSources = new List<Source>();
					List<Destination> tempDest = new List<Destination>();

					Source src = new Source();
					src.SourceName = searchListModel.Source;
					src.SourceTime = Convert.ToDateTime(SourcesTimeList[0]);
					tempSources.Add(src);
					for (int i = 0; i < StopsList.Length - 1; i++)
					{
						Source src1 = new Source();
						src1.SourceName = StopsList[i];
						src1.SourceTime = Convert.ToDateTime(SourcesTimeList[i + 1]);
						tempSources.Add(src1);
						Destination dst1 = new Destination();
						dst1.DestinationName = StopsList[i];
						dst1.DestinationTime = Convert.ToDateTime(DestinationsList[i]);
						tempDest.Add(dst1);

					}

					Destination dst = new Destination();
					dst.DestinationName = searchListModel.Destination;
					dst.DestinationTime = Convert.ToDateTime(DestinationsList[DestinationsList.Length - 1]);
					tempDest.Add(dst);

					searchListModel.Sources = tempSources;
					searchListModel.Destinations = tempDest;


					trainsList.Add(searchListModel);
				}
			}
			catch
			{
				trainsList = null;
			}

			return trainsList;
		}

		public int RailwayBookingList(int trainNumber, string name, string email, DateTime dOj, int mode, int noOfSeats, int fare, string src, string dest)
		{
			int result = 0;
			SqlCommand cmdObj = new SqlCommand("BookingSP", conObj);
			cmdObj.CommandType = CommandType.StoredProcedure;

			cmdObj.Parameters.AddWithValue("@TrainNumber", trainNumber);
			cmdObj.Parameters.AddWithValue("@Name", name);
			cmdObj.Parameters.AddWithValue("@Email", email);
			cmdObj.Parameters.AddWithValue("@Doj", dOj);
			cmdObj.Parameters.AddWithValue("@ModeOfJourney", mode);
			cmdObj.Parameters.AddWithValue("@NoOfSeats", noOfSeats);
			cmdObj.Parameters.AddWithValue("@TotalFare", fare);
			cmdObj.Parameters.AddWithValue("@Source", src);
			cmdObj.Parameters.AddWithValue("@Destination", dest);

			SqlParameter retObj = new SqlParameter("@ReturnValue", System.Data.SqlDbType.Int);
			retObj.Direction = System.Data.ParameterDirection.ReturnValue;
			cmdObj.Parameters.Add(retObj);

			try
			{
				conObj.Open();
				cmdObj.ExecuteNonQuery();
				result = Convert.ToInt32(retObj.Value);

			}
			catch
			{
				result = -99;

			}

			finally
			{
				conObj.Close();

			}
			return result;
		}
	}

}
