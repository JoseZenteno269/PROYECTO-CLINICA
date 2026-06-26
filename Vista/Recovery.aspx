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
                    <td colspan="3"><h2>Restablecer contraseña</h2></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p>Ingrese su Usuario: </p>
                        <asp:TextBox ID="txt_usuario" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:RequiredFieldValidator ID="rfv_usuario" runat="server" ErrorMessage="El campo es obligatorio" ControlToValidate="txt_usuario" CssClass="validador" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Nueva contraseña: </p>
                        <asp:TextBox ID="txt_contrasena1" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_contrasena1" runat="server" ErrorMessage="El campo es obligatorio" ControlToValidate="txt_contrasena1" CssClass="validador" ValidationGroup="grupo1"></asp:RequiredFieldValidator><br />
                        <asp:CompareValidator ID="cv_contrasena2" runat="server" ErrorMessage="Contraseña incorrecta" ControlToCompare="txt_contrasena1" ControlToValidate="txt_contrasena2" CssClass="validador" ValidationGroup="grupo1"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Repita la contraseña: </p>
                        <asp:TextBox ID="txt_contrasena2" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_contrasena2" runat="server" ErrorMessage="El campo es obligatorio" ControlToValidate="txt_contrasena2" CssClass="validador" ValidationGroup="grupo1"></asp:RequiredFieldValidator><br />
                        <asp:CompareValidator ID="cv_contrasena1" runat="server" ErrorMessage="Contraseña incorrecta" ControlToCompare="txt_contrasena2" ControlToValidate="txt_contrasena1" CssClass="validador" ValidationGroup="grupo1"></asp:CompareValidator>

                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="padding: 10px 10px 10px 0">
                        <asp:Label ID="lbl_mensaje" runat="server" Height="18px"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3" align="center" style="padding: 5px">
                        <asp:Button ID="btn_confirmar" runat="server" Text="Confirmar " OnClick="btn_confirmar_Click" ValidationGroup="grupo1" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="padding: 5px 5px 5px 0">
                        <asp:HyperLink ID="hl_inicio_sesion" runat="server" NavigateUrl="~/Login.aspx">¿Tenés una cuenta?</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
