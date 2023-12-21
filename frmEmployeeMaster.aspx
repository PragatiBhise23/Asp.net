<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="frmEmployeeMaster.aspx.cs" Inherits="frmEmployeeMaster" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 <script type="text/javascript">
        function ValidateCtrls() {
            var IsValid = true;
            var Ctrls = document.getElementsByTagName('INPUT');
            for (var i = 0; i < Ctrls.length; i++) {
                Ctrls[i].style.backgroundColor = 'White';
                if (Ctrls[i].type == 'text' && Ctrls[i].getAttribute('Required') == 'true'
                    && Ctrls[i].value == '') {
                    IsValid = false;
                    Ctrls[i].style.backgroundColor = 'Yellow';
                    alert(Ctrls[i].getAttribute('Msg'));
                    Ctrls[i].focus();
                    break;
                }
            }
            if (IsValid)
                IsValid = cofirm('Do you Really wants to save record?');

            return IsValid;
        }
        function KeyPress(Ctrl, e, DataType) {
            if (DataType == 'int') {
                var ValidIntegers = "0123456789";
                if (ValidIntegers.indexOf(e.key) == -1)
                    return false;
            }
            else if (DataType == 'string') {
                var ValidString = "abcdefghijklmnopqrstuvwxyz.-_()@ ";
                if (ValidString.indexOf(e.key.toLowerCase()) == -1)
                    return false;

                if (Ctrl.value.split(' ').length >= 3 && e.key == ' ')
                    return false;
            }

            else if (DataType == 'double') {
                var ValidDouble = "0123456789.";
                if (ValidDouble.indexOf(e.key) == -1)
                    return false;

                if (Ctrl.value.indexOf('.') >= 0 && e.key == '.')
                    return false;
            }
        }

        function CalculateTotal(CtrlSalary) {
            var salary = CtrlSalary.value;
            var deductions = salary * .10;
            var netsalary = salary - deductions;
            document.getElementById('MainContent_txtdeductions').value = deductions;
            document.getElementById('MainContent_txtnetsalary').value = netsalary;

     }

     function ShowRecord(Row) {
         document.getElementById('MainContent_txtempid').value = Row.children[0].innerHTML;
         document.getElementById('MainContent_txtempname').value = Row.children[1].innerHTML;
         document.getElementById('MainContent_ddldesignation').value = Row.children[2].innerHTML;
         document.getElementById('MainContent_txtgrossalary').value = Row.children[3].innerHTML;
         document.getElementById('MainContent_txtdeductions').value = Row.children[4].innerHTML;
         document.getElementById('MainContent_txtnetsalary').value = Row.children[5].innerHTML;
         if (Row.children[6].innerText == "Y")
             document.getElementById("MainContent_chkisactive").checked = true;
         else
             document.getElementById("MainContent_chkisactive").checked = false;

         document.forms[0].submit();

     }
     function SetColor(Row, Color) {
         Row.style.backgroundColor = Color;
     }
     function ShowHelp(HelpType) {
         sessionStorage.setItem('HelpType', HelpType);

         window.open('Help.aspx', 'Help', 'top=50,left=100,height=400px,width=500px');
     }
 </script>
    Employee Master
    <table ID="tblemp" style="width:100%;" border="1">
        
        <tr>
            <th>
                EmployeeID
            </th>
            <td>
                <asp:TextBox ID="txtempid" runat="server"
                    Required="true" 
                    Msg="EmployeeId is Mandatory"
                    onkeypress="return KeyPress(this,event,'int');" OnTextChanged="txtempid_TextChanged"
                    AutoPostBack="True"

                    ></asp:TextBox>
                <input id="btnEmpHelp" style="width:38px" type="button" value="?"
                    onclick="ShowHelp('employee');" />
            </td>
        </tr>

        <tr>
            <th>
                EmployeeName
            </th>
              <td>
                <asp:TextBox ID="txtempname" runat="server" Width="256px"
                     Required="true" 
                    Msg="EmployeeName is Mandatory"
                     onkeypress="return KeyPress(this,event,'string');"
                    ></asp:TextBox>
            </td>
        </tr>


        <tr>
            <th>
                Designation
            </th>
            <td>
                <asp:DropDownList ID="ddldesignation" runat="server" Width="265px">
                    <asp:ListItem Selected="True" Value="0">Project Manager</asp:ListItem>
                    <asp:ListItem Value="1">Team Lead</asp:ListItem>
                    <asp:ListItem Value="2">Project Lead</asp:ListItem>
                    <asp:ListItem Value="3">Senior Developer</asp:ListItem>
                    <asp:ListItem Value="4">Junior Developer</asp:ListItem>
                </asp:DropDownList>
                 <input id="btndesignhelp" style="width:38px" type="button" value="?"
                    onclick="ShowHelp('designation');" />
            
            </td>
        </tr>


        <tr>
            <th>
                Gross Salary
            </th>
              <td>
                <asp:TextBox ID="txtgrossalary" runat="server"
                     Required="true" 
                    Msg="Gross Salary is Mandatory"
                    onkeypress="return KeyPress(this,event,'double');"
                    onblur="CalculateTotal(this);"
                    ></asp:TextBox>
            </td>
        </tr>

         <tr>
            <th>
                Deductions
            </th>
               <td>
                <asp:TextBox ID="txtdeductions" runat="server"
                     Required="true" 
                    Msg="Deductions is Mandatory"
                    onkeypress="return KeyPress(this,event,'double');"
                    ></asp:TextBox>
            </td>
        </tr>

         <tr>
            <th>
                Net Salary
            </th>
              <td>
                <asp:TextBox ID="txtnetsalary" runat="server"
                     Required="true" 
                    Msg="NetSalary is Mandatory"
                    ></asp:TextBox>
            </td>
        </tr>
         <tr>
            <th>
                IsActive
            </th>
             <td>
                 <asp:CheckBox ID="chkisactive" runat="server" />
             </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click"
                    OnClientClick="return ValidateCtrls();"/>
                <asp:Button ID="btndelete" runat="server" Text="Delete" Onclick="btndelete_Click"
                    OnClientClick="return confirm('Do you really wants To delete record?')"/>
                <asp:Button ID="btncancel" runat="server" Text="Cancel" /><br />
                <<asp:GridView ID="grdEmp" runat="server" OnRowCreated="grdEmp_RowCreated1"></asp:GridView>
            </td>
        </tr>
    </table>

</asp:Content>

