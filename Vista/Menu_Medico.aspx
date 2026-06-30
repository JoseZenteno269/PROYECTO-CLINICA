<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu_Medico.aspx.cs" Inherits="Vista.MenuMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Menu_Medicos.css" rel="stylesheet" type="text/css" />
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
            <div class="contenedor-turnos">
                <div class="tarjeta-turno">
                    <table>
                        <tr>
                            <th><b>Estado</b></th>
                            <th><b>Paciente</b></th>
                            <th><b>Dni</b></th>
                            <th><b>Hora</b></th>
                            <th><b>Fecha</b></th>
                            <th><b>Asistencia</b></th>
                            <th><b>Descipcion</b></th>
                        </tr>
                    </table>
                </div>
                <asp:DataList ID="DLMedico" runat="server" CellPadding="4" DataSourceID="SqlDataSourceMedico" RepeatDirection="Horizontal" RepeatColumns="1" CssClass="dt" GridLines="None" BorderStyle="None" BorderWidth="0px">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" />
                    <ItemTemplate>
                        <div class="tarjeta-turno">
                            <table>
                                <tr>
                                    <td>
                                        <span>
                                            <asp:Label ID="Estadolabel" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                                        </span>
                                    </td>
                                    <td>
                                        <span>
                                            <asp:Label ID="MedicoLabel" runat="server" Text='<%# Eval("Paciente") %>' />
                                        </span>
                                    </td>
                                    <td><span>
                                        <asp:Label ID="EspecialidadLabel" runat="server" Text='<%# Eval("DNI") %>' /></span></td>
                                    <td><span>
                                        <asp:Label ID="HorarioLabel" runat="server" Text='<%# Eval("Horario") %>' /></span></td>
                                    <td><span>
                                        <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha", "{0:d}") %>' /></span></td>
                                    <td><span>
                                        <asp:DropDownList ID="ddlAsistencia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlAsistencia_SelectedIndexChanged">
                                            <asp:ListItem Value="0">-- Asistencia --</asp:ListItem>
                                            <asp:ListItem Value="1">Presente</asp:ListItem>
                                            <asp:ListItem Value="2">Ausente</asp:ListItem>
                                        </asp:DropDownList>
                                    </span></td>
                                    <td><span>
                                        <asp:TextBox ID="txtObservaciones" runat="server" Enabled="False" TextMode="MultiLine"></asp:TextBox></span></td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" />
                </asp:DataList>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceMedico" runat="server" ConnectionString="<%$ ConnectionStrings:BDClinicaConnectionString %>" SelectCommand="SELECT Descripcion_EsTur AS Estado, (Nombre_Paci + ' ' + Apellido_Paci) AS Paciente, DNI_Paci AS DNI, CONVERT(VARCHAR(5), Horario_Tur, 108) AS Horario, Fecha_Tur AS Fecha
FROM Turnos 
INNER JOIN Pacientes ON Turnos.Id_Paciente_Tur = Pacientes.Id_Paciente_Paci
INNER JOIN EstadoTurno ON Turnos.Id_EstadoTurno_Tur = EstadoTurno.Id_Estado_EsTur"></asp:SqlDataSource>
            </div>
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
