<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MultiView.aspx.cs" Inherits="MultiView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:MultiView ID="mv" runat="server" ActiveViewIndex="0">
        <asp:View ID="v1" runat="server">
            <table border="1" style="width:100%">
                <tr>
                    <th colspan="2">Employee and Department Info</th>
                </tr>
                <tr>
                    <td>EmpId</td>
                    <td>
                        <asp:TextBox ID="txtempid" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>EmpName</td>
                    <td>
                        <asp:TextBox ID="txtempname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Department</td>
                    <td>
                        <asp:TextBox ID="txtdepartment" runat="server"></asp:TextBox>
                    </td>
                </tr>
             <tr>
                   
                    <td colspan="2">
                        <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" />
                        </td>
                </tr>
            
            
            </table>
        </asp:View>

        <asp:View ID="v2" runat="server">
                        <table border="1" style="width:100%">
                <tr>
                    <th colspan="2">Salary Structure and WFH Info</th>
                </tr>
                <tr>
                    <td>Salary Structure</td>
                    <td>
                        <asp:TextBox ID="txtsalstruct" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Other Facilities</td>
                    <td>
                        <asp:TextBox ID="txtfacilities" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Is Work From Home</td>
                    <td>
                        <asp:CheckBox ID="chkwfh" runat="server" />       </td>
                </tr>
             <tr>
                   
                    <td colspan="2">
                        <asp:Button ID="btnprv" runat="server" Text="Previous" OnClick="btnprv_Click" />
                       
                         <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" />
                       </td>
                </tr>
            
            
            </table>
        </asp:View>

    </asp:MultiView>
</asp:Content>

