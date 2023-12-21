<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="1" style="width:100%">
                <tr>
                    <th>
                        LoginName:
                    </th>
                    <th>
                        <asp:TextBox ID="txtloginname" runat="server"></asp:TextBox>
                    </th>
                </tr>
                 <tr>
                    <th>
                        Password:
                    </th>
                    <th>
                        <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                    </th>
                </tr>
                 <tr>
                    <td colspan="2">
                        <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Login" />
                        &nbsp;<asp:Button ID="btncancel" runat="server" OnClick="btncancel_Click" Text="Cancel" />
                    </td>
                  
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
