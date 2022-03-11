<%@ Page Title="" Language="C#" MasterPageFile="~/page/master/auth.Master" AutoEventWireup="true" CodeBehind="forgetPassword.aspx.cs" Inherits="ArtWorld_Web.page.forgetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="forgetPassword" class="mb-5 mt-5 d-flex align-items-center">
		<div class="container">
			<div class="row justify-content-sm-center">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold">Forget Password?</h1>
							<h3 class="fs-5 card-subtitle mb-4">Enter your registered email to get a reset password link</h3>
							
								<div id="txtEmailContainer" class="mb-4">
									<label id="lblEmail" class="mb-2 text-muted" for="email">Email</label>
									<asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="input-field" required="true" autofocus="true"></asp:TextBox>
									<div class="invalid-feedback">
										Email is invalid
									</div>
								</div>

								<asp:Button ID="btnSend" runat="server" Text="SEND" CssClass="btn btn-login ms-auto" OnClick="btnSend_Click" />
							
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
								Back to <a href="login.aspx" class="text-dark">Login</a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="modalTokenNotFound" tabindex="-1" aria-labelledby="modalTokenNotFoundLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="modalTokenNotFoundLabel">Link expired</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			Please try again by enter email and request for a new link
		  </div>
		</div>
	  </div>
	</div>
	<button id="openModalTokenNotFound" type="button" class="btn btn-primary d-none" data-bs-toggle="modal" data-bs-target="#modalTokenNotFound">
		open modal
	</button>
</asp:Content>
