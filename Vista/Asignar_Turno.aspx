<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asignar_Turno.aspx.cs" Inherits="Vista.Asignar_Turno" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Asignar_Turnos.css" rel="stylesheet" type="text/css" />
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
                                <asp:LinkButton ID="lb_cerrar_sesion" CssClass="opcion-menu opcion-roja" runat="server" OnClick="lb_cerrar_sesion_Click">Cerrar Sesion</asp:LinkButton>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div id="divrow">
            <div class="divfila"  style="width: 50%" align="center">
                <table class="tableturnos">
                    <tr>
                        <td>
                            <p>Especilidad</p>
                            <asp:DropDownList ID="ddl_especialidad" class="ddl-estilo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_especialidad_SelectedIndexChanged"></asp:DropDownList></td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv_especialidad" runat="server" ErrorMessage="Seleccione una especialidad" ControlToValidate="ddl_especialidad" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <p>Medico</p>
                            <asp:DropDownList ID="ddl_medicos" class="ddl-estilo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_medicos_SelectedIndexChanged"></asp:DropDownList></td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv_medicos" runat="server" ErrorMessage="Seleccione un medico" ControlToValidate="ddl_medicos" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <p>Fecha</p>
                            <asp:Calendar ID="c_calendario" runat="server" OnSelectionChanged="c_calendario_SelectionChanged" EnableTheming="True" OnDayRender="c_calendario_DayRender" OnVisibleMonthChanged="c_calendario_VisibleMonthChanged" ShowGridLines="True" CssClass="calendario"></asp:Calendar>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <p>Horario</p>
                            <asp:DropDownList ID="ddl_horas" CssClass="ddl-estilo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_horas_SelectedIndexChanged"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv_horas" runat="server" ErrorMessage="Seleccione una hora" ControlToValidate="ddl_horas" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator></td>
                    </tr>
                </table>
            </div>
            <div class="divfila"  style="width: 50%" align="center">
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txt_buscar" runat="server" placeholder="DNI paciente..." TextMode="Search"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_buscar" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_buscar" ValidationGroup="2">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_buscar" runat="server" ErrorMessage="Caracteres invalidos" ControlToValidate="txt_buscar" ValidationGroup="2" ValidationExpression="^[0-9,$]*$">*</asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:Button ID="btn_buscar" runat="server" Text="Buscar" CssClass="btn_volver" OnClick="btn_buscar_Click" ValidationGroup="2" />
                        </td>
                        <td>
                            <asp:Button ID="btn_todos" runat="server" Text="Ver Todos" CssClass="btn_volver" OnClick="btn_todos_Click"/>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="gvPacientesSeleccion" runat="server" AutoGenerateColumns="False" CssClass="gv" OnSelectedIndexChanging="gvPacientesSeleccion_SelectedIndexChanging">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="ID Paciente">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_idpaciente" runat="server" Text='<%# Eval("Id_Paciente_Paci") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DNI">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_DNI" runat="server" Text='<%# Bind("DNI_Paci") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre y Apellido">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_NombreApellido" runat="server" Text='<%# Eval("Nombre_Paci") + " " + Eval("Apellido_Paci") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Genero">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_genero" runat="server" Text='<%# Eval("Sexo_Paci") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha de Nacimiento">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_fecha" runat="server" Text='<%# Eval("FechaNacimiento_Paci", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefono">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Telefono" runat="server" Text='<%# Bind("Telefono_Paci") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div align="center">
            <table>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Label ID="lbl_mensaje" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td align="center">
                        <asp:Button ID="btn_confirmar" runat="server" Text="Confirmar" OnClick="btn_confirmar_Click" CssClass="btn_volver" ValidationGroup="1" />
                    </td>
                    <td align="center">
                        <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" OnClick="btn_cancelar_Click" CssClass="btn_volver" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="vs_errores" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="1" />
            <asp:ValidationSummary ID="vs_errores1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="2" />
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
