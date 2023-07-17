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
    public partial class Courses : System.Web.UI.Page
    {
        string connection = "data source=AMNA-NASEER;initial Catalog=SMSDB; persist security info=True; Integrated Security = SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            FetchDataFromDB();
        }

        protected void enterCourse_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "INSERT INTO Course (Course_Name, fee , Duration ) VALUES ('" + CName.Text + "', '" + fee.Text + "', '" + duration.Text + "')";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblError4.Text = "Your Data Has Been Saved In Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError4.Text = ex.Message;
            }
        }

        protected void FetchDataFromDB()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connection);
                string query = "Select * from Course";
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);

                da.Fill(dt);

                GridView4.DataSource = dt;
                GridView4.DataBind();
                conn.Close();
            }

            catch (Exception ex)
            {
                lblError4.Text = ex.Message;
            }
        }

        public void ClearFields()
        {
            CID.Text = string.Empty;
            CName.Text = string.Empty;
            fee.Text = string.Empty;
            duration.Text = string.Empty;

        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            CID.Text = GridView4.SelectedRow.Cells[1].Text;
            CName.Text = GridView4.SelectedRow.Cells[2].Text;
            fee.Text = GridView4.SelectedRow.Cells[3].Text;
            duration.Text = GridView4.SelectedRow.Cells[4].Text;

        }

        protected void replaceCourse_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "Update Course set Course_Name = '" + CName.Text + "', Fee = '" + fee.Text + "' , Duration = '" + duration.Text + "' Where Course_ID='" + CID.Text + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();

                lblError4.Text = "Your Data Has Been Updated in the  Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError4.Text = ex.Message;
            }
        }

        protected void delCourse_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "Delete From Course Where Course_ID= '" + CID.Text + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();

                lblError4.Text = "Your Data Has Been Deleted From the Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError4.Text = ex.Message;
            }

        }

        private void DisplayData()
        {
            throw new NotImplementedException();
        }
    }
}