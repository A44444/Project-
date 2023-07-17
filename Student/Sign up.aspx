<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sign up.aspx.cs" Inherits="Student.Sign_up" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Webleb</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/CSS/index.css"/>
</head>
<body>
    <div class="section">
        <div class="container">
             <form id="formT" runat="server">
            <div class="row full-height justify-content-center">
                <div class="col-12 text-center align-self-center py-5">
                    <div class="section pb-5 pt-5 pt-sm-2 text-center">
                        <h6 class="mb-0 pb-3"><span>Log In </span><span>Sign Up</span></h6>
                        <input class="checkbox" type="checkbox" id="reg-log" name="reg-log" />
                        <label for="reg-log"></label>
                        <div class="card-3d-wrap mx-auto">
                            <div class="card-3d-wrapper">
                                <div class="card-front">
                                    <div class="center-wrap">
                                        <div class="section text-center">
                                            <h4 class="mb-4 pb-3">Log In</h4>
                                            <div class="form-group">
                                                <asp:TextBox ID="txtemail" CssClass="form-style" runat="server"></asp:TextBox>
                                                <i class="input-icon uil uil-at"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <asp:TextBox ID="txtpass" CssClass="form-style" runat="server" Type="password"></asp:TextBox>
                                                <i class="input-icon uil uil-lock-alt"></i>
                                            </div>
                                              <div style="display: flex; justify-content: center; align-items: center;">
                    <asp:Label ID="lblError1" runat="server" Text=""></asp:Label>
                </div>
                                            <asp:Button ID="Enterinfo" runat="server" Text="Log in" OnClick="Enterinfo_Click" class="btn mt-4"/>
                                            <p class="mb-0 mt-4 text-center"><a href="http://localhost:50273/Project"  target="_blank" class="link">Forgot your password?</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-back">
                                    <div class="center-wrap">
                                        <div class="section text-center">
                                            <h4 class="mb-3 pb-3">Sign Up</h4>
                                            <div class="form-group">
                                                <asp:TextBox ID="fullname" CssClass="form-style" runat="server"></asp:TextBox>
                                                <i class="input-icon uil uil-user"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <asp:TextBox ID="phonenumber" CssClass="form-style" runat="server"  ></asp:TextBox>
                                                <i class="input-icon uil uil-phone"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <asp:TextBox ID="Regmail" CssClass="form-style" runat="server"></asp:TextBox>
                                                <i class="input-icon uil uil-at"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <asp:TextBox ID="Rpass" CssClass="form-style" runat="server" ></asp:TextBox>
                                                <i class="input-icon uil uil-lock-alt"></i>
                                            </div>
       
                                            <asp:Button ID="reg" runat="server" Text="Register" OnClick="reg_Click" class="btn mt-4"/>
                                             <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                       
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                  </form>
        </div>
    </div>
   
</body>
</html>
