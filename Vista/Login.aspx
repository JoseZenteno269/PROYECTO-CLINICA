<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vista.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Login.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            <table>
                <tr>
                    <td colspan="3">
                        <h1><b>Iniciar sesión</b></h1>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p>Usuario: </p>
                        <asp:TextBox ID="txt_usuario" runat="server" CssClass="textbox" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:RequiredFieldValidator ID="rfv_usuario" runat="server" ControlToValidate="txt_usuario" ErrorMessage="El campo es obligatorio" ValidationGroup="grupo1" CssClass="validador"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Contraseña: </p>
                        <asp:TextBox ID="txt_contrasena" runat="server" CssClass="textbox" TextMode="Password" ValidationGroup="grupo1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:RequiredFieldValidator ID="rfv_contrasena" runat="server" ControlToValidate="txt_contrasena" ErrorMessage="El campo es obligatorio" ValidationGroup="grupo1" CssClass="validador"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center" style="padding: 5px">
                        <asp:Button ID="btn_iniciar" runat="server" Text="Iniciar" Width="100px" OnClick="btn_iniciar_Click" ValidationGroup="grupo1" />

                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="padding: 10px 10px 10px 0">
                        <asp:Label ID="lbl_mensaje" runat="server" Height="18px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:HyperLink ID="hl_recovery" runat="server" NavigateUrl="~/Recovery.aspx">¿olvidaste tu contraseña?</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
        <br />
    </form>
</body>
</html>
