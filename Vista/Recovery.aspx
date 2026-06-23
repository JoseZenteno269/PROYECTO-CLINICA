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
                    <td colspan="3"><h2>Recupera Contraseña</h2></td>
                </tr>
                <tr>
                    <td>
                        Ingrese su Usuario: 
                    </td>
                    <td style="padding-left: 10px">

                        <asp:TextBox ID="txt_usuario" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Nueva contraseña:
                    </td>
                    <td  style="padding-left: 10px">

                        <asp:TextBox ID="txt_contrasena1" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Repita la contraseña:
                    </td>
                    <td  style="padding-left: 10px">

                        <asp:TextBox ID="txt_contrasena2" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Label ID="lbl_mensaje" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="btn_confirmar" runat="server" Text="Confirmar " OnClick="btn_confirmar_Click" />
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
