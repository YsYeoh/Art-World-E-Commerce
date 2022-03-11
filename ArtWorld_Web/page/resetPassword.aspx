<%@ Page Title="" Language="C#" MasterPageFile="~/page/master/auth.Master" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="ArtWorld_Web.page.resetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="resetPassword" class="mb-5 mt-5 d-flex align-items-center">
		<div class="container">
			<div class="row justify-content-sm-center">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold">Reset Password</h1>
							<asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
							
								<div id="txtPassword1Container" class="mb-3 col-sm-12 col-xl-12">
									<label id="lblPassword1" class="mb-2 text-muted" for="password">Password</label>
									<asp:TextBox ID="txtPassword1" runat="server" TextMode="Password" required="true" CssClass="form-control"></asp:TextBox>
									<div class="progress mt-1">
										<div id="passwordStrength" class="progress-bar progress-bar-striped bg-danger progress-bar-animated" role="progressbar" style="width: 5%" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<div class="invalid-feedback">
								    	Password is required
							    	</div>
								</div>
								<div id="txtPassword2Container" class="mb-4 col-sm-12 col-xl-12">
									<label id="lblPassword2" class="mb-2 text-muted" for="password">Comfirm Password</label>
									<asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" required="true" CssClass="form-control"></asp:TextBox>
									<div class="invalid-feedback">
								    	Confirm Password is required
							    	</div>
								</div>

								<asp:Button ID="btnSend" runat="server" Text="SUBMIT" CssClass="btn btn-login ms-auto" OnClick="btnSend_Click" />

							
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="modalResetPWUnsuccess" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Reset Password Unsuccess</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			Some error occur! Please try again.
		  </div>
		</div>
	  </div>
	</div>
	<button id="openModalResetPWUnsuccess" type="button" class="btn btn-primary d-none" data-bs-toggle="modal" data-bs-target="#modalResetPWUnsuccess">
	  open modal
	</button>
</asp:Content>
