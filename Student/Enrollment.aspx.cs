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
using System.Reflection.Emit;

namespace Student
{
    public partial class Enrollment : System.Web.UI.Page
    {
        string connection = "data source=AMNA-NASEER;initial Catalog=SMSDB; persist security info=True; Integrated Security = SSPI;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadDataDDLCourse();
                LoadDataDDLStudent();
                LoadDataDDLTeacher();
            }
            
        }

        protected void ddlstudents_SelectedIndexChanged(object sender, EventArgs e)
        {

        
        }
        protected void ddlcourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            

        }

        protected void ddlteacher_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void LoadDataDDLCourse()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connection);
                string query = "SELECT * from Course";
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);

                da.Fill(dt);

                ddlcourse.DataSource = dt;
                ddlcourse.DataTextField = "Course_Name";
                ddlcourse.DataValueField= "Course_Id";
                ddlcourse.DataBind();
                conn.Close();

        


            }

            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }

        }

        // new load function for student field 
        public void LoadDataDDLStudent()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connection);
                string query = "SELECT * from S_Management";
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);

                da.Fill(dt);

                ddlstudents.DataSource = dt;
                ddlstudents.DataTextField = "S_Name";
                ddlstudents.DataValueField = "S_ID";
                ddlstudents.DataBind();
                conn.Close();

            


            }

            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }

        }

        // new function for teacher id field 

        public void LoadDataDDLTeacher()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connection);
                string query = "SELECT * from Teacher";
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);

                da.Fill(dt);

                ddlteacher.DataSource = dt;
                ddlteacher.DataTextField = "T_Name";
                ddlteacher.DataValueField = "T_ID";
                ddlteacher.DataBind();
                conn.Close();

           


            }

            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                string caldate = date.SelectedDate.ToString("MM/dd/yyyy");


                SqlConnection conn = new SqlConnection(connection);
                string query = "INSERT INTO Enrollment (Date, S_ID,Course_ID, T_ID) VALUES (' " + caldate + " ', " + ddlstudents.SelectedValue.ToString() + ", " + ddlcourse.SelectedValue.ToString() + "," + ddlteacher.SelectedValue.ToString() + ")";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();

                lblError.Text = "Your Data Has Been Saved in the  Database.";
                DisplayDataa();

                form1.Visible = false;
            }

            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }


        public void DisplayDataa()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connection);
                string query = "Select st.S_Name,st.S_Age,cr.Course_Name,cr.Fee,cr.Duration,T.T_Name,en.date from Enrollment en inner join S_Management st  on st.S_ID=en.S_ID  inner join Course cr on cr.Course_ID = en.Course_ID inner join Teacher T  on T.T_ID = en.T_ID  WHERE T_Name  LIKE 'a%' order by st.S_Age";
                SqlCommand cmd = new SqlCommand(query, conn);
              
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);

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

        protected void Search_Click(object sender, EventArgs e)
        {
                
                Displaysearch();
            form1.Visible = false;
        }
        public void Displaysearch()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connection);
                string query = "Select st.S_Name,st.S_Age,cr.Course_Name,cr.Fee,cr.Duration,T.T_Name,en.date from Enrollment en inner join S_Management st  on st.S_ID=en.S_ID  inner join Course cr on cr.Course_ID = en.Course_ID inner join Teacher T  on T.T_ID = en.T_ID  WHERE S_Name  LIKE '%"+txtsearch.Text+"%' order by st.S_Age";
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);

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

        // Bracket Close 
    }


}