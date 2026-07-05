<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="Vista.Informes" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Informes.css" rel="stylesheet" type="text/css" />
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
        <div id="contenedor1">
            <div style="width: 50%" align="center">
                <br />
                <table class="table-informes">
                    <tr>
                        <td colspan="2">
                            <h2>Informe 1</h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Periodo Inicio</p>
                            <asp:TextBox ID="txt_fecha_inicio" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_inicio" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_fecha_inicio" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <p>Periodo Fin</p>
                            <asp:TextBox ID="txt_fecha_fin" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_fin" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_fecha_fin" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btn_aceptar" runat="server" Text="Aceptar" OnClick="btn_aceptar_Click" ValidationGroup="1" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="initial">
                            <asp:Label ID="lbl_turnos" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="initial">
                            <asp:Label ID="lbl_porcentajes" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="width: 50%" align="center">
                <br />
                <table class="table-informes">
                    <tr>
                        <td colspan="3">
                            <h2>Informe 2</h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Periodo Inicio</p>
                            <asp:TextBox ID="txt_fecha_inicio1" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_inicio1" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_fecha_inicio1" ValidationGroup="2">*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <p>Periodo Fin</p>
                            <asp:TextBox ID="txt_fecha_fin1" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_fin1" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_fecha_fin1" ValidationGroup="2">*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <p>Seleccione Especialidad</p>
                            <asp:DropDownList ID="ddl_especialidades" runat="server">
                            </asp:DropDownList>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Button ID="btn_aceptar1" runat="server" Text="Aceptar" OnClick="btn_aceptar1_Click" ValidationGroup="2" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:GridView ID="gv_TurnosXEspecialidad" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Especialidad">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_especialidad" runat="server" Text='<%# Eval("ESPECIALIDAD") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total Turnos">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_turnos" runat="server" Text='<%# Eval("TOTAL_TURNOS") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lbl_especialidadmayor" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="contenedor2">
            <div>
                <table class="table-informes">
                    <tr>
                        <td colspan="3">
                            <h2>Informe 3</h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Mes</p>
                            <asp:TextBox ID="txt_MesInfo3" runat="server" TextMode="Month" OnTextChanged="txt_MesInfo3_TextChanged"></asp:TextBox>
                        </td>
                        <td>
                            <p>Medico</p>
                            <asp:DropDownList ID="ddl_Informe3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_Informe3_SelectedIndexChanged1">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:GridView ID="gv_Informe3" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Medico">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_it_Medico" runat="server" Text='<%# Eval("MEDICO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Turnos">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_it_Turnos" runat="server" Text='<%# Eval("TOTAL_TURNOS") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ausentes">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_it_Ausentes" runat="server" Text='<%# Eval("AUSENTES") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Presentes">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_it_Presentes" runat="server" Text='<%# Eval("PRESENTES") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="contenedor4" align="center">
            <div align="center" style="width: 50%">
                <table class="table-informes" style="width: 350px;">
                    <tr>
                        <td colspan="2" align="center">
                            <h2>Informe 4</h2>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <p>Mes</p>
                            <asp:DropDownList ID="ddl_mes_4" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_mes4" runat="server" ErrorMessage="Selecciones un mes" ControlToValidate="ddl_mes_4" InitialValue="0" ValidationGroup="3">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <p>Año</p>
                            <asp:DropDownList ID="ddl_anio_4" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_anio4" runat="server" ErrorMessage="Selecciones un año" ControlToValidate="ddl_anio_4" InitialValue="0" ValidationGroup="3">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btn_aceptar2" runat="server" Text="Aceptar" OnClick="btn_aceptar2_Click" ValidationGroup="3" />
                        </td>
                    </tr>
                    <tr>
                        <td>Lunes</td>
                        <td colspan="2" style="padding: 20px" align="initial">
                            <asp:Button ID="barra1" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" />
                        </td>
                    </tr>
                    <tr>
                        <td>Martes</td>
                        <td colspan="2" style="padding: 20px" align="initial">
                            <asp:Button ID="barra2" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                    </tr>
                    <tr>
                        <td>Miercoles</td>
                        <td colspan="2" style="padding: 20px" align="initial">
                            <asp:Button ID="barra3" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                    </tr>
                    <tr>
                        <td>Jueves</td>
                        <td colspan="2" style="padding: 20px" align="initial">
                            <asp:Button ID="barra4" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                    </tr>
                    <tr>
                        <td>Viernes</td>
                        <td colspan="2" style="padding: 20px" align="initial">
                            <asp:Button ID="barra5" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                    </tr>
                    <tr>
                        <td>Sabado</td>
                        <td colspan="2" style="padding: 20px" align="initial">
                            <asp:Button ID="barra6" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                    </tr>
                    <tr>
                        <td>Domingo</td>
                        <td colspan="2" style="padding: 20px" align="initial">
                            <asp:Button ID="barra7" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="initial">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div align="center" style="width: 50%; flex-direction: row; display: flex">

                <table class="table-informes" align="center">
                    <tr>
                        <td colspan="2">
                            <h2>Informe 5</h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Seleccione una provincia:</p>
                            <asp:DropDownList ID="ddl_ProvinciaInforme5" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_ProvinciaInforme5_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <p>Pacientes por Provincia</p>
                            <div class="contenedor-grid">
                                <asp:GridView ID="gv_PacientesInforme5" runat="server" AutoGenerateColumns="False">
                                    <Columns>
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
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </td>
                    </tr>
                </table>
                <table class="table-informes">
                    <tr>
                        <td>
                            <p>Seleccione un Rango de edad:</p>
                            <asp:DropDownList ID="ddl_RangosEdad" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_RangosEdad_SelectedIndexChanged">
                                <asp:ListItem Value="0">--Rango de Edad -- </asp:ListItem>
                                <asp:ListItem Value="1">0 a 18</asp:ListItem>
                                <asp:ListItem Value="2">18 a 30</asp:ListItem>
                                <asp:ListItem Value="3">30 a 60</asp:ListItem>
                                <asp:ListItem Value="4">60 +</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <p>Pacientes:</p>
                            <div class="contenedor-grid">
                                <asp:GridView ID="gvEdad" runat="server" AutoGenerateColumns="False">
                                    <Columns>
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
                                        <asp:TemplateField HeaderText="Fecha Nacimiento">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_it_FechaNacimiento" runat="server" Text='<%# Bind("FechaNacimiento_Paci", "{0:d}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <asp:ValidationSummary ID="vs_errores1" runat="server" ValidationGroup="1" ShowMessageBox="True" ShowSummary="False"/>
        <asp:ValidationSummary ID="vs_errores2" runat="server" ValidationGroup="2" ShowMessageBox="True" ShowSummary="False"/>
        <asp:ValidationSummary ID="vs_errores3" runat="server" ValidationGroup="3" ShowMessageBox="True" ShowSummary="False"/>
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
