<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baja_Pacientes.aspx.cs" Inherits="Vista.Baja_Pacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Baja_Paciente.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="divmenu">
            &nbsp;&nbsp;&nbsp;
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
        <div id="contediv">
            <asp:Button ID="btn_menu" runat="server" Text="Menu" CssClass="button" OnClick="btn_menu_Click1"/>
        </div>
        <div id="divcontenedor">
            <table>
                <tr>
                    <td>Ingrese DNI Paciente: </td>
                    <td>
                        <asp:TextBox ID="txt_legajo" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Button ID="btn_buscar" runat="server" Text="Button" /></td>
                    <td></td>
                </tr>
            </table>
            <asp:GridView ID="gvPacientes" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:CommandField ButtonType="Button" ControlStyle-CssClass="bottoneditar" EditText="Dar Baja" ShowEditButton="True" >
<ControlStyle CssClass="bottoneditar"></ControlStyle>
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="DNI">
                        <ItemTemplate>
                            <asp:Label ID="lbl_It_DNI" runat="server" Text='<%# Bind("DNI_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre y Apellido">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_NombreApellido" runat="server" Text='<%# Eval("Nombre_Paci")+ " " + Eval("Apellido_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sexo">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Sexo" runat="server" Text='<%# Bind("Sexo_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nacionalidad">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Nacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha de Nacimiento">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Fecha" runat="server" Text='<%# Bind("FechaNacimiento_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Direccion" runat="server" Text='<%# Bind("Direccion_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo Electronico">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Email" runat="server" Text='<%# Bind("CorreoElectronico_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefeno">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Telefono" runat="server" Text='<%# Bind("Telefono_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ACTIVO">
                        <EditItemTemplate>
                            <asp:CheckBox ID="chk_NuevoEstado" runat="server" AutoPostBack="True" Checked='<%# Bind("Activo_Paci") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chk_Estado" runat="server" Checked='<%# Bind("Activo_Paci") %>' Enabled="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
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
