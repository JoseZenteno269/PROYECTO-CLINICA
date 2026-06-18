<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vista.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Login.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<div id="contenedor">
            <table>
                <tr>
                    <td colspan="3"><h1><b>Inicio de Sesión</b></h1></td>
                </tr>
                <tr>
                    <td style="padding-right: 10px; ">
                        <asp:Label ID="lbl_usuario" runat="server" Text="Usuario: "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_usuario" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td style="padding-right: 10px; ">
                        <asp:Label ID="lbl_contasena" runat="server" Text="Contraseña: "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_contrasena" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="btn_iniciar" runat="server" Text="Iniciar" Width="100px" OnClick="btn_iniciar_Click" />

                    </td>
                </tr>
                <tr>
                    <td colspan="3">¿olvidaste tu contraseña?
                        <asp:HyperLink ID="hl_recovery" runat="server" NavigateUrl="~/Recovery.aspx">Recuperar Contraseña</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
        <br />

    </form>
</body>
</html>
