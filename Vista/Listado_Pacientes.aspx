<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado_Pacientes.aspx.cs" Inherits="Vista.Listado_Pacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="Css/Listado_Pacientes.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="divmenu">
            <table class="tablamenu">
                <tr>
                    <td align="initial" style="padding-left: 20px" width="85%"><h1>Clinica Medica</h1></td>
                    <td></td>
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
                <div id="contediv">
            <asp:Button ID="btn_menu" runat="server" Text="Menu" CssClass="button" OnClick="btn_menu_Click"/>
        </div>
        <div id="divcontenedor">
            <table>
                <tr>
                    <td>Ingrese DNI: 
                    </td>
                    <td>
                        <asp:TextBox ID="txt_buscar" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Button ID="btn_buscar" runat="server" Text="Buscar" /></td>
                </tr>
            </table>
            <asp:GridView ID="gvPacientes" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Dni"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Sexo"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo Electronico"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono"></asp:TemplateField>
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
