<%@ Page Title="" Language="C#" MasterPageFile="~/page/master/global.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="ArtWorld_Web.page.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="profile" class="mb-5 mt-5 d-flex align-items-center">
		<div class="container">
			<div class="row justify-content-sm-center">
				<div class="col-lg-8 col-md-12 mb-5">
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">
								Billing and Delivery Details
							</h1>
							<h3 class="card-subtitle fs-5 mb-4">User Details</h3>
							<div class="row mb-4">
								<div id="txtEmailContainer" class="mb-3 col-sm-12 col-xl-12">
									<label id="lblEmail" class="mb-2 text-muted" for="email">Email</label>
									<asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="input-field" Enabled="False" ReadOnly="True" disabled="true"></asp:TextBox>
									<div class="invalid-feedback">
										Email is invalid
									</div>
								</div>
								<div id="txtNameContainer" class="mb-3 col-sm-12 col-xl-5">
									<label id="lblName" class="mb-2 text-muted" for="name">Name</label>
									<asp:TextBox ID="txtName" runat="server" TextMode="SingleLine" CssClass="input-field" autofocus="true" MaxLength="30"></asp:TextBox>
									<div class="invalid-feedback">
										Name is required
									</div>
								</div>
								<div id="txtContactContainer" class="mb-3 col-sm-12 col-xl-7">
									<label id="lblContact" class="mb-2 text-muted" for="name">Contact</label>
										<div class="row">
											<div class="col-2 text-center">
												<div class="mb-auto mt-auto fs-5">+60</div>
											</div>
											<div class="col-10">
												<asp:TextBox ID="txtContact" runat="server" TextMode="Phone" CssClass="input-field" autofocus="true" MaxLength="10"></asp:TextBox>
											</div>
										</div>
									<div class="invalid-feedback">
										Contact is required
									</div>
								</div>
							</div>
							<h3 class="card-subtitle fs-5 mb-4">Delivery/Billing Address</h3>
							<div class="row mb-4">
								<div id="txtAddress1Container" class="mb-3 col-sm-12 col-xl-12">
									<label id="lblAddress1" class="mb-2 text-muted" for="name">Address 1</label>
									<asp:TextBox ID="txtAddress1" runat="server" TextMode="SingleLine" CssClass="input-field" autofocus="true" MaxLength="50"></asp:TextBox>
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
									<asp:TextBox ID="txtPostcode" runat="server" TextMode="SingleLine" CssClass="input-field" autofocus="true" MaxLength="5"></asp:TextBox>
									<div class="invalid-feedback">
										Postcode is required
									</div>
								</div>
								<div id="txtCityContainer" class="mb-3 col-sm-12 col-xl-4">
									<label id="lblCity" class="mb-2 text-muted" for="name">City</label>
									<asp:TextBox ID="txtCity" runat="server" TextMode="SingleLine" CssClass="input-field" autofocus="true" MaxLength="30"></asp:TextBox>
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
							</div>
							<h1 class="fs-4 card-title fw-bold mb-4">
								Payment Detail
							</h1>
							<div class="row mb-4">
								<div id="txtCardNoContainer" class="mb-3 col-sm-12 col-xl-12">
									<label id="lblCardNo" class="mb-2 text-muted" for="cardNo">Card Number</label>
									<asp:TextBox ID="txtCardNo" runat="server"  CssClass="input-field" TextMode="Number" MaxLength="16"></asp:TextBox>
									<div class="invalid-feedback">
										Email is invalid
									</div>
								</div>
								<div id="txtExpiredContainer" class="mb-3 col-sm-6 col-xl-6">
									<label id="lblExpired" class="mb-2 text-muted" for="expired">Expired</label>
									<asp:TextBox ID="txtExpired1" runat="server" TextMode="Month" CssClass="input-field" autofocus="true" MaxLength="30"></asp:TextBox>
									<div class="invalid-feedback">
										Name is required
									</div>
								</div>
								<div id="txtCVVContainer" class="mb-3 col-sm-6 col-xl-6">
									<label id="lblCVV" class="mb-2 text-muted" for="expired">CVV</label>
									<asp:TextBox ID="txtCVV" runat="server" TextMode="Number" CssClass="input-field" autofocus="true" MaxLength="3"></asp:TextBox>
									<div class="invalid-feedback">
										Name is required
									</div>
								</div>
							</div>
							<div class="row align-items-lg-end align-items-end">
								<div class="col-lg-4 col-sm-12">
									<asp:Button ID="btnSubmit" runat="server" Text="Place Order" CssClass="btn btn-login ms-auto text-center" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="card shadow-lg">
						<asp:Repeater ID="Repeater1" runat="server">
							<HeaderTemplate>
								<div class="card-header">
									<h1 class="fs-4 card-title fw-bold mb-4">
										Cart Summary
									</h1>
								</div>
								<div class="card-body">
							</HeaderTemplate>
							<ItemTemplate>
								<div class="row mb-4">
									<div class="col-8">
										<h5><%# Eval("qty")%> x <%# Eval("name")%></h5>
										<div><%# Eval("desc")%></div>
									</div>
									<div class="col-4">
										<div>RM <%# Eval("price")%></div>
									</div>
								</div>
							</ItemTemplate>
							<FooterTemplate>
								</div>
								
							</FooterTemplate>
						</asp:Repeater>
						<div class="card-footer text-end">
							<h5 class="fw-bold">Sub Total: RM <asp:Label ID="lblTtlPrice" runat="server" Text=""></asp:Label></h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="modalEditUnsuccess" tabindex="-1" aria-labelledby="modalEditUnsuccessLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="modalEditUnsuccessLabel">Profile Update Unsuccess</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			Some error occur! Please try again.
		  </div>
		</div>
	  </div>
	</div>
	<button id="openModalEditUnsuccess" type="button" class="btn btn-primary d-none" data-bs-toggle="modal" data-bs-target="#modalEditUnsuccess">
	  open modal
	</button>
	<!-- Modal -->
	<div class="modal fade" id="modalEditSuccess" tabindex="-1" aria-labelledby="modalEditSuccessLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="modalEditSuccessLabel">Profile Update Success</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			Profile updated!
		  </div>
		</div>
	  </div>
	</div>
	<button id="openModalEditSuccess" type="button" class="btn btn-primary d-none" data-bs-toggle="modal" data-bs-target="#modalEditSuccess">
	  open modal
	</button>
</asp:Content>
