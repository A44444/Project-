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
    public partial class Section : System.Web.UI.Page
    {
        string connection = "data source=AMNA-NASEER;initial Catalog=SMSDB; persist security info=True; Integrated Security = SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            FetchDataFromDB();
        }

        protected void enterSection_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "INSERT INTO Section (Section_Name, Shift) VALUES ('" + SName.Text + "', '" + Shift3.Text + "')";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblError3.Text = "Your Data Has Been Saved In Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError3.Text = ex.Message;
            }
        }

        protected void FetchDataFromDB()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connection);
                string query = "Select * from Section";
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);

                da.Fill(dt);

                GridView3.DataSource = dt;
                GridView3.DataBind();
                conn.Close();
            }

            catch (Exception ex)
            {
                lblError3.Text = ex.Message;
            }
        }

        public void ClearFields()
        {
            SName.Text = string.Empty;
            Shift3.Text = string.Empty;
           
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            SID.Text = GridView3.SelectedRow.Cells[1].Text;
            SName.Text = GridView3.SelectedRow.Cells[2].Text;
            Shift3.Text = GridView3.SelectedRow.Cells[3].Text;
            
        }

        protected void changeSection_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "Update Section set Section_Name = '" + SName.Text + "', Shift = '" + Shift3.Text + "' Where Section_ID='" + SID.Text + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();

                lblError3.Text = "Your Data Has Been Updated in the  Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError3.Text = ex.Message;
            }
        }

        protected void delSection_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "Delete From Section Where Section_ID= '" + SID.Text + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();

                lblError3.Text = "Your Data Has Been Deleted From the Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError3.Text = ex.Message;
            }
        }

        private void DisplayData()
        {
            throw new NotImplementedException();
        }

    }
}