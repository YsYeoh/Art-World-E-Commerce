<%@ Page Title="" Language="C#" MasterPageFile="~/page/master/global.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ArtWorld_Web.page.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       this is home
       <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Button" />
</asp:Content>
