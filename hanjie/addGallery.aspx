<%@ Page Title="" Language="C#" MasterPageFile="~/page/global.Master" AutoEventWireup="true" CodeBehind="addGallery.aspx.cs" Inherits="ArtWorld_Web.addGallery" %>
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
                               <h3>Add New Gallery</h3>
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
                           <asp:FileUpload class="form-control" ID="fudGalleryImage" runat="server" onchange="ShowImagePreview(this);" />
                       </div>
                   </div>

                   <br />

                   <div class="row">
                       <div class="col">
                           <label>Gallery Name </label>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col">
                           <asp:TextBox ID="txtGalleryName" runat="server" CssClass="w-100"></asp:TextBox>
                       </div>
                   </div>


                   <div class="row">
                       <div class="col">
                           <label>Description</label>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col">
                           <asp:TextBox ID="txtGalleryDescription" runat="server" CssClass="w-100" TextMode="MultiLine"></asp:TextBox>
                       </div>
                   </div>
                   
                   <br />
                   <div class="row">
                       <div class="col-2">
                           <asp:Button ID="btnAddGallery" runat="server" Text="Add" OnClick="btnAddGallery_Click" />
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
