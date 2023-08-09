using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;

namespace LoginForm
{
    public partial class WebRegistration : System.Web.UI.Page
    {
        public static DataSet dsResult = new DataSet();


        [WebMethod]
        public static List<reg> RegistrationMenu(string name, string phone, string email, string id, string password)
        {
            List<reg> listmenu = new List<reg>();

            string cs = ConfigurationManager.ConnectionStrings["EMP"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
            SqlCommand comm = new SqlCommand("sp_reg", conn);
            comm.CommandType = CommandType.StoredProcedure;
          
            dsResult.Clear();

            SqlDataAdapter DA = new SqlDataAdapter("sp_reg", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@id", id);
            DA.SelectCommand.Parameters.AddWithValue("@password", password);
            DA.SelectCommand.Parameters.AddWithValue("@email", email);
            DA.SelectCommand.Parameters.AddWithValue("@phone", phone);
            DA.SelectCommand.Parameters.AddWithValue("@name", name);
    
            DA.Fill(dsResult);

   

            if (dsResult.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsResult.Tables[0].Rows)
                {
                    reg r = new reg();

                    r.name = dr[0].ToString();
                    r.phone = dr[1].ToString();
                    r.email = dr[2].ToString();
                    r.userid = dr[3].ToString();
                    r.password = dr[4].ToString();

                    listmenu.Add(r);
                }
            }

            conn.Close();
            return listmenu;
           
        }
    }
}