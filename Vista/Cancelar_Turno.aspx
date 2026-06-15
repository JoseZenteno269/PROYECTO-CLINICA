<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cancelar_Turno.aspx.cs" Inherits="Vista.Cancelar_Turno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Cancelar_Turno.css" rel="stylesheet" type="text/css" /> 
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
                            <asp:LinkButton ID="lb_usuario_menu" CssClass="btn-usuario" runat="server">
                                👤
                        <asp:Label runat="server" ID="lbl_usuario" Text="usuario"></asp:Label>
                            </asp:LinkButton>
                            <asp:Panel ID="p_panel" CssClass="dropdown-panel" runat="server" Visible="False">

                                <asp:LinkButton ID="lb_perfil" CssClass="opcion-menu" runat="server">Mi Perfil</asp:LinkButton>
                                <asp:LinkButton ID="lb_cerrar_sesion" CssClass="opcion-menu opcion-roja" runat="server">Cerrar Sesion</asp:LinkButton>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="contenedor">
            <table>
                <tr>
                    <td>Ingrese ID de Turno:</td>
                    <td>
                        <asp:TextBox ID="txt_id" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Button ID="btn_buscar" runat="server" Text="Buscar" /></td>
                </tr>
            </table>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:CommandField ButtonType="Button" CancelText="No" EditText="Cancelar" ShowEditButton="True" UpdateText="Si" />
                    <asp:TemplateField HeaderText="ID Turno"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Medico"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Hora"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado"></asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>
    </form>
</body>
</html>
