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
            <table class="table-usuario">
                <tr>
                    <td colspan="3" align="center"><h1>Crear Usuario Medico</h1></td>
                </tr>
                <tr>
                    <td colspan="3">Usuario: </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:TextBox ID="txt_usuario" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:RequiredFieldValidator ID="rfv_usuario" runat="server" ErrorMessage="El campo es obligatorio" ControlToValidate="txt_usuario" ValidationGroup="1" CssClass="validador"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Contraseña: </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_contrasena1" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_contrasena1" runat="server" ErrorMessage="El campo es obligatorio" ControlToValidate="txt_contrasena1" ValidationGroup="1" CssClass="validador"></asp:RequiredFieldValidator><br />
                        <asp:CompareValidator ID="cv_contrasena" runat="server" ErrorMessage="Contraseña incorrecta" ControlToCompare="txt_contrasena1" ControlToValidate="txt_contrasena2" CssClass="validador"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>Repita Contraseña: </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_contrasena2" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_contrasena2" runat="server" ErrorMessage="El campo es obligatorio" ControlToValidate="txt_contrasena2" ValidationGroup="1" CssClass="validador"></asp:RequiredFieldValidator><br />
                        <asp:CompareValidator ID="cv_contrasena2" runat="server" ErrorMessage="Contraseña incorrecta" ControlToCompare="txt_contrasena2" ControlToValidate="txt_contrasena1" ValidationGroup="1" CssClass="validador"></asp:CompareValidator>
                    </td>
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
                    <td colspan="3" align="center" class="auto-style1">
                        <asp:Button ID="btn_aceptar" runat="server" Text="Aceptar" OnClick="btn_aceptar_Click" ValidationGroup="1" Width="100px" /></td>
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
