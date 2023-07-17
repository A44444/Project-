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

namespace Student
{
    public partial class Teacher : System.Web.UI.Page
    {
        string connection = "data source=AMNA-NASEER;initial Catalog=SMSDB; persist security info=True; Integrated Security = SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            FetchDataFromDB();
          
        }

        protected void btnent_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "INSERT INTO Teacher (T_Name,T_Email, Courses,Education) VALUES ('" + TName.Text + "', '" + TMail.Text + "', '" + TCourses.Text + "' , '" + TEducation.Text + "')";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblError2.Text = "Your Data Has Been Saved In Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError2.Text = ex.Message;
            }
        }

        protected void FetchDataFromDB()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connection);
                string query = "Select * from Teacher";
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);

                da.Fill(dt);

                GridView2.DataSource = dt;
                GridView2.DataBind();
                conn.Close();
            }

            catch (Exception ex)
            {
                lblError2.Text = ex.Message;
            }
        }

        public void ClearFields()
        {
            TName.Text = string.Empty;
            TMail.Text = string.Empty;
            TCourses.Text = string.Empty;
            TEducation.Text = string.Empty;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            TID.Text = GridView2.SelectedRow.Cells[1].Text;
            TName.Text = GridView2.SelectedRow.Cells[2].Text;
            TMail.Text = GridView2.SelectedRow.Cells[3].Text;
            TCourses.Text = GridView2.SelectedRow.Cells[4].Text;
            TEducation.Text = GridView2.SelectedRow.Cells[5].Text;
        }

        protected void Un_Up_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "Update Teacher set T_Name = '" + TName.Text + "', T_Email = '" + TMail.Text + "', Courses = '" + TCourses.Text + "', Education = '" + TEducation.Text + "' Where T_ID='" + TID.Text + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();

                lblError2.Text = "Your Data Has Been Updated in the  Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError2.Text = ex.Message;
            }
        }

        protected void delId_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "Delete From Teacher Where T_ID= '" + TID.Text + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();

                lblError2.Text = "Your Data Has Been Deleted From the Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError2.Text = ex.Message;
            }
        }

        private void DisplayData()
        {
            throw new NotImplementedException();
        }
    }
}