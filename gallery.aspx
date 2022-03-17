<%@ Page Title="" Language="C#" MasterPageFile="~/page/master/global.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="ArtWorld_Web.page.gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="container-fluid">
    <div class="ms-auto me-auto w-75">

<%--    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceGallery">
        <HeaderTemplate>
            <tr>
                <h2>Galleries</h2>
            </tr>
            <tr>
                <td>Welcome to the Gallery. Enjoy your time</td>
            </tr>
          </HeaderTemplate>
            
            <table class="col-10">
             <tr>
                 <td>
                    <asp:Label ID="Label9" runat="server" Text="Galleries ID"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Galleries"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="Label7" runat="server" Text="Name"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Description"></asp:Label>
                </td>
               
                 <td>
                    <asp:Label ID="Label10" runat="server" Text="Created Date"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="Label11" runat="server" Text="Owner ID"></asp:Label>
                </td>
               
                <td></td>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("galleryId") %>'></asp:Label>
                </td>
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("imgPath")%>'  Width="200px" Height="150px"/>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("desc") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("createdDate") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("owner") %>'></asp:Label>
                </td>
                
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("galleryId","artPage.aspx?galleryId={0}") %>' Text="View Art"></asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>

    </asp:Repeater>--%>
        
        <asp:DataList ID="dlGallery" runat="server" DataSourceID="SqlDataSourceGallery" RepeatColumns = "3" Width="608px">
           <HeaderTemplate>
               <table>
                    <tr>
                        <td><h2>Galleries</h2></td>
                    </tr>
                    <tr>
                        <td>Welcome to the Gallery. Enjoy your time</td>
                    </tr>
               </table>
          </HeaderTemplate>

           <ItemTemplate>
                <table class="w-100">      
                    <tr>  
                        <td>
                             <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("imgPath")%>'  Width="400px" Height="300px"/> &nbsp;</td>
                    </tr>       
                    <tr>
                        <td>
                             <b>
                                 <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#Eval("galleryId","artPage.aspx?galleryId={0}") %>'  Text='<%# Eval("name") %>'></asp:HyperLink>
                                 &nbsp;
                             </b> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:Label ID="Label3" runat="server" Text='<%# Eval("desc") %>'></asp:Label> &nbsp;</td>
                    </tr>
                </table>
            </ItemTemplate>

            <FooterTemplate>

            </FooterTemplate>
        </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSourceGallery" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Galleries]" ></asp:SqlDataSource>
   </div>
   </div>
</asp:Content>
