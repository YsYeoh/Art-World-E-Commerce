﻿<%@ Page Title="" Language="C#" MasterPageFile="~/page/master/global.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="ArtWorld_Web.page.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <div class="ms-auto me-auto w-75">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <div class="row">
                    <div class="col-1">
                        Select
                    </div>
                    <div class="col-3">
                        Art
                    </div>
                    <div class="col-6">
                        Detail
                    </div>
                    <div class="col-2">
                        Action
                    </div>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="row">
                    <div class="col-1">
                        <asp:CheckBox ID="cbSelect" runat="server"/>
                        <asp:HiddenField ID="cbHf" Value='<%# Eval("cartId") %>' runat="server" />
                    </div>
                    <div class="col-3">
                        <img src="<%# Eval("imagePath") %>" style="width: 100%;"/>
                    </div>
                    <div class="col-6">
                        <h5>
                            <%# Eval("name") %>
                        </h5>
                        <div>
                            <%# Eval("desc") %>
                        </div>
                        <div>
                            Price : <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price")  %>'></asp:Label>
                        </div>
                        <div>
                            Quatity : <asp:Label ID="lblQty" runat="server" Text='<%# Eval("qty")  %>'></asp:Label>
                        </div>
                    </div>
                    <div class="col-2">
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("cartId") %>'/>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("cartId") %>'/>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                <div>
                    <div class="row">
                        <div class="col-10">
                            <div>
                                Total Selected Item: <asp:Label ID="lblTotalSelected" runat="server" Text="0"></asp:Label>
                            </div>
                            <div>
                                Total Price: RM <asp:Label ID="lblTotalPrice" runat="server" Text="0.00"></asp:Label>
                            </div>

                        </div>
                        <div class="col-10">
                            <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="selectedArt"/>
                        </div>
                    </div>
                </div>
            </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Arts] as a, [Carts] as b WHERE a.artId = b.artId ORDER BY b.dateCreated DESC"></asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
