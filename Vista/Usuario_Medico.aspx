<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuario_Medico.aspx.cs" Inherits="Vista.UsuarioMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Css/Usuario_Medico.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="divmenu">
            <table class="tablamenu">
                <tr>
                    <td align="initial" style="padding-left: 20px" width="85%">
                        <h1>Clinica Medica</h1>
                    </td>
                    <td></td>
                    <td align="end" style="padding-right: 20px">
                        <div class="usuario-container">
                            <asp:LinkButton ID="lbl_usuario_menu" CssClass="btn-usuario" runat="server" OnClick="lbl_usuario_menu_Click">
                                👤
                        <asp:Label runat="server" ID="lbl_usuario" Text="usuario"></asp:Label>
                            </asp:LinkButton>
                            <asp:Panel ID="p_panel" CssClass="dropdown-panel" runat="server" Visible="False">

                                <asp:LinkButton ID="lb_perfil" CssClass="opcion-menu" runat="server">Mi Perfil</asp:LinkButton>
                                <asp:LinkButton ID="lb_cerrar_sesion" CssClass="opcion-menu opcion-roja" runat="server" OnClick="lb_cerrar_sesion_Click">Cerrar Sesion</asp:LinkButton>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="contenedor">
            <table class="tablausuario">
                <tr>
                    <td colspan="3" align="center"><h1>Crear Usuario Medico</h1></td>
                </tr>
                <tr>
                    <td>Usuario: </td>
                    <td>
                        <asp:TextBox ID="txt_usuario" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Contraseña: </td>
                    <td>
                        <asp:TextBox ID="txt_contrasena1" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Repita Contraseña: </td>
                    <td>
                        <asp:TextBox ID="txt_contrasena2" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lbl_mensaje" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lbl_mensaje0" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="btn_aceptar" runat="server" Text="Aceptar" OnClick="btn_aceptar_Click" /></td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <br />
        <div class="divlogos">
            <table style="width: 100%">
                <tr>
                    <td>
                        <img src="Imagenes/Logo.png" class="logo" />
                    </td>
                    <td>
                        <img src="Imagenes/Logo1.png" class="logo1" /></td>
                    <td>
                        <img src="Imagenes/Logo2.png" class="logo2" /></td>
                    <td>
                        <img src="Imagenes/Logo3.png" class="logo3" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
