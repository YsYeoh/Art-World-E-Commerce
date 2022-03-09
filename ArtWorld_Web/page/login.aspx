<%@ Page Title="" Language="C#" MasterPageFile="~/page/master/auth.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ArtWorld_Web.page.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="login" class="mb-5 mt-5 d-flex align-items-center">
		<div class="container">
			<div class="row justify-content-sm-center">
				<div class="col-xxl-6 col-xl-6 col-lg-7 col-md-10 col-sm-12">
					<div class="row justify-content-md-center align-items-center">
						<div class="col-12 text-center"><h1>Welcome to ArtWorld!</h1></div>
						<div class="text-center my-5 col-md-8">
							<img src="../image/ArtWorld_logo.png" alt="logo" width="250">
						</div>
						<div class="col-md-8">
							<p class="text-center">
								<b>ArtWorld</b>, is a e-commercial art work platform 
								provide for the Artists, to display and sell 
								their arts and galleries. Besides, Art enthusiasts could 
								browse and shop the arts to find out their favorite arts 
								and purchase it in the platform.
							</p>
						</div>
						
					</div>
					
				</div>
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">Login</h1>
							<form id="form1" runat="server" class="needs-validation" novalidate="" autocomplete="off">
								<div id="txtEmailContainer" class="mb-3">
									<label id="lblEmail" class="mb-2 text-muted" for="email">Email</label>
									<asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" required="true" autofocus="true"></asp:TextBox>
									<!--<input id="email" type="email" class="form-control" name="email" required autofocus>-->
									<div class="invalid-feedback">
										Email is invalid
									</div>
								</div>
								<div id="txtPasswordContainer" class="mb-3">
									<div class="mb-2 w-100">
										<label id="lblPassword" class="text-muted" for="password">Password</label>
										<a href="forgot.html" class="float-end">
											Forgot Password?
										</a>
									</div>
									<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required="true" CssClass="form-control"></asp:TextBox>
								    <div class="invalid-feedback">
								    	Password is required
							    	</div>
								</div>

								<div class="d-flex align-items-center mb-3">
									<div id="cbRememberContainer" class="form-check">
										<asp:CheckBox ID="cbRemember" runat="server"/>
										<label for="remember" class="form-check-label">Remember Me</label>
									</div>
								</div>

								<asp:Button ID="btnSubmit" runat="server" Text="LOGIN" CssClass="btn btn-login ms-auto" />

							</form>
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
								Don't have an account? <a href="register.aspx" class="text-dark">Register Now</a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
</asp:Content>
