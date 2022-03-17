<%@ Page Title="" Language="C#" MasterPageFile="~/page/global.Master" AutoEventWireup="true" CodeBehind="addArt.aspx.cs" Inherits="ArtWorld_Web.page.addArt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
      function ShowImagePreview(input) {
          if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function (e) {
                  $('#<%=imgPreview.ClientID%>').prop('src', e.target.result)
                      
              };
              reader.readAsDataURL(input.files[0]);
          }
      }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <br />
    <div class="container w-50 border">
       <div class="row">
           <div class="col">
               <div class="card-body">

                   <div class="row">
                       <div class="col">
                           <center>
                               <h3>Add New ArtWork</h3>
                           </center>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col">
                           <center>
                               <asp:Image ID="imgPreview" runat="server" style="width:300px" />
                           </center>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col">
                           <hr />
                       </div>
                   </div>

                   <div class="row">
                       <div class="col">
                           <asp:FileUpload class="form-control" ID="fudArtImage" runat="server" onchange="ShowImagePreview(this);" />
                       </div>
                   </div>

                   <br />

                   <div class="row">
                       <div class="col">
                           <label>Art Name </label>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col">
                           <asp:TextBox ID="txtArtName" runat="server" CssClass="w-100"  ></asp:TextBox>
                       </div>
                   </div>

                    <br />

                   <div class="row">
                       <div class="col">
                           <label>Gallery</label>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col">
                           <asp:SqlDataSource ID="SqlDataSourceGallery" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [galleryId], [name] FROM [Galleries]"></asp:SqlDataSource>
                           <asp:DropDownList ID="ddlArtGallery" runat="server" CssClass="w-100" DataSourceID="SqlDataSourceGallery" DataTextField="name" DataValueField="galleryId" ></asp:DropDownList>
                       </div>
                   </div>

                   <br />

                   <div class="row">
                       <div class="col">
                           <label>Category</label>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col">
                           <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [categoryId], [name] FROM [Categories]"></asp:SqlDataSource>
                           <asp:DropDownList ID="ddlArtCategory" runat="server" CssClass="w-100" DataSourceID="SqlDataSourceCategory" DataTextField="name" DataValueField="categoryId" ></asp:DropDownList>
                       </div>
                   </div>

                   <br />

                   <div class="row">
                       <div class="col">
                           <label>Description</label>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col">
                           <asp:TextBox ID="txtArtDescription" runat="server" CssClass="w-100" TextMode="MultiLine" Rows="5" ></asp:TextBox>
                       </div>
                   </div>

                   <br />

                   <div class="row">
                       <div class="col">
                           <label>Stock Number</label>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col">
                           <asp:TextBox ID="txtStockNumber" runat="server" TextMode="Number" min="0">1</asp:TextBox>
                       </div>
                   </div>

                   <br />

                   <div class="row">
                       <div class="col">
                           <label>Price(RM)</label>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col">
                           <asp:TextBox ID="txtArtPrice" runat="server" ></asp:TextBox>
                       </div>
                   </div>

                    <br />

                   <div class="row">
                       <div class="col-2">
                           <asp:Button ID="btnAddArt" runat="server" Text="Add" OnClick="btnAddArt_Click"  />
                       </div>
                       <div class="col">
                           <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                       </div>
                   </div>
                   
               </div>
           </div>
       </div>
    </div>



</asp:Content>
