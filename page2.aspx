<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="page2.aspx.cs" Inherits="page2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <asp:TextBox ID="txtuser" runat="server"></asp:TextBox><br />
    <asp:TextBox ID="txtpass" runat="server"></asp:TextBox><br />
    <asp:Button ID="btnprevious" runat="server" Text="PreviousPage" onclick="btnprevious_Click"/>
</asp:Content>

