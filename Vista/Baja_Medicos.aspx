<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baja_Medicos.aspx.cs" Inherits="Vista.Baja_Medicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Baja_Medicos.css" rel="stylesheet" type="text/css" />
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
        <br />
        <br />
        <div id="divcontenedor">
            <table class="tabla-inicio">
                <tr>
                    <td>Ingrese ID del Medico: </td>
                    <td>
                        <asp:TextBox ID="txt_IdMedico" runat="server" TextMode="Search"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_IdMedico" runat="server" ControlToValidate="txt_IdMedico" ErrorMessage="Ingrese un Id a dar de baja" ValidationGroup="3">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_IdMedico" runat="server" ControlToValidate="txt_IdMedico" ErrorMessage="Ingrese solo numeros" ValidationExpression="^[0-9]+$" ValidationGroup="3">*</asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" OnClick="btn_Aceptar_Click" ValidationGroup="3" CssClass="btn_volver" /></td>
                    <td>
                        <asp:Button ID="btn_activos" runat="server" Text="Activos" CssClass="btn_volver" OnClick="btn_activos_Click"/>
                    </td>
                    <td>
                        <asp:Button ID="btn_inactivos" runat="server" Text="Inactivos" CssClass="btn_volver" OnClick="btn_inactivos_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lbl_Mensaje" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div class ="grupo-medico">
            <br />
            <asp:GridView ID="gvMedicos" runat="server" AutoGenerateColumns="False" CssClass="gv" GridLines="None" BorderStyle="None" BorderWidth="0px" CellPadding="0">
                <Columns>
                    <asp:TemplateField HeaderText="Id Medico">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_IDmedico" runat="server" Text='<%# Bind("Id_Medico_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Legajo">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Legajo" runat="server" Text='<%# Bind("Legajo_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_DNI" runat="server" Text='<%# Bind("DNI_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre y Apellido">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_NombreApellido" runat="server" Text='<%# Eval("Nombre_Med")+ "  " + Eval("Apellido_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha de Nacimiento">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Fecha" runat="server" Text='<%# Bind("FechaNacimiento_Med", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo Electronico">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Email" runat="server" Text='<%# Bind("CorreoElectronico_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefeno">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Telefono" runat="server" Text='<%# Bind("Telefono_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Especialidad" runat="server" Text='<%# Bind("Nombre_Espe") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado">
                        <EditItemTemplate>
                            <asp:CheckBox ID="chk_NuevoEstado" runat="server" AutoPostBack="True" Checked='<%# Bind("Activo_Med") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <span class='<%# Convert.ToBoolean(Eval("Activo_Med")) ? "estado activo" : "estado inactivo" %>'>
                                <%# Convert.ToBoolean(Eval("Activo_Med")) ? "Activo" : "Inactivo" %>
                            </span>
<%--                            <asp:CheckBox ID="chk_Estado" runat="server" Checked='<%# Bind("Activo_Med") %>' Enabled="False" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
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
        <asp:ValidationSummary ID="VSBajaMedica" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="3" />
    </form>
</body>
</html>
