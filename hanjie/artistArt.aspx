<%@ Page Title="" Language="C#" MasterPageFile="~/page/global.Master" AutoEventWireup="true" CodeBehind="artistArt.aspx.cs" Inherits="ArtWorld_Web.page.artistArt" %>
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

    <div class="row">
        <div class="col">
            <center>
                    <h3>Your Art</h3>
            </center>
        </div>
    </div>



    <div class="container" >
        <div class="row">
            <div class="col">
               

            </div>
        </div>

        <div class="row">
        <asp:GridView ID="GridViewArt" class="table table-border table-striped" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="artId,galleryId,categoryId" DataSourceID="SqlDataSourceArt" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="artId" HeaderText="artId" SortExpression="artId" HeaderStyle-CssClass = "hideGridColumn" ItemStyle-CssClass="hideGridColumn" InsertVisible="False" ReadOnly="True">
                <HeaderStyle CssClass="hideGridColumn" />
                <ItemStyle CssClass="hideGridColumn" />
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="stock" HeaderText="stock" SortExpression="stock" />
                <asp:BoundField DataField="createdDate" HeaderText="createdDate" SortExpression="createdDate" />
                <asp:BoundField DataField="name1" HeaderText="Gallery" SortExpression="name1" />
                <asp:BoundField DataField="name2" HeaderText="Category" SortExpression="name2" />
                <asp:ImageField DataImageUrlField="imgPath" HeaderText="Image" ControlStyle-Width="150px"  >
                <ControlStyle Width="150px"></ControlStyle></asp:ImageField>
                <asp:TemplateField>
                     <ItemTemplate>
                          <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                     </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="White" BorderColor="#333333" HorizontalAlign="Center" Wrap="True" />
            <PagerStyle CssClass="pagination-ys" />
            <RowStyle Height="160px" VerticalAlign="Middle" />
        </asp:GridView>



        <asp:SqlDataSource ID="SqlDataSourceArt" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [Arts] INNER JOIN [Galleries] ON [Arts].[gallery] = [Galleries].[galleryId] INNER JOIN [Categories] ON [Arts].[category] = [Categories].[categoryId]"></asp:SqlDataSource>
    <br />



        </div>

        <div class="row">
            <div class="col">
               <asp:Button ID="btnAddArts" runat="server" Text="Add" OnClick="btnAddArts_Click" />
            </div>
            <div class="col">
               <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
            </div>
        </div>

        
        
        

    </div>









</asp:Content>
