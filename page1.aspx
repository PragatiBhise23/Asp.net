<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="page1.aspx.cs" Inherits="page1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:TextBox ID="txtuser" runat="server"></asp:TextBox><br />
    <asp:TextBox ID="txtpass" runat="server"></asp:TextBox><br />
    <asp:Button ID="btnnext" runat="server" Text="NextPage" OnClick="btnnext_Click" />
</asp:Content>

