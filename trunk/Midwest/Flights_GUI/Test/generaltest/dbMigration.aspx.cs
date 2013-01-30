using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Flights_GUI.Test.generaltest
{
    public partial class dbMigration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            /*             
	
	            
             */
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection("Data Source=mena-pc;Initial Catalog=current_old_fr;Persist Security Info=True;User ID=sa;Password=sqladmin");
            SqlConnection con2 = new SqlConnection("Data Source=mena-pc;Initial Catalog=current_v2_fr;Persist Security Info=True;User ID=sa;Password=sqladmin");
            SqlCommand comm = new SqlCommand();
            comm.CommandText = @"SELECT F.ReportID , S.SectorID
                                 From Flight F 
                                 INNER JOIN Sector S ON F.ReportID = S.ReportID
                                 Where F.ReportID > 869
                                 ORDER BY F.ReportID";
            comm.Connection = con1;
            SqlDataAdapter da = new SqlDataAdapter(comm.CommandText,con1);
            SqlDataAdapter Crewda;
            SqlDataAdapter Pilotda;
            DataSet Sectorsds = new DataSet();
            DataSet Crewds = new DataSet();
            DataSet pilotds = new DataSet();
            
            da.Fill(Sectorsds);
            
            string start = "\r\n" + "data loaded " + " - " + Sectorsds.Tables[0].Rows.Count.ToString() + " rows";
            int allrows = Sectorsds.Tables[0].Rows.Count;
            TextBox1.Text += start;
            UpdatePanel1.Update();

            SqlCommand insCrewcomm = new SqlCommand();
            string crewSQL = @"insert INTO SectorCrew ( SectorID, CrewID , PositionID ) values (";  
	                                    /*SELECT @SectorID , FC.CrewID , FC.PositionID 
	                                    FROM Flight F 
	                                    INNER JOIN FlightCrew FC ON F.ReportID = FC.ReportID
	                                    where FC.ReportID = @ReportID";*/

            insCrewcomm.Connection = con2;

            SqlCommand crewSelect = new SqlCommand();
            crewSelect.Connection = con1;
            crewSelect.CommandText = @"SELECT FC.CrewID , FC.PositionID 
	                                    FROM Flight F 
	                                    INNER JOIN FlightCrew FC ON F.ReportID = FC.ReportID
	                                    where FC.ReportID = @ReportID";

            SqlCommand pilotSelect = new SqlCommand();
            pilotSelect.Connection = con1;
            pilotSelect.CommandText = @"SELECT FP.PilotID , FP.PositionID 
	                                     FROM Flight F 
	                                     INNER JOIN FlightPilot FP ON F.ReportID = FP.ReportID
	                                     where FP.ReportID = @ReportID";

            SqlCommand insPilotcomm = new SqlCommand();
            string pilotSQL = @"insert INTO SectorPilot ( SectorID, PilotID , PositionID ) values ("; 
	                                     /*SELECT @SectorID , FP.PilotID , FP.PositionID 
	                                     FROM Flight F 
	                                     INNER JOIN FlightPilot FP ON F.ReportID = FP.ReportID
	                                     where FP.ReportID = @ReportID";*/

            insPilotcomm.Connection = con2;
            

            int count = 0;
            //insCrewcomm.Parameters.Add("@SectorID", SqlDbType.Int);
            crewSelect.Parameters.Add("@ReportID", SqlDbType.Int);
            //insPilotcomm.Parameters.Add("@SectorID", SqlDbType.Int);
            pilotSelect.Parameters.Add("@ReportID", SqlDbType.Int);

            foreach (DataRow item in Sectorsds.Tables[0].Rows)
            {
                //insCrewcomm.Parameters["@SectorID"].Value = item["SectorID"];
                crewSelect.Parameters["@ReportID"].Value = item["ReportID"];
                Crewda = new SqlDataAdapter(crewSelect.CommandText, con1);
                Crewds.Clear();
                Crewda.Fill(Crewds);
                foreach (DataRow Crewitem in Crewds.Tables[0].Rows)
                {
                    insCrewcomm.CommandText = crewSQL + item["SectorID"] + "," + Crewitem["CrewID"] + "," + Crewitem["PositionID"] + ")";
                    insCrewcomm.Connection.Open();
                    insCrewcomm.ExecuteNonQuery();
                    insCrewcomm.Connection.Close();
                }
                //insPilotcomm.Parameters["@SectorID"].Value = item["SectorID"];
                pilotSelect.Parameters["@ReportID"].Value = item["ReportID"];
                Pilotda = new SqlDataAdapter(pilotSelect.CommandText, con1);
                pilotds.Clear();
                Pilotda.Fill(pilotds);
                foreach (DataRow pilotitem in pilotds.Tables[0].Rows)
                {
                    insPilotcomm.CommandText = pilotSQL + item["SectorID"] + "," + pilotitem["PilotID"] + "," + pilotitem["PositionID"] + ")";
                    insPilotcomm.Connection.Open();
                    insPilotcomm.ExecuteNonQuery();
                    insPilotcomm.Connection.Close();
                }
                
                count++;

                TextBox1.Text = start + "\r\n" + ((count * 1.0 / allrows * 1.0) * 100).ToString() + "%";
                UpdatePanel1.Update();
            }
            TextBox1.Text = start + "\r\n" + ((count * 1.0 / allrows * 1.0) * 100).ToString() + "% \r\n" + "Done...";            
            UpdatePanel1.Update();
        }
    }
}
