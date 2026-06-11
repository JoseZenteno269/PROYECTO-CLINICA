<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recovery.aspx.cs" Inherits="Vista.Recovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Recovery.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            <table>
                <tr style="text-align: center;">
                    <td colspan="3"><h2>Recuperar Contraseña</h2></td>
                </tr>
                <tr>
                    <td>
                        Ingrese su Usuario: 
                    </td>
                    <td style="padding-left: 10px">

                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Nueva contraseña:
                    </td>
                    <td  style="padding-left: 10px">

                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Repita la contraseña:
                    </td>
                    <td  style="padding-left: 10px">

                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center;">
                        Tenes una cuenta?
                        <asp:HyperLink ID="hl_inicio_sesion" runat="server" NavigateUrl="~/Login.aspx">Iniciar Sesion</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
