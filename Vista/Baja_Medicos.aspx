<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baja_Medicos.aspx.cs" Inherits="Vista.Baja_Medicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Baja_Medicos.css" rel="stylesheet" type="text/css" />
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
        <div id="divcontenedor">
            <table>
                <tr>
                    <td>Ingrese Legajo de Medico: </td>
                    <td>
                        <asp:TextBox ID="txt_legajo" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Button ID="btn_buscar" runat="server" Text="Button" /></td>
                    <td></td>
                </tr>
            </table>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:CommandField ButtonType="Button" ControlStyle-CssClass="bottoneditar" EditText="Dar Baja" ShowEditButton="True" />
                    <asp:TemplateField HeaderText="Legajo"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Id Medico"></asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha de Nacimiento"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo Electronico"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefeno"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad"></asp:TemplateField>
                    <asp:TemplateField HeaderText="ACTIVO"></asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
