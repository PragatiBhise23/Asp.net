<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EditableGrid.aspx.cs" Inherits="EditableGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        function CheckUnCheck(Ctrlchkall) {
            var tbl = document.getElementById('MainContent_grdEmp');
            for (var i = 1; i < tbl.rows.length; i++) {
                tbl.rows[i].children[6].children[0].children[0].checked = Ctrlchkall.checked;
            }
        }
        function ClearAll() {
            var Ctrls = document.getElementById('INPUT');
            for (var i = 0; i < Ctrls.length; i++) {
                if (Ctrls[i].type == 'text')
                    Ctrls[i].value = '';
            }
            return false;
        }
        function CalculateTotal(CtrlGrossSalary) {
            var GrossSalary = parseFloat(CtrlGrossSalary.value);
            var Deductions = GrossSalary * .10;
            var NetTotal = GrossSalary - Deductions;
            var CurrentRow = parseInt(CtrlGrossSalary.id.split('_')[3]) + 1;
            var tbl = document.getElementById('MainContent_grdEmp');
            tbl.rows[CurrentRow].children[4].children[0].value = Deductions;
            tbl.rows[CurrentRow].children[5].children[0].value = NetTotal;
        }

        function CalculateHTotal(Row) {
            var GrossSalary = parseFloat(Row.children[3].children[0].value);
            var Deductions = GrossSalary * .10;
            Row.children[4].children[0].value = Deductions;
            Row.children[5].children[0].value = GrossSalary - Deductions;

            Row.children[6].children[1].children[0].checked = true;
            CalculateFinalTotal();
        }

        function CalculateFinalTotal() {
            var GrossSalary = 0;
            var Deductions = 0;
            var tbl = document.getElementById('MainContent_grdEmp');
            for (var i = 1; i < tbl.rows.length - 1; i++) {
                GrossSalary += parseFloat(tbl.rows[i].children[3].children[0].value);
                Deductions += parseFloat(tbl.rows[i].children[4].children[0].value);
            }
            tbl.rows[tbl.rows.length - 1].children[3].innerHTML = GrossSalary;
            tbl.rows[tbl.rows.length - 1].children[4].innerHTML = Deductions;
            tbl.rows[tbl.rows.length - 1].children[5].innerHTML = GrossSalary - Deductions;
        }
    </script>  
    <asp:GridView ID="grdEmp"  runat="server"  AutoGenerateColumns="False" ShowFooter="True"
        OnRowCreated="grdEmp_RowCreated" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" >
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:TemplateField HeaderText="EmployeeID">
                           
                            <ItemTemplate>
                                <asp:TextBox ID="txtempid" runat="server" Text='<%# Eval("employeeid") %>' Width="80px"></asp:TextBox>
                           <asp:HiddenField ID="hdnemployeeid" runat="server" Value='<%# Eval("employeeid") %>' >
                                </asp:hiddenField>
                                </ItemTemplate>
                           
                           
                          
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EmployeeName">
                            <ItemTemplate>
                                <asp:TextBox ID="txtempname" runat="server" Text='<%# Eval("employeename") %>' Width="200px"></asp:TextBox>
                            </ItemTemplate>

                          
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Designation">
                     
                            <ItemTemplate>
                                <asp:DropDownList ID="ddldesignation" runat="server" SelectedValue='<%# Eval("designationid") %>' Width="150px">
                                    <asp:ListItem Value="0">Project Manager</asp:ListItem>
                                    <asp:ListItem Value="1">Team Lead</asp:ListItem>
                                    <asp:ListItem Value="2">Project Lead</asp:ListItem>
                                    <asp:ListItem Value="3">Senior Developer</asp:ListItem>
                                    <asp:ListItem Value="4">Junior Developer</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                     
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="GrossSalary">
                            
                            <ItemTemplate>
                                <asp:TextBox ID="txtgrossalary" runat="server"
                                    Text='<%# Eval("grosssalary") %>' 
                                    
                                    Width="100px"></asp:TextBox>
                                                            <%-- onkeyup="CalculateTotal(this);"--%>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deductions">
                               <ItemTemplate>
                                <asp:TextBox ID="txtdeductions" runat="server" Text='<%# Eval("deductions") %>' Width="100px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="NetSalary">
                               <ItemTemplate>
                                <asp:TextBox ID="txtnetsalary" runat="server" Text='<%# Eval("netsalary") %>' Width="100px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IsActive">
                             <HeaderTemplate>
                               <asp:CheckBox ID = "chkall" runat="server" Text="SelectAll"
                                   Onclick="CheckUnCheck(this);"
                                   Checked="true" Width="100px"></asp:CheckBox>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkisactive" runat="server"
                                    Checked='<%# Eval("IsActive").ToString()=="Y"? true : false %>' 
                                    Width="75px" />
                                <asp:CheckBox ID="chkselect" runat="server" 
                                    checked="false" Width="75px"/>
                            </ItemTemplate>

                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" Font-Size="Medium"/>
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        <asp:Button ID="btnSave" runat="server" Text="Save" Onclick="btnSave_Click"
            OnClientClick="return confirm('Do you really wants to Save Record');"/>
    <asp:Button ID="btnAdd" runat="server" Text="Add" Onclick="btnAdd_Click"/>
        <asp:Button ID="btnDelete" runat="server" Text="Delete" Onclick="btnDelete_Click" 
            OnClientClick="return confirm('Do you really wants to Delete Record');"/>
        <asp:Button ID="btnClear" runat="server" Text="Clear"  OnClientClick="ClearAll();" />
            
    <script type="text/javascript">
        CalculateFinalTotal();
    </script>

</asp:Content>

