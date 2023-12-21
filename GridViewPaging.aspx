<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GridViewPaging.aspx.cs" Inherits="GridViewPaging" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="grdEmp" runat="server" OnPageIndexChanging="grdEmp_PageIndexChanging"
        AllowPaging="True" OnRowCreated="grdEmp_RowCreated" OnRowDataBound="grdEmp_RowDataBound" 
        PageSize="5">
    </asp:GridView>
</asp:Content>

