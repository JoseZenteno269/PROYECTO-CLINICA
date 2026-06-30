<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu_Medico.aspx.cs" Inherits="Vista.MenuMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Menu_Medicos.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 285px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="divmenu">
            <table class="tablamenu">
                <tr>
                    <td align="initial" style="padding-left: 20px" width="85%"><h1>Clinica Medica</h1>
                    </td>
                    <td></td>
                    <td align="end" style="padding-right: 20px">
                        <div class="usuario-container">
                            <asp:LinkButton ID="lb_usuario_menu" CssClass="btn-usuario" runat="server" OnClick="lb_usuario_menu_Click">👤
                                
                                <asp:Label runat="server" ID="lbl_usuario" Text="usuario"></asp:Label>
                            </asp:LinkButton>
                            <asp:Panel ID="p_panel" CssClass="dropdown-panel" runat="server" Visible="False">
                                <asp:LinkButton ID="lb_perfil" CssClass="opcion-menu" runat="server" OnClick="lb_perfil_Click">Mi Perfil</asp:LinkButton>
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
                    <td class="auto-style1">
                        <div class="contenedor-turnos">
                            <asp:DataList ID="DLMedico" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceMedico" ForeColor="Black" GridLines="Horizontal" RepeatDirection="Horizontal" RepeatColumns="4">
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <ItemTemplate>
    <div class="tarjeta-turno">
        <span><strong>Medico:</strong> <asp:Label ID="MedicoLabel" runat="server" Text='<%# Eval("Medico") %>' /></span>
        <span><strong>Especialidad:</strong> <asp:Label ID="EspecialidadLabel" runat="server" Text='<%# Eval("Especialidad") %>' /></span>
        <span><strong>Horario:</strong> <asp:Label ID="HorarioLabel" runat="server" Text='<%# Eval("Horario") %>' /></span>
        <span><strong>Fecha:</strong> <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' /></span>
        <span><strong>Asistencia:</strong>
            <asp:DropDownList ID="ddlAsistencia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlAsistencia_SelectedIndexChanged">
                <asp:ListItem Value="0">-- Elegir una opcion --</asp:ListItem>
                <asp:ListItem Value="1">Presente</asp:ListItem>
                <asp:ListItem Value="2">Ausente</asp:ListItem>
            </asp:DropDownList>
        Observacion:<br />
        </span>
        <asp:TextBox ID="txtObservaciones" runat="server" Enabled="False" TextMode="MultiLine"></asp:TextBox>
    </div>
</ItemTemplate>
                                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            </asp:DataList>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSourceMedico" runat="server" ConnectionString="<%$ ConnectionStrings:BDClinicaDataList %>" ProviderName="<%$ ConnectionStrings:BDClinicaDataList.ProviderName %>" SelectCommand="SELECT  (Nombre_Med + ' ' + Apellido_Med) AS Medico, Nombre_Espe AS Especialidad, CONVERT(VARCHAR(5), Horario_Tur, 108) AS Horario, Fecha_Tur AS Fecha
FROM Turnos 
INNER JOIN Medicos ON Turnos.Id_Medico_Tur = Medicos.Id_Medico_Med 
INNER JOIN Especialidad ON Turnos.Id_Especialidad_Tur = Especialidad.Id_Especialidad_Espe
"></asp:SqlDataSource>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        &nbsp;</td>
                </tr>
            </table>
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