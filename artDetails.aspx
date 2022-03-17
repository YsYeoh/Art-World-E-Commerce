<%@ Page Title="" Language="C#" MasterPageFile="~/page/master/global.Master" AutoEventWireup="true" CodeBehind="artDetails.aspx.cs" Inherits="ArtWorld_Web.page.artDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="ms-auto me-auto w-75">
            <asp:DataList ID="dtlArtDetails" runat="server" DataKeyField="artId" DataSourceID="SqlDataSourceArts" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <HeaderTemplate>

                </HeaderTemplate>
                <ItemTemplate>
                     <table class="w-100">
                        <tr>
                            <td><asp:Image ID="Image2" runat="server" ImageUrl='<%#Eval("imagePath")%>'  Width="500px" Height="400px"/>&nbsp;</td>
                            <td>
                                <asp:HiddenField ID="hfArtId" runat="server" Value='<%# Eval("artId")%>'/>
                                
                            </td>
                        <tr>
                            <td>
                                 <h3><b><asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label></b></h3>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td> <asp:Label ID="lblDesc" runat="server" Text='<%# Eval("desc") %>'></asp:Label> &nbsp;</td>
                        </tr>
                         <tr>
                             <td>Price: </td>
                             <td><asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>&nbsp;</td>
                         </tr>
                         <tr>
                             <td>Quantity:</td>
                             <td>
                                 <asp:Label ID="lblQty" runat="server" Text="1"></asp:Label>
                                 &nbsp;</td>
                         </tr>
                         <tr>
                             <td>
                                <asp:Button ID="btnCart" runat="server" Text="Add to Cart" OnClick="btnCart_Click"/>
                                                        
                               <asp:Button ID="btnWishList" runat="server" Text="Add to WishList" OnClick="btnWishList_Click"/>                     
                             </td>
                         </tr>
                       
                     </table>
                     
                   
                </ItemTemplate>
                <FooterTemplate>

                </FooterTemplate>

            </asp:DataList>

            <asp:SqlDataSource ID="SqlDataSourceArts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Arts]" FilterExpression="">

            </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
