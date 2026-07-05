<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cancelar_Turno.aspx.cs" Inherits="Vista.Cancelar_Turno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Cancelar_Turno.css" rel="stylesheet" type="text/css" />
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
        <div id="contenedor">
            <div class="busqueda">
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txt_id" runat="server" CssClass="textbox" placeholder="ID Turno" TextMode="Search"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_id" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_id" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_id" runat="server" ErrorMessage="Caracteres invalidos" ControlToValidate="txt_id" ValidationExpression="^[0-9,$]*$" ValidationGroup="1">*</asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:Button ID="btn_buscar" runat="server" Text="Buscar" CssClass="btn-buscar" OnClick="btn_buscar_Click" ValidationGroup="1" /><br /><br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <p><asp:Label ID="lbl_Mensaje" runat="server"> </asp:Label></p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <br />
        <div class="contenedor-grid">
            <asp:GridView ID="gvTurnos" runat="server" CssClass="tabla-datos" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="ID Turno">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_IdTurno" runat="server" Text='<%# Bind("Id_Turno_Tur") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Medico">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Medico" runat="server" Text='<%# Eval("[Nombre y Apellido]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Especialidad" runat="server" Text='<%# Bind("Nombre_Espe") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hora">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Horario" runat="server" Text='<%# Eval("Horario") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Fecha" runat="server" Text='<%# Bind("Fecha_Tur", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado del Turno">
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_EstadoTurno" runat="server" Text='<%# Bind("Descripcion_EsTur") %>'> </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:ValidationSummary ID="vs_errores" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="1" />
        <br />
        <div class="divlogos">
            <table style="width: 100%">
                <tr>
                    <td align="center">
                        <img src="Imagenes/Logo.png" class="logo" />
                    </td>
                    <td align="center">
                        <img src="Imagenes/Logo1.png" class="logo1" />
                    </td>
                    <td align="center">
                        <img src="Imagenes/Logo2.png" class="logo2" />
                    </td>
                    <td align="center">
                        <img src="Imagenes/Logo3.png" class="logo3" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
