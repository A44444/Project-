<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Section.aspx.cs" Inherits="Student.Section" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
          
        .navsection{
     width: 100%; height: 20vh; background-color:yellow ;
     display: flex; justify-content: space-around;
     align-items: center;
     background-image: linear-gradient(to top, #fff 80% , #c3f5ff 20%);
 }

 .logo{
     width: 40%
     color:#fff;
     background-image: linear-gradient(#8d98e3 40%, #854fee 60%);
     padding-left: 100px;
     box-sizing: border-box;
 } 

 .logo h1{
      text-transform: uppercase;
      font-size: 1.6rem;
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
 	font-size: 17px;
 	position: relative;
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

        .containerS {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            height: 800px; /* Adjust the height as needed */
            overflow-block: scroll; /* Enable vertical scrolling */
        }
              
        .form-wrapperS {
            max-width: 900px;
            padding: 40px;
            background-color: #329ea8;
            border-radius: 5px;
            border: 1px solid #dddddd;
        }

        .form-wrapperS th,
        .form-wrapperS td  {
            text-align: center;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #cccccc;
            border-radius: 4px;
        }
        .form-wrapperS th {
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
 background-image: linear-gradient(to right, #0fd850 0%, #f9f047 100%);
 transition: .30s ease;
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
        .gridview3 {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        
        .gridview3 th,
        .gridview3 td {
            text-align: center;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #cccccc;
            border-radius: 4px;
        }
        
        .gridview3 th {
            background-color:#084688;
            color: #021224;
            padding: 10px;
            font-size: 16px;
        }

    </style>
    <title>Section Login Page</title>
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
     </nav>
   </section>

    <div class="containerS">
        <div class="form-wrapperS">
            <form id="formS" runat="server">
                <div>
                    <asp:Label ID="Label331" runat="server" Text="Section_ID" style="font-size: 18px;"></asp:Label>
                    <asp:TextBox ID="SID" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label332" runat="server" Text="Section_Name" style="font-size: 18px;"></asp:Label>
                    <asp:TextBox ID="SName" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label333" runat="server" Text="Shift" style="font-size: 18px;"></asp:Label>
                    <asp:TextBox ID="Shift3" runat="server"></asp:TextBox>
                </div>
                
                <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Button ID="enterSection" runat="server" Text="Enter Section" OnClick="enterSection_Click"
                         CssClass="btn" />
                </div>
                <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Button ID="changeSection" runat="server" Text="Change Section" OnClick="changeSection_Click"
                         CssClass="btn" />
                </div>
                <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Button ID="delSection" runat="server" Text="Delete Section" OnClick="delSection_Click"
                         CssClass="btn" />
                </div>
                <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Label ID="lblError3" runat="server" Text=""></asp:Label>
                </div>
               
                    <div>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateDeleteButton="True" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" AutoGenerateSelectButton="True" CssClass="gridview3">

                    </asp:GridView>
                </div>
            </form>


            
        </div>
    </div>
</body>
</html>



