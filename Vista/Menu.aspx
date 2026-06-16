<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Vista.ABML" MaintainScrollPositionOnPostback="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Menu.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="divmenu">
            <table class="tablamenu">
                <tr>
                    <td align="initial" style="padding-left: 20px" width="85%"><h1>Clinica Medica</h1></td>
                    <td>
                    </td>
                    <td align="end" style="padding-right: 20px">
                        <div class="usuario-container">
                            <asp:LinkButton ID="lb_usuario_menu" CssClass="btn-usuario" runat="server" OnClick="lb_usuario_menu_Click">👤
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
            <div class="divs">
                <table class="tablaABML">
                    <tr>
                        <td >
                            <img src="Imagenes/Medico.png" class="imagen" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" >
                            <h2>Medicos</h2>
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_agregarm" cssclass="botones" runat="server" Text="Agregar" OnClick="btn_agregarm_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td  class="td">
                            <asp:Button ID="btn_dar_bajam" runat="server" Text="Eliminar" CssClass="botones" OnClick="btn_dar_bajam_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_modificarm" runat="server" Text="Modificar" CssClass="botones" OnClick="btn_modificarm_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_listarm" runat="server" Text="Listar" CssClass="botones" OnClick="btn_listarm_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="divs">
                <table class="tablaABML">
                    <tr>
                        <td>
                            <img src="Imagenes/paciente.png" class="imagen" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <h2>Pacientes</h2>
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_agregarp" runat="server" Text="Agregar" CssClass="botones" OnClick="btn_agregarp_Click" /></td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_dar_bajap" runat="server" Text="Eliminar" CssClass="botones" OnClick="btn_dar_bajap_Click" /></td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_modificarp" runat="server" Text="Modificar" CssClass="botones" OnClick="btn_modificarp_Click" /></td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_listarp" runat="server" Text="Listar" CssClass="botones" OnClick="btn_listarp_Click" /></td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="contenedor1">
            <div class="divs">
                <table class="tablaABML">
                    <tr>
                        <td>
                            <img src="Imagenes/Turnos.png" class="imagen" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <h2>Turnos</h2>
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_agregart" runat="server" Text="Asignar" CssClass="botones" OnClick="btn_agregart_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="botones" OnClick="btn_cancelar_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="divs">
                <table class="tablaABML">
                    <tr>
                        <td>
                            <img src="Imagenes/Informes.png" class="imagen" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <h2>Informes</h2>
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_informes" runat="server" Text="Mostrar Informes" CssClass="botones" OnClick="btn_informes_Click" />
                        </td>
                    </tr>
                </table>
            </div>
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
                    <td><img src="Imagenes/Logo1.png" class="logo1" /></td>
                    <td><img src="Imagenes/Logo2.png" class="logo2" /></td>
                    <td><img src="Imagenes/Logo3.png" class="logo3" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
