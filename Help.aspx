<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Help" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
    <script type="text/javascript">
        function ShowData(CtrlValue) {
            PageMethods.set_path('help.aspx');
            PageMethods.GetHelpData(sessionStorage.getItem('HelpType'), CtrlValue, ShowResult, ShowError);

        }
        function ShowResult(result) {
            document.getElementById('dvData').innerHTML = result;

        }
        function ShowError(err) {
            alert(err);
        }
        function SelectRecord(Row) {
            if(sessionStorage.getItem('HelpType').indexOf('employee') >= 0)
            {
                window.opener.document.getElementById('MainContent_txtempid').value =
                    Row.children[0].innerText;
                window.opener.document.forms[0].submit();
            }
            else {
                alert(Row.innerHTML);
                this.close();
            }
        }
</script>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scrmgr" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        Search:<input type="text" id="txtsearch" onkeyup="ShowData(this.value);" />
        <div id="dvData">
        </div>
    </form>
</body>
</html>
