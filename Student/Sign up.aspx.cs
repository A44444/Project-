using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Linq;
using System.Drawing;
using WebGrease.Activities;
using System.Security.Cryptography;
using System.Net;
using System.Diagnostics;

namespace Student
{
    public partial class Sign_up : System.Web.UI.Page
    {
        string connection = "data source=AMNA-NASEER;initial Catalog=SMSDB; persist security info=True; Integrated Security = SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Enterinfo_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connection);
                string query = "Select * from NEW_Users where Email='"+txtemail.Text+"' and Password='"+txtpass.Text+"'" ;
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                conn.Close();
                da.Fill(dt);

                if(dt.Rows.Count>0)
                {
                    Response.Redirect("~/Project.aspx");
                }
                else
                {
                    lblError1.Text = "Username or Password is incorrect";
                }

            }

            catch (Exception ex)
            {
                lblError1.Text = ex.Message;
            }

           
        }
        protected void FetchDataFromDB()
        {
           
        }
        public void ClearFields()
        {
          //  Enterinfo.Text = string.Empty;
          // reg.Text = string.Empty;
            fullname.Text = string.Empty;
            phonenumber.Text = string.Empty;
            Regmail.Text = string.Empty;
            Rpass.Text = string.Empty;

        }  

        protected void reg_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "INSERT INTO New_Users (User_Name,Contact,Email,Password) Values ('" + fullname.Text + "', '" + phonenumber.Text + "', '" + Regmail.Text + "' , '" + Rpass.Text + "')";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblError1.Text = "Your Data Has Been Saved In Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
            
        }
    }
}