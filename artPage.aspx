<%@ Page Title="" Language="C#" MasterPageFile="~/page/master/global.Master" AutoEventWireup="true" CodeBehind="artPage.aspx.cs" Inherits="ArtWorld_Web.page.artPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div class="container-fluid">
    <div class="ms-auto me-auto w-75">
  <%--  <asp:Repeater ID="rptArts" runat="server" DataSourceID="SqlDataSourceArt" OnItemCommand="rptArts_ItemCommand">

         <HeaderTemplate>
            <table >
             <tr>
                 <td> <h2>Abstraction Art</h2></td>
           
             </tr>
             <tr>
                 <td><h4>Welcome to My Art</h4></td>
             </tr>
            </table>
            

            <table border="1">
            <tr border="0">
                <td>ArtId</td>
                <td>Details</td>
                <td>Price</td>
                <td>Stock</td>
                <td>
                    GalleryID
                </td>
                <td>Galleries</td>
                <td>Quantity</td>
                <td>Add to Cart</td>
                <td>Add to WishList</td>
               
                <td></td>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="lblArtId" runat="server" Text='<%# Eval("artId") %>'></asp:Label>
                </td>
                <td>
                    <b><asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label></b>
                    <br />
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("desc") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblStock" runat="server" Text='<%# Eval("stock") %>'></asp:Label>
                </td>
           
                <td>
                    <asp:Label ID="lblGallery" runat="server" Text='<%# Eval("gallery") %>'></asp:Label>
                </td>
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("imagePath")%>'  Width="200px" Height="150px"/>
                </td>
                 <td>
                    <asp:TextBox ID="TextBox1" runat="server" min="1" TextMode="Number">1</asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnCart" runat="server" Text="Add to Cart" OnClick="btnCart_Click"/>
                </td>
               <td>
                   <asp:Button ID="btnWishList" runat="server" Text="Add to WishList" OnClick="btnWishList_Click"/>
               </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>--%>

        <asp:DataList ID="dlArts" runat="server" DataSourceID="SqlDataSourceArt" RepeatColumns = "3" Width="663px">
            <HeaderTemplate>
                <table >
                    <tr>
                        <td><h4>Art</h4></td>
                    </tr>
                  
                </table>
            </HeaderTemplate>
            <ItemTemplate>
     
             <table class="w-100">
            <tr>
                <td><asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("imagePath")%>'  Width="300px" Height="200px"/>&nbsp;</td>
            </tr>
            <tr>
                <td>
                   <b>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                   </b>
                      &nbsp;        
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("artId","artDetails.aspx?ArtId={0}") %>' Text="Click Here for More Details"></asp:HyperLink>
                     &nbsp;
                </td>
            </tr>
          
         </table>
            </ItemTemplate>
            <FooterTemplate>

            </FooterTemplate>
        </asp:DataList>


     
        <asp:SqlDataSource ID="SqlDataSourceArt" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Arts]" FilterExpression="">
    </asp:SqlDataSource>
   </div> 
   </div>  

</asp:Content>
