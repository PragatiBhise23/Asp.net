<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PartialPage.aspx.cs" Inherits="PartialPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="scrmgr" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
        Panel 1 Controls
            <asp:UpdatePanel ID="Pnl1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:TextBox ID="txt_pnl_1_1" runat="server" AutoPostBack="true"
                        OnTextChanged="txt_pnl_1_1_TextChanged"></asp:TextBox>
                    <asp:TextBox ID="txt_pnl_1_2" runat="server" 
                        ></asp:TextBox>
                    <asp:Button ID="btn_pnl_1_1" runat="server" Text="Btn_pnl1" OnClick="btn_pnl_1_1_Click" />
                    <asp:Label ID="lbl_pnl_1" runat="server" Text="Label"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>


            Panel 2 Controls
            <asp:UpdatePanel ID="pnl2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:TextBox ID="txt_pnl_2_1" runat="server" 
                        ></asp:TextBox>
                    <asp:TextBox ID="txt_pnl_2_2" runat="server" 
                        ></asp:TextBox>
                    <asp:Button ID="btn_pnl_2_1" runat="server" Text="Btn_pnl2" OnClick="btn_pnl_2_1_Click" />
                    <asp:Label ID="lbl_pnl_2" runat="server" Text="Label"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        </div>
    </form>
</body>
</html>
