<%@ Page Title="" Language="C#" MasterPageFile="~/page/master/auth.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ArtWorld_Web.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="register" class="mb-5 mt-5 d-flex align-items-center">
		<div class="container">
			<div class="row justify-content-sm-center">
				<div class="col-10">
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<!--<div style="position: absolute; top:-20px;left:50%; transform: translate(-50%, 0%)">
								<a ID="linkSwitch" runat="server" class="btn btn-dark ms-auto">
									<asp:Label ID="lblSwitch" runat="server" Text=""></asp:Label>
								</a>
							</div>-->
							<h1 class="fs-4 card-title fw-bold mb-4">
								<!--<asp:Label ID="lblRegisterPortal" runat="server" Text=""></asp:Label>-->
								Artworld Registration
							</h1>

							<h3 class="card-subtitle fs-5 mb-4">User Details</h3>
								<div class="row mb-4">
									<div id="txtNameContainer" class="mb-3 col-sm-12 col-xl-6">
										<label id="lblName" class="mb-2 text-muted" for="name">Name</label>
										<asp:TextBox ID="txtName" runat="server" TextMode="SingleLine" CssClass="input-field" required="true" autofocus="true" MaxLength="30"></asp:TextBox>
										<div class="invalid-feedback">
											Name is required
										</div>
									</div>
									<div id="txtNicknameContainer" class="mb-3 col-sm-12 col-xl-6">
										<label id="lblNickname" class="mb-2 text-muted" for="name">Nickname</label>
										<asp:TextBox ID="txtNickname" runat="server" TextMode="SingleLine" CssClass="input-field" autofocus="true" MaxLength="30"></asp:TextBox>
										<div class="invalid-feedback">
											Nickname is required
										</div>
									</div>
									<!--<div id="txtBirthContainer" class="mb-3 col-sm-12 col-xl-3">
										<label id="lblBirth" class="mb-2 text-muted" for="name">Birth</label>
										<asp:TextBox ID="txtBirth" runat="server" TextMode="Date" CssClass="input-field" autofocus="true"></asp:TextBox>
										<div class="invalid-feedback">
											txtBirth is required
										</div>
									</div>
									
									<div id="txtContactContainer" class="mb-3 col-sm-12 col-xl-6">
										<label id="lblContact" class="mb-2 text-muted" for="name">Contact</label>
											<div class="row">
												<div class="col-2 text-center">
													<div class="mb-auto mt-auto fs-5">+60</div>
												</div>
												<div class="col-10">
													<asp:TextBox ID="txtContact" runat="server" TextMode="Phone" CssClass="input-field" autofocus="true" required="true" MaxLength="10"></asp:TextBox>
												</div>
											</div>
										<div class="invalid-feedback">
											Contact is required
										</div>
									</div>
									<div id="rblGenderContainer" class="mb-3 col-sm-12 col-xl-3">
										<label id="lblGender" class="mb-2 text-muted" for="name">Gender</label>
										<asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:RadioButtonList>
									</div>-->
								</div>
								<!--<h3 class="card-subtitle fs-5">Delivery/Billing Address</h3>
								<p class="mb-4">This address will be your default delivery and billing address</p>
								<div class="row mb-4">
									<div id="txtAddress1Container" class="mb-3 col-sm-12 col-xl-12">
										<label id="lblAddress1" class="mb-2 text-muted" for="name">Address 1</label>
										<asp:TextBox ID="txtAddress1" runat="server" TextMode="SingleLine" CssClass="input-field" autofocus="true" required="true" MaxLength="50"></asp:TextBox>
										<div class="invalid-feedback">
											Address is required
										</div>
									</div>
									<div id="txtAddress2Container" class="mb-3 col-sm-12 col-xl-12">
										<label id="lblAddress2" class="mb-2 text-muted" for="name">Address 2</label>
										<asp:TextBox ID="txtAddress2" runat="server" TextMode="SingleLine" CssClass="input-field" autofocus="true" MaxLength="50"></asp:TextBox>
										<div class="invalid-feedback">
											Address is required
										</div>
									</div>
									<div id="selectStateContainer" class="mb-3 col-sm-6 col-xl-4">
										<label id="lblState" class="mb-2 text-muted" for="name">State</label>
										<asp:DropDownList ID="selectState" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="stateId" CssClass="form-select">

										</asp:DropDownList>
										<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [States]"></asp:SqlDataSource>
										<div class="invalid-feedback">
											State is required
										</div>
									</div>
									<div id="txtPostcodeContainer" class="mb-3 col-sm-6 col-xl-4">
										<label id="lblPostcode" class="mb-2 text-muted" for="name">Postcode</label>
										<asp:TextBox ID="txtPostcode" runat="server" TextMode="SingleLine" CssClass="input-field" autofocus="true" required="true" MaxLength="5"></asp:TextBox>
										<div class="invalid-feedback">
											Postcode is required
										</div>
									</div>
									<div id="txtCityContainer" class="mb-3 col-sm-12 col-xl-4">
										<label id="lblCity" class="mb-2 text-muted" for="name">City</label>
										<asp:TextBox ID="txtCity" runat="server" TextMode="SingleLine" CssClass="input-field" autofocus="true" required="true" MaxLength="30"></asp:TextBox>
										<div class="invalid-feedback">
											City is required
										</div>
									</div>
									<div id="txtCountryContainer" class="mb-3 col-sm-12 col-xl-12">
										<label id="lblCountry" class="mb-2 text-muted" for="name">Country</label>
										<asp:TextBox ID="txtCountry" runat="server" TextMode="SingleLine" CssClass="input-field" autofocus="true" MaxLength="30" Text="Malaysia" Enabled="False" ReadOnly="True"></asp:TextBox>
										<div class="invalid-feedback">
											Country is required
										</div>
									</div>
									
									
								</div>-->
								<h3 class="card-subtitle fs-5 mb-4">Login Detail</h3>
								<div class="row">
									<div id="txtEmailContainer" class="mb-3 col-sm-12 col-xl-12">
										<label id="lblEmail" class="mb-2 text-muted" for="email">Email</label>
										<asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="input-field" required="true" autofocus="true"></asp:TextBox>
										<div class="invalid-feedback">
											Email is invalid
										</div>
									</div>
									<div id="txtPassword1Container" class="mb-3 col-sm-12 col-xl-6">
										<label id="lblPassword1" class="mb-2 text-muted" for="password">Password</label>
										<asp:TextBox ID="txtPassword1" runat="server" TextMode="Password" required="true" CssClass="input-field"></asp:TextBox>
										<div class="progress mt-1">
										  <div id="passwordStrength" class="progress-bar progress-bar-striped bg-danger progress-bar-animated" role="progressbar" style="width: 5%" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
										<div class="invalid-feedback">
								    		Password is required
							    		</div>
									</div>
									<div id="txtPassword2Container" class="mb-3 col-sm-12 col-xl-6">
										<label id="lblPassword2" class="mb-2 text-muted" for="password">Comfirm Password</label>
										<asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" required="true" CssClass="input-field"></asp:TextBox>
										<div class="invalid-feedback">
								    		Confirm Password is required
							    		</div>
									</div>
									<div class="mb-3 col-sm-12 col-xl-6">
										<asp:CompareValidator ID="comparePassword" runat="server" 
											ErrorMessage="Your passwords do not match up!" 
											ControlToCompare="txtPassword1"
											ControlToValidate="txtPassword2"
											
											></asp:CompareValidator>
									</div>
								</div>

								<div class="d-flex align-items-center mb-3">
									<div id="cbTncContainer" class="form-check">
										<asp:CheckBox ID="cbTnc" runat="server"/>
										<label for="tnc" class="form-check-label">I agree all statement in <a href="#" class="text-dark">Terms & Conditions</a></label>
									</div>
								</div>
								<div class="row align-items-lg-end align-items-end">
									<div class="col-lg-2 col-sm-12">
										<asp:Button ID="btnSubmit" runat="server" Text="REGISTER" CssClass="btn btn-login ms-auto" OnClick="btnSubmit_Click" />
									</div>
								</div>
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
								Already have account? <a href="login.aspx" class="text-dark">Login</a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="modalRegisterUnsuccess" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Account Register Unsuccess</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			Some error occur! Please try again.
		  </div>
		</div>
	  </div>
	</div>
	<button id="openModalRegisterUnsuccess" type="button" class="btn btn-primary d-none" data-bs-toggle="modal" data-bs-target="#modalRegisterUnsuccess">
	  open modal
	</button>
</asp:Content>
