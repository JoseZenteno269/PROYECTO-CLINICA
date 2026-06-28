<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Horarios_Medicos.aspx.cs" Inherits="Vista.Horarios_Medicos" MaintainScrollPositionOnPostback="true"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Horarios_Medicos.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

                                <asp:LinkButton ID="lb_perfil" CssClass="opcion-menu" runat="server" OnClick="lb_perfil_Click">Mi Perfil</asp:LinkButton>
                                <asp:LinkButton ID="lb_menu" CssClass="opcion-menu" runat="server" OnClick="lb_menu_Click">Menu</asp:LinkButton>
                                <asp:LinkButton ID="lb_cerrar_sesion" CssClass="opcion-menu opcion-roja" runat="server">Cerrar Sesion</asp:LinkButton>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div align="center" class="contenedor-horarios">
            <table class="tableshoras">
                <tr>
                    <td align="center" colspan="6">
                        <h1>Carga Horarios</h1>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                        <p>Legajo</p>
                        <asp:TextBox ID="txt_legajo" runat="server" Width="100px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfv_legajo" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_legajo" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="cb_lunes" runat="server" Text="Lunes" AutoPostBack="True" OnCheckedChanged="cb_lunes_CheckedChanged" /></td>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:TextBox ID="horainiciol" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                    <td>

                        <asp:RequiredFieldValidator ID="rfv_horainiciol" runat="server" ControlToValidate="horainiciol" ErrorMessage="Campo obligatorio" ValidationGroup="1" Enabled="False">*</asp:RequiredFieldValidator>
                        </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:TextBox ID="horafinl" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                    <td>

                        <asp:RequiredFieldValidator ID="rfv_horafinl" runat="server" ControlToValidate="horafinl" ErrorMessage="Campo obligatorio" ValidationGroup="1" Enabled="False">*</asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="cb_martes" runat="server" Text="Martes" AutoPostBack="True" OnCheckedChanged="cb_martes_CheckedChanged" /></td>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:TextBox ID="horainiciom" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                              <td>
                        <asp:RequiredFieldValidator ID="rfv_horainiciom" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="horainiciom" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:TextBox ID="horafinm" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_horafinm" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="horafinm" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="cb_miercoles" runat="server" Text="Miercoles" AutoPostBack="True" OnCheckedChanged="cb_miercoles_CheckedChanged" /></td>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:TextBox ID="horainiciomi" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                              <td>
                        <asp:RequiredFieldValidator ID="rfv_horainiciomi" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="horainiciomi" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:TextBox ID="horafinmi" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_horafinmi" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="horafinmi" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="cb_jueves" runat="server" Text="Jueves" AutoPostBack="True" OnCheckedChanged="cb_jueves_CheckedChanged" /></td>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:TextBox ID="horainicioj" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                              <td>
                        <asp:RequiredFieldValidator ID="rfv_horainicioj" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="horainicioj" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:TextBox ID="horafinj" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_horafinj" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="horafinj" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="cb_viernes" runat="server" Text="Viernes" AutoPostBack="True" OnCheckedChanged="cb_viernes_CheckedChanged" /></td>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:TextBox ID="horainiciov" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                              <td>
                        <asp:RequiredFieldValidator ID="rfv_horainiciov" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="horainiciov" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:TextBox ID="horafinv" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_horafinv" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="horafinv" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="cb_sabado" runat="server" AutoPostBack="True" OnCheckedChanged="cb_sabado_CheckedChanged" Text="Sabado" />
                    </td>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:TextBox ID="horainicios" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                              <td>
                        <asp:RequiredFieldValidator ID="rfv_horainicios" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="horainicios" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:TextBox ID="horafins" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_horafins" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="horafins" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="cb_domingo" runat="server" AutoPostBack="True" Text="Domingo" OnCheckedChanged="cb_domingo_CheckedChanged" />
                    </td>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:TextBox ID="horainiciod" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                              <td>
                        <asp:RequiredFieldValidator ID="rfv_horainiciod" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="horainiciod" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:TextBox ID="horafind" runat="server" TextMode="Time" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_horafind" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="horafind" Enabled="False" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lbl_mensaje" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                        <asp:Button ID="btn_aceptar" runat="server" Text="Aceptar" OnClick="btn_aceptar_Click" CssClass="btnAceptar" ValidationGroup="1" /></td>
                </tr>
            </table>
            <asp:ValidationSummary ID="vs_errores" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="1" />
        </div>
        <br />
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
