<%@ Page Title="" Language="C#" MasterPageFile="~/page/global.Master" AutoEventWireup="true" CodeBehind="artistGallery.aspx.cs" Inherits="ArtWorld_Web.page.artistGallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .hideGridColumn
        {
            display:none;
        }
        th a
        {
            text-decoration: none;
            color:black;
        }
    </style>
    



    <br />

    <div class="container" >
        <div class="row">
            <div class="col">
                <center>
                    <h3>Your Gallery</h3>
                </center>
            </div>
        </div>

        

        <div class="row">
        <div class="col">    
                <asp:GridView class="table table-border table-striped page-item" ID="GridViewGallery" runat="server" AutoGenerateColumns="False" DataKeyNames="galleryId" DataSourceID="SqlDataSourceGallery" HorizontalAlign="Left" 
                    AllowPaging="True" PageSize="3" AllowSorting="True" >
                    <Columns>
                        <asp:BoundField DataField="galleryId" HeaderText="Gallery Id" SortExpression="galleryId" HeaderStyle-CssClass = "hideGridColumn" ItemStyle-CssClass="hideGridColumn" >
                        <HeaderStyle CssClass="hideGridColumn"></HeaderStyle>

                        <ItemStyle CssClass="hideGridColumn"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="name" HeaderText="Gallery Name" SortExpression="name" />
                        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                        <asp:BoundField DataField="createdDate" HeaderText="Created Date" SortExpression="createdDate" />
                        <asp:BoundField DataField="number_of_Arts" HeaderText="Number Of Arts" SortExpression="number_of_Arts" ReadOnly="True" />
                        <asp:ImageField DataImageUrlField="imgPath" HeaderText="Gallery Image" ControlStyle-Width="150px"  >
                            <ControlStyle Width="150px"></ControlStyle></asp:ImageField>
                
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                
                        
                
                    </Columns>
                
                    <PagerStyle BackColor="White" BorderColor="#333333" HorizontalAlign="Center" Wrap="True" />
                
                    <RowStyle Height="160px" VerticalAlign="Middle" />
                    <PagerStyle CssClass="pagination-ys" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceGallery" runat="server"  SelectCommand="SELECT [Galleries].*, COUNT([Arts].[gallery]) as number_of_Arts FROM [Galleries] LEFT JOIN [Arts] ON 
                    ([Galleries].[galleryId]=[Arts].[gallery]) GROUP BY [Galleries].[galleryId],[Galleries].[name],[Galleries].[description], [Galleries].[createdDate],[Galleries].[owner],[Galleries].[imgPath]" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
        </div>        
        </div>    

      

        
        <div class="row">
            <div class="col">
                <center>
                    <asp:Button ID="btnAddGallery" runat="server" Text="Add Gallery" OnClick="btnAddGallery_Click" />
                </center>
            </div>
        </div>


    </div>
    
</asp:Content>














