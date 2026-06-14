<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asignar_Turno.aspx.cs" Inherits="Vista.Asignar_Turno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Asignar_Turnos.css" rel="stylesheet" type="text/css" />
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
        <div id="divrow">
            <div class="divfila">
                <table class="tableturnos">
                    <tr>
                        <td>
                            <p>Seleccione una Especilidad:</p>
                            <asp:DropDownList ID="ddl_especialidad" runat="server"></asp:DropDownList></td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Seleccione un Medico:</p>
                            <asp:DropDownList ID="ddl_medicos" runat="server"></asp:DropDownList></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <p>Elija un dia</p>
                            <asp:Calendar ID="c_dias" runat="server"></asp:Calendar>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <p>Seleccione un Horario:</p>
                            <asp:DropDownList ID="ddl_horas" runat="server"></asp:DropDownList>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="divfila">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="DNI"></asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre"></asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido"></asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefono"></asp:TemplateField>
                    </Columns>
                    
                </asp:GridView>
            </div>
        </div>
        <div>
            <table style="width: 100%">
                <tr>
                    <td align="center">
                        <asp:Button ID="btn_confirmar" runat="server" Text="Confirmar" />
                    </td>
                    <td align="center">
                        <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
