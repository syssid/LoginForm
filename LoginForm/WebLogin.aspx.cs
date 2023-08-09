using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using System.Configuration;
using Excel = Microsoft.Office.Interop.Excel;
using System.Net.Http;


namespace LoginForm
{
    public partial class WebLogin : System.Web.UI.Page
    {

        public static DataSet dsResult = new DataSet();

        [WebMethod]
        public static List<menu> LoginMenu(string id, string password)
        {

            List<menu> listmenu = new List<menu>();

            string cs = ConfigurationManager.ConnectionStrings["EMP"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
            SqlCommand comm = new SqlCommand("spmenu", conn);
            comm.CommandType = CommandType.StoredProcedure;

            SqlParameter UserID = new SqlParameter("@id", SqlDbType.VarChar, 20);
            UserID.Value = id;
            comm.Parameters.Add(UserID);

            SqlParameter Password = new SqlParameter("@pass", SqlDbType.VarChar, 20);
            Password.Value = password;
            comm.Parameters.Add(Password);

            //comm.ExecuteNonQuery();

            dsResult.Clear();

            SqlDataAdapter DA = new SqlDataAdapter(comm);
            DA.Fill(dsResult);

            conn.Close();

            if (dsResult.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsResult.Tables[0].Rows)
                {
                    menu m = new menu();
                    m.id = dr[0].ToString();
                    m.name = dr[1].ToString();

                    listmenu.Add(m);
                }
            }

            return listmenu;
        }
        [WebMethod]
        public static List<menu> DeleteEmployeeDetails(string id)
        {
            List<menu> listmenu = new List<menu>();

            string cs = ConfigurationManager.ConnectionStrings["EMP"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();

            SqlCommand cmd = new SqlCommand("spdeletemenu", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter idParam = new SqlParameter("@id", SqlDbType.VarChar, 20);
            idParam.Value = id;
            cmd.Parameters.Add(idParam);
            dsResult.Clear();

            SqlDataAdapter DA = new SqlDataAdapter();
            DA.SelectCommand = cmd;
            DA.Fill(dsResult);



            if (dsResult.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsResult.Tables[0].Rows)
                {
                    menu m = new menu();

                    m.id = dr[0].ToString();
                    m.name = dr[1].ToString();

                    listmenu.Add(m);
                }
            }

            con.Close();
            return listmenu;
        }

        [WebMethod]
        public static List<menu> UpdateData(string id, string password)
        {
            List<menu> listmenu = new List<menu>();

            string cs = ConfigurationManager.ConnectionStrings["EMP"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();

            SqlCommand comm = new SqlCommand("sp_log", conn);
            comm.CommandType = CommandType.StoredProcedure;

            SqlParameter UserID = new SqlParameter("@id", SqlDbType.VarChar, 20);
            UserID.Value = id;
            comm.Parameters.Add(UserID);

            SqlParameter Password = new SqlParameter("@pass", SqlDbType.VarChar, 20);
            Password.Value = password;
            comm.Parameters.Add(Password);

            dsResult.Clear();

            SqlDataAdapter DA = new SqlDataAdapter();
            DA.SelectCommand = comm;
            DA.Fill(dsResult);

            conn.Close();

            if (dsResult.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsResult.Tables[0].Rows)
                {
                    menu m = new menu();

                    m.id = dr[0].ToString();
                    m.name = dr[1].ToString();

                    listmenu.Add(m);
                }
            }

            return listmenu;

        }

        [WebMethod]
        public static List<reg> CheckRegistration(string id)
        {
            List<reg> listmenu = new List<reg>();

            string cs = ConfigurationManager.ConnectionStrings["EMP"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);

            string qry = "select id from user_registration where id='" + id + "'";
            SqlCommand comm = new SqlCommand(qry, conn);
            conn.Open();
            SqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                reg m = new reg();

                m.userid = sdr[0].ToString();
                m.name = sdr[1].ToString();

                listmenu.Add(m);
            }

            conn.Close();
            return listmenu;

        }

        [WebMethod]
        public static List<reg> getLogin(string id, string password)
        {
            List<reg> listmenu = new List<reg>();

            string cs = ConfigurationManager.ConnectionStrings["EMP"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);

            string qry = "select id , password from user_registration where id='" + id + "' and password='" + password + "'";
            SqlCommand comm = new SqlCommand(qry, conn);
            conn.Open();
            SqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                reg m = new reg();

                m.userid = sdr[0].ToString();
                m.name = sdr[1].ToString();

                listmenu.Add(m);
            }

            conn.Close();
            return listmenu;

        }

        [WebMethod]
        public static List<reg> UpdatePassword(string id , string password)
        {
            List<reg> listmenu = new List<reg>();

            string cs = ConfigurationManager.ConnectionStrings["EMP"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);
           
            SqlCommand comm = new SqlCommand("SP_PASS", conn);
            comm.CommandType = CommandType.StoredProcedure;

            SqlParameter UserID = new SqlParameter("@id", SqlDbType.VarChar, 20);
            UserID.Value = id;
            comm.Parameters.Add(UserID);

            SqlParameter Password = new SqlParameter("@pass", SqlDbType.VarChar, 20);
            Password.Value = password;
            comm.Parameters.Add(Password);

            dsResult.Clear();

            SqlDataAdapter DA = new SqlDataAdapter();
            DA.SelectCommand = comm;
            DA.Fill(dsResult);

            conn.Close();

            if (dsResult.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsResult.Tables[0].Rows)
                {
                    reg m = new reg();

                    m.userid = dr[0].ToString();
                    m.name = dr[1].ToString();

                    listmenu.Add(m);
                }
            }


            return listmenu;

        }
    }
}