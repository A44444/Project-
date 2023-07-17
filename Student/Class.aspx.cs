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

namespace Student
{
    public partial class Class : System.Web.UI.Page
    {
        string connection = "data source=AMNA-NASEER;initial Catalog=SMSDB; persist security info=True; Integrated Security = SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            FetchDataFromDB();
        }

        protected void btnenter_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "INSERT INTO Class (Class_Name, Description) VALUES ('" + ClsName.Text + "',  '" + Dis.Text + "')";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblError1.Text = "Your Data Has Been Saved In Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError1.Text = ex.Message;
            }
        }
        protected void FetchDataFromDB()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connection);
                string query = "Select * from Class";
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);

                da.Fill(dt);

                GridView11.DataSource = dt;
                GridView11.DataBind();
                conn.Close();
            }

            catch (Exception ex)
            {
                lblError1.Text = ex.Message;
            }
        }

        public void ClearFields()
        {
            ClsName.Text = string.Empty;
            Dis.Text = string.Empty;
        }

        protected void GridView11_SelectedIndexChanged(object sender, EventArgs e)
        {
            CID.Text = GridView11.SelectedRow.Cells[1].Text;
            ClsName.Text = GridView11.SelectedRow.Cells[2].Text;
            Dis.Text = GridView11.SelectedRow.Cells[3].Text;
        }
       

        protected void Up_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "Update Class set Class_Name = '" + ClsName.Text + "', Description = '" + Dis.Text + "' Where Class_ID='" + CID.Text + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();

                lblError1.Text = "Your Data Has Been Updated in the  Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError1.Text = ex.Message;
            }
        }
        protected void btndel_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "Delete From Class Where Class_ID= '" + CID.Text + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();

                lblError1.Text = "Your Data Has Been Deleted From the Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError1.Text = ex.Message;
            }
        }

        private void DisplayData()
        {
            throw new NotImplementedException();
        }

    }
}