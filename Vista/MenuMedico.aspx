<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuMedico.aspx.cs" Inherits="Vista.MenuMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Menu_Medicos.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="divmenu">
            <table class="tablamenu">
                <tr>
                    <td align="initial" style="padding-left: 20px" width="85%"><h1>Menú Médico</h1></td>
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
        <div id="divcontenerdor">
            <table>
                <tr>
                    <td>Buscar por DNI:</td>
                    <td>
                    <asp:TextBox ID="txtBuscar" runat="server"></asp:TextBox>
                        </td>
                    <td>
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <table>
                <tr>
                    <td>
                        <div class="contenedor-turnos">
                            <asp:DataList ID="DLTurnos" runat="server" CellPadding="4" ForeColor="#333333">
                                <AlternatingItemStyle BackColor="White" />
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <ItemStyle/>
                                <ItemTemplate>
                                    <td class="tditemtemplate">
                                        <asp:Label ID="lbl_estado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                                    </td>
                                    <td class="tditemtemplate">
                                        <asp:Label ID="lbl_fecha" runat="server" Text='<%# Eval("Fecha") %>'></asp:Label>
                                    </td>
                                    <td class="tditemtemplate">
                                        <asp:Label ID="lbl_hora" runat="server" Text='<%# Eval("Hora") %>'></asp:Label></td>
                                    <td class="tditemtemplate">
                                        <asp:Label ID="lbl_paciente" runat="server" Text='<%# Eval("Paciente") %>'></asp:Label></td>
                                    <td class="tditemtemplate">
                                        <asp:Label ID="lbl_medico" runat="server" Text='<%# Eval("Medico") %>'></asp:Label></td>
                                    <td class="tditemtemplate">
                                        <asp:DropDownList ID="ddlPresentismo" runat="server">
                                            <asp:ListItem Value="1">Presente</asp:ListItem>
                                            <asp:ListItem Value="0">Ausente</asp:ListItem>
                                        </asp:DropDownList></td>
                                </ItemTemplate>
                                <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            </asp:DataList>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>