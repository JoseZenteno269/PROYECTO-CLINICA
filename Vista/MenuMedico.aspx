<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuMedico.aspx.cs" Inherits="Vista.MenuMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="Css/Menu.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

.usuario-container {
    position: relative;
    display: inline-block;
}

.btn-usuario {
    cursor: pointer;
    padding: 13px 56px;
    border: 1px solid #ccc;
    border-radius: 10px;
    background: white;
    font-size: 14px;
    text-decoration: none;
    color: black;
}

.dropdown-panel {
    position: absolute;
    top: 180%;
    right: 0;
    background: white;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    min-width: 180px;
    z-index: 999;
    display: flex;
    flex-direction: column;
    padding: 6px 0;
}

.opcion-menu {
    display: block;
    padding: 10px 16px;
    text-decoration: none;
    color: black;
    font-size: 14px;
    text-align: left;
}

.opcion-roja {
    color: red;
}

.contenedor-turnos {
    height: 80px;
    overflow-y: auto;
    border: 1px solid #ccc;
    border-radius: 6px;
    padding: 5px;
}
    </style>
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
        <div>
            <table>
                <tr><td></td></tr>
                <tr><td>
                    <br />
                    <br />
                    </td></tr>
                <tr><td>Buscar por DNI:
                    <asp:TextBox ID="txtBuscar" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
                    <br />
                    <br />
                    </td></tr>
                <tr style="align-content:center">
                    <td style="align-content: center">
                        <div class="contenedor-turnos">
                            <asp:DataList ID="DLTurnos" runat="server" CellPadding="4" ForeColor="#333333">
                                <AlternatingItemStyle BackColor="White" />
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                <ItemTemplate>
                                    <asp:Label ID="lbl_fecha" runat="server" Text='<%# Eval("Fecha") %>'></asp:Label>
                                    <asp:Label ID="lbl_hora" runat="server" Text='<%# Eval("Hora") %>'></asp:Label>
                                    <asp:Label ID="lbl_paciente" runat="server" Text='<%# Eval("Paciente") %>'></asp:Label>
                                    <asp:Label ID="lbl_medico" runat="server" Text='<%# Eval("Medico") %>'></asp:Label>
                                    <asp:DropDownList ID="ddlPresentismo" runat="server">
                                        <asp:ListItem Value="1">Presente</asp:ListItem>
                                        <asp:ListItem Value="0">Ausente</asp:ListItem>
                                    </asp:DropDownList>
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