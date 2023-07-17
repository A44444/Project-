<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="Student.Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

   <style>
        body {
            font-family: Lucida Console, Courier New, monospace;
            background-color: #f5f5f5;
            background-image: url('picture/pict.jpg');
      background-size: cover; /* Adjust to your needs */
      background-position: center center; 
        }
  

        .navsection{
     width: 100%; height: 20vh; background-color:yellow ;
     display: flex; justify-content: space-around;
     align-items: center;
     background-image: linear-gradient(to top, #fff 80% , #c3f5ff 20%);
      font-family: Lucida Console, Courier New, monospace;
 }

 .logo{
     width: 35%;
     color :#fff;
     background-image: linear-gradient(#8d98e3 40%, #854fee 60%);
     padding-left: 100px;
     box-sizing: border-box;
 } 

 .logo h1{
      text-transform: uppercase;
      font-size: 200%;
      animation: aagepiche 2s linear infinite;
      animation-direction: alternate;
 }

 @keyframes aagepiche{
 	from { padding-left: 40px;}
 	to { padding-right: 40px; }
 }

 nav{
 	width: 60%;
 	/*background-color:yellow;*/
 	display:flex;
 	justify-content:space-around;
 }

 nav a{
 	text-decoration: none;
 	text-transform: uppercase;
 	color: #000;
 	font-weight: 900;
 	font-size: 150%;
 	position: relative;
    font-palette:dark
 }
   
 nav a:first-child{
 	color: #4458dc;
 }

 nav a:before{
    content: " ";
    position:absolute;
    top:110%;
    left:0;
    width:0;
    height:2px;
    border-bottom: 2px solid #4458dc;
    transition: all 0.4s linear;
 }

  nav a:hover:before{
  	width: 100%;
  }

        .containerT {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            height: 800px; /* Adjust the height as needed */
            overflow-block: scroll; /* Enable vertical scrolling */

        }
              
        .form-wrapperT {
            max-width: 900px;
            padding: 40px;
            background-color: #329ea8;
            border-radius: 5px;
            border: 5px solid #dddddd;
            border-left-color:whitesmoke;
             border-top-color:whitesmoke;
              border-right-color:whitesmoke;
               border-bottom-color:whitesmoke;
        }

        .form-wrapperT th,
        .form-wrapperT td  {
            text-align: center;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #cccccc;
            border-radius: 4px;
        }
        .form-wrapperT th {
            background-color:#084688;
            color: #021224;
            padding: 10px;
            font-size: 16px;
        }

        label {
            display: block;
            font-size: 18px;
            margin-bottom: 5px;
            color: #333;
        }
        
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            background-color: #ffffff;
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

        
        .error-message {
            color: red;
            margin-top: 10px;
        }

         /* GridView styling */
        .gridview2 {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        
        .gridview2 th,
        .gridview2 td {
            text-align: center;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #cccccc;
            border-radius: 4px;
        }
        
        .gridview2 th {
            background-color:#084688;
            color: #021224;
            padding: 10px;
            font-size: 16px;
        }

    </style>
    <title>Teacher Login</title>
</head>
<body>
    
<section class="navsection">
   	  <div class="logo">
   	  	<h1>Project Student</h1>
   	  </div>
      <nav>
      	 <a href="http://localhost:50273/Project" target="_blank">Student</a>
         <a href="http://localhost:50273/Class" target="_blank">Class</a>
         <a href="http://localhost:50273/Teacher" target="_blank">Teacher</a>
         <a href="http://localhost:50273/Section" target="_blank">Section</a>
         <a href="http://localhost:50273/Courses" target="_blank">Courses</a>
          <a href="http://localhost:50273/Enrollment" target="_blank">Enrollment</a>
     </nav>
   </section>

     
 
    <div class="containerT">
        <div class="form-wrapperT">
            <form id="formT" runat="server">
                <div>
                    <asp:Label ID="Label31" runat="server" Text="T_ID" style="font-size: 18px;"></asp:Label>
                    <asp:TextBox ID="TID" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label32" runat="server" Text="T_Name" style="font-size: 18px;"></asp:Label>
                    <asp:TextBox ID="TName" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label33" runat="server" Text="T_Email" style="font-size: 18px;"></asp:Label>
                    <asp:TextBox ID="TMail" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label34" runat="server" Text="Courses" style="font-size: 18px;"></asp:Label>
                    <asp:TextBox ID="TCourses" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label35" runat="server" Text="Education" style="font-size: 18px;"></asp:Label>
                    <asp:TextBox ID="TEducation" runat="server"></asp:TextBox>
                </div>
                <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Button ID="btnent" runat="server" Text="Enter" OnClick="btnent_Click"
                         CssClass="btn" />
                </div>
                <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Button ID="Un_Up" runat="server" Text="Unlock_Update" OnClick="Un_Up_Click"
                         CssClass="btn" />
                </div>
                <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Button ID="delId" runat="server" Text="Delete ID" OnClick="delId_Click"
                         CssClass="btn" />
                </div>
                <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Label ID="lblError2" runat="server" Text=""></asp:Label>
                </div>
               
                    <div>
                    <asp:GridView ID="GridView2" runat="server" Text="Select" AutoGenerateDeleteButton ="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" AutoGenerateSelectButton="True" CssClass="gridview2">

                    </asp:GridView>
                </div>
            </form>


            
        </div>
    </div>
</body>
</html>


