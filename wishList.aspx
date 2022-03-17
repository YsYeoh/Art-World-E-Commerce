<%@ Page Title="" Language="C#" MasterPageFile="~/page/master/global.Master" AutoEventWireup="true" CodeBehind="wishList.aspx.cs" Inherits="ArtWorld_Web.page.wishList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
        <div class="ms-auto me-auto w-75">
            <asp:Label ID="lblWishList" runat="server"><h1>WishList</h1></asp:Label>
     
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
            <HeaderTemplate>
                <div class="row">
                      <div class="col-1">
                        Select
                    </div>
                    
                     <div class="col-1">
                        Art Id
                    </div>
                    <div class="col-3">
                        Art
                    </div>
                    <div class="col-5">
                        Detail
                    </div>
                    <div class="col-1">
                        Action
                    </div>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="row">
                       <div class="col-1">
                        <asp:CheckBox ID="cbSelect" runat="server"/>
                        <asp:HiddenField ID="cbHf" Value='<%# Eval("wishListId") %>' runat="server" />
                    </div>
                    <div class="col-1">
                        <asp:Label ID="lblArtId" runat="server" Text='<%#Eval("artId")%>'></asp:Label>
                       
                    </div>
                    <div class="col-3">
                         <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("imagePath")%>'  Width="200px" Height="150px"/>
                    </div>
                    <div class="col-5">
                        <h5>
                            <%# Eval("name") %>
                        </h5>
                        <div>
                            <%# Eval("desc") %>
                        </div>
                        <div>
                            Price : <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price")  %>'></asp:Label>
                        </div>

                    </div>
                    <div class="col-2">
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("wishListId") %>' OnClick="btnDelete_Click"/>
                       
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                
            </FooterTemplate>
        </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Arts] as a, [wishLists] as b WHERE a.artId = b.artId ORDER BY b.dateCreated DESC"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
