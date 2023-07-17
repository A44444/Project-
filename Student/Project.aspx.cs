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

// THIS IS A COMMENT 

namespace Student
{ 
    public partial class Project : System.Web.UI.Page
    {
        string connection = "data source=AMNA-NASEER;initial Catalog=SMSDB; persist security info=True; Integrated Security = SSPI;";
       
        protected void Page_Load(object sender, EventArgs e)
        {
            FetchDataFromDB();
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "INSERT INTO S_Management (S_Name, S_Age,S_Email, S_Password) VALUES ('" + TxtName.Text + "', " + TxtAge.Text + ", '" + Mail.Text + "', '" + pass.Text + "')";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblError.Text = "Your Data Has Been Saved In Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void FetchDataFromDB()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connection);
                string query = "Select * from S_Management";
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query,conn);
                
                da.Fill(dt);
                
                GridView1.DataSource = dt;
                GridView1.DataBind();
                conn.Close();
            }

            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        public void ClearFields()
            {
                TxtName.Text = string.Empty;
                TxtAge.Text = string.Empty;
                Mail.Text = string.Empty;
                pass.Text = string.Empty;
            }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SID.Text = GridView1.SelectedRow.Cells[1].Text;
            TxtName.Text = GridView1.SelectedRow.Cells[2].Text;
            TxtAge.Text = GridView1.SelectedRow.Cells[3].Text;
            Mail.Text = GridView1.SelectedRow.Cells[4].Text;
            pass.Text = GridView1.SelectedRow.Cells[5].Text;
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "Update S_Management set S_Name = '" + TxtName.Text + "',S_Age = " + TxtAge.Text + ", S_Email = '" + Mail.Text + "', S_Password ='" + pass.Text + "' Where S_ID='"+SID.Text+"'";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                
                conn.Close();

                lblError.Text = "Your Data Has Been Updated in the  Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connection);
                string query = "Delete From S_Management Where S_ID= '"+SID.Text+"'";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();

                lblError.Text = "Your Data Has Been Deleted From the Database.";

                ClearFields();
            }

            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void DisplayData()
        {
            throw new NotImplementedException();
        }

        }
    }
