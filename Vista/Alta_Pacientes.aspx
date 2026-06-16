<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alta_Pacientes.aspx.cs" Inherits="Vista.ABML_Pacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Alta_Pacientes.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                            <asp:LinkButton ID="lb_usuario_menu" CssClass="btn-usuario" runat="server" OnClick="lb_usuario_menu_Click">
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
        <div class="div">
            <table class="div-pacientes">
                <tr><td colspan="3">Pacientes</td></tr>
                <tr>
                    <td>
                        Ingrese DNI: 
                    </td>
                    <td>
                        <asp:TextBox ID="txt_dni_p" runat="server"></asp:TextBox>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Nombre: 
                    </td>
                    <td>
                        <asp:TextBox ID="txt_nombre_p" runat="server"></asp:TextBox>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Apellido:

                    </td>
                    <td>

                        <asp:TextBox ID="txt_apellido_p" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Sexo

                    </td>
                    <td>

                        <asp:DropDownList ID="ddl_sexo_p" runat="server">
                        </asp:DropDownList>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Nacionalidad:

                    </td>
                    <td>

                        <asp:DropDownList ID="ddl_nacionalidad_p" runat="server">
                        </asp:DropDownList>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        fecha de naciemiento:

                    </td>
                    <td>
                        <asp:DropDownList ID="ddl_mes_p" runat="server"></asp:DropDownList><asp:DropDownList ID="ddl_anio_p" runat="server"></asp:DropDownList>
                        <asp:Calendar ID="c_calendario_p" runat="server" ShowGridLines="True" ShowNextPrevMonth="False" ShowTitle="False"></asp:Calendar>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Direccion:

                    </td>
                    <td>

                        <asp:TextBox ID="txt_direccion_p" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Localidad:

                    </td>
                    <td>

                        <asp:DropDownList ID="ddl_localdiad_p" runat="server">
                        </asp:DropDownList>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Provincia:

                    </td>
                    <td>

                        <asp:DropDownList ID="ddl_provincia_p" runat="server">
                        </asp:DropDownList>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Correo Electronico:

                    </td>
                    <td>

                        <asp:TextBox ID="txt_correo_p" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Telefono:

                    </td>
                    <td>

                        <asp:TextBox ID="txt_telefono_p" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>ACTIVO</td>
                    <td>
                        <asp:CheckBox ID="cb_activo_p" runat="server" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" class="botones">
                        <asp:Button ID="btn_guardar" runat="server" Text="Guardar" CssClass="btn-guardar" />
                        <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="btn-cancelar" />
                    </td>
                </tr>
            </table>
        </div>
                <br />
<br />
<br />
        <div class="divlogos">
            <table style="width: 100%">
                <tr>
                    <td align="center">
                        <img src="Imagenes/Logo.png" class="logo" />
                    </td>
                    <td align="center">
                        <img src="Imagenes/Logo1.png" class="logo1" /></td>
                    <td align="center">
                        <img src="Imagenes/Logo2.png" class="logo2" /></td>
                    <td align="center">
                        <img src="Imagenes/Logo3.png" class="logo3" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
