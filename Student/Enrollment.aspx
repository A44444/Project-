<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enrollment.aspx.cs" Inherits="Student.Enrollment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Enrollment Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

    <style>
        body {
  font-family: Lucida Console, Courier New, monospace;
  background-color: #f5f5f5;
  background-image: url('picture/pict.jpg');
  background-size: cover; /* Adjust to your needs */
  background-position: center center;
}

.containerE {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  height: 800px; /* Adjust the height as needed */
  overflow-block: scroll; /* Enable vertical scrolling */
}

.form-wrapperE {
  justify-content: center;
  max-width: 900px;
  padding: 40px;
  background-color: #329ea8;
  border-radius: 5px;
  border: 50px solid #dddddd;
  border-left-color: whitesmoke;
  border-top-color: whitesmoke;
  border-right-color: whitesmoke;
  border-bottom-color: whitesmoke;
}

.form-wrapperE th,
.form-wrapperE td {
  justify-content: center;
  text-align: center;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #cccccc;
  border-radius: 4px;
}

.form-wrapperE th {
  background-color: #084688;
  color: #021224;
  padding: 10px;
  font-size: 16px;
}

.btn {
  width: 9em;
  height: 3em;
  border-radius: 30em;
  font-size: 15px;
  font-family: inherit;
  border: none;
  overflow: hidden;
  z-index: 1;
  box-shadow: 6px 6px 12px #c5c5c5,
            -6px -6px 12px #ffffff;
}

.btn:hover {
  content: '';
  width: 0;
  height: 3em;
  border-radius: 30em;
  top: 0;
  left: 0;
  background-image: linear-gradient(to right, #1F6E8C 0%, #0E2954 100%);
  transition: .50s ease;
  display: block;
  z-index: -1;
}

.btn:hover::before {
  width: 15em;
}

.checkbox-wrapper-5 .check {
  --size: 40px;
  position: relative;
  background: linear-gradient(90deg, #f19af3, #f099b5);
  line-height: 0;
  perspective: 400px;
  font-size: var(--size);
}

.checkbox-wrapper-5 .check input[type="checkbox"],
  .checkbox-wrapper-5 .check label,
  .checkbox-wrapper-5 .check label::before,
  .checkbox-wrapper-5 .check label::after,
  .checkbox-wrapper-5 .check {
  appearance: none;
  display: inline-block;
  border-radius: var(--size);
  border: 0;
  transition: .35s ease-in-out;
  box-sizing: border-box;
  cursor: pointer;
}

.checkbox-wrapper-5 .check label {
  width: calc(2.2 * var(--size));
  height: var(--size);
  background: #d7d7d7;
  overflow: hidden;
}

.checkbox-wrapper-5 .check input[type="checkbox"] {
  position: absolute;
  z-index: 1;
  width: calc(.8 * var(--size));
  height: calc(.8 * var(--size));
  top: calc(.1 * var(--size));
  left: calc(.1 * var(--size));
  background: linear-gradient(45deg, #dedede, #ffffff);
  box-shadow: 0 6px 7px rgba(0,0,0,0.3);
  outline: none;
  margin: 0;
}

.checkbox-wrapper-5 .check input[type="checkbox"]:checked {
  left: calc(1.3 * var(--size));
}

.checkbox-wrapper-5 .check input[type="checkbox"]:checked + label {
  background: transparent;
}

.checkbox-wrapper-5 .check label::before,
  .checkbox-wrapper-5 .check label::after {
  content: "· ·";
  position: absolute;
  overflow: hidden;
  left: calc(.15 * var(--size));
  top: calc(.5 * var(--size));
  height: var(--size);
  letter-spacing: calc(-0.04 * var(--size));
  color: #9b9b9b;
  font-family: "Times New Roman", serif;
  z-index: 2;
  font-size: calc(.6 * var(--size));
  border-radius: 0;
  transform-origin: 0 0 calc(-0.5 * var(--size));
  backface-visibility: hidden;
}

.checkbox-wrapper-5 .check label::after {
  content: "●";
  top: calc(.65 * var(--size));
  left: calc(.2 * var(--size));
  height: calc(.1 * var(--size));
  width: calc(.35 * var(--size));
  font-size: calc(.2 * var(--size));
  transform-origin: 0 0 calc(-0.4 * var(--size));
}

.checkbox-wrapper-5 .check input[type="checkbox"]:checked + label::before,
  .checkbox-wrapper-5 .check input[type="checkbox"]:checked + label::after {
  left: calc(1.55 * var(--size));
  top: calc(.4 * var(--size));
  line-height: calc(.1 * var(--size));
  transform: rotateY(360deg);
}

.checkbox-wrapper-5 .check input[type="checkbox"]:checked + label::after {
  height: calc(.16 * var(--size));
  top: calc(.55 * var(--size));
  left: calc(1.6 * var(--size));
  font-size: calc(.6 * var(--size));
  line-height: 0;
}

.error-message {
  color: red;
  margin-top: 10px;
}

/* GridView styling */
.gridview1 {
  width: 100%;
  margin-top: 20px;
  border-collapse: collapse;
}

.gridview1 th,
.gridview1 td {
  text-align: center;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #cccccc;
  border-radius: 4px;
}

.gridview1 th {
  background-color: #084688;
  color: #021224;
  padding: 10px;
  font-size: 16px;
}

/* Center the form */
.form-wrapperE {
  margin: 0 auto;
}
  
    </style>
</head>
<body>
    <div class="containerE">
        <div class="form-wrapperE">
    <form id="form1E" runat="server">
        <div id="form1" runat="server">
       <div>
            <asp:Label ID="Label1" runat="server" Text="Student_ID" style="font-size: 18px;"></asp:Label>
            <asp:DropDownList ID="ddlstudents" runat="server"  OnSelectedIndexChanged="ddlstudents_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="">Please Select</asp:ListItem>   
            </asp:DropDownList>
        </div> 
        <div>
            <asp:Label ID="Label2" runat="server" Text="Course_ID" style="font-size: 18px;"></asp:Label>
            <asp:DropDownList ID="ddlcourse" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlcourse_SelectedIndexChanged">  
            </asp:DropDownList>
        </div> 
         <div>
             <asp:Label ID="Label3" runat="server" Text="Teacher_ID" style="font-size: 18px;"></asp:Label>
            <asp:DropDownList ID="ddlteacher" runat="server" OnSelectedIndexChanged="ddlteacher_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
        </div> 
           <div>
                    <asp:Label ID="enroll1" runat="server" Text="Enrollment_ID" style="font-size:  18px;"></asp:Label>
                    <asp:TextBox ID="Enroll" runat="server"></asp:TextBox> 
               <div class="w3-container">
 
             <asp:Label ID="date1" runat="server" Text="Date" style="font-size: 18px;" class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Date  </asp:Label>
        <asp:Calendar ID="date" runat="server"></asp:Calendar>
            </div>
                </div>
         <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Button ID="Submit" runat="server" Text="SUBMIt" OnClick="Submit_Click"
                         CssClass="btn" />
                </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        </div>
       </div>
        

        <div>
            <asp:GridView ID="GridView1" runat="server" Text="Select" CssClass="gridview1" >

            </asp:GridView>
        </div>
          <div  style="display: flex; justify-content: center; align-items: center;">
              <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
            <asp:Button ID="btn_search" runat="server" Text="SEACRH"  OnClick="Search_Click"
                CssClass="checkbox-wrapper-5 .check" />
        </div>
       
    </form>
        </div>
       </div>
    
   
    
</body>
</html>
