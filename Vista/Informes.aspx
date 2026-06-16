<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="Vista.Informes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Informes.css" rel="stylesheet" type="text/css" />
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
        <div id="contenedor1">
            <div id="contenedor2">
                <div id="contenedor3">
                    <div style="width: 50%">
                        <br />
                        <table>
                            <tr><td colspan="2"><h2>Informe 1</h2></td></tr>
                            <tr>
                                <td>
                                    <div class="link-contenedor">
                                        <asp:LinkButton ID="lb_panel_fecha_inicial" CssClass="btn-link" runat="server" OnClick="lb_panel_fecha_Click">
                                            <asp:Label ID="lbl_fecha_inicio" runat="server" Text="Periodo Inicio"></asp:Label>
                                        </asp:LinkButton>
                                        <asp:Panel ID="p_fecha_inicio" runat="server" Visible="False" CssClass="panel-calendario">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_mes_inicio" runat="server"></asp:DropDownList></td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_anio_inicio" runat="server"></asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Calendar ID="calendario1" runat="server" ShowTitle="False" ShowGridLines="True" Width="50%"></asp:Calendar>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </div>
                                </td>
                                <td>
                                    <div class="link-contenedor">
                                        <asp:LinkButton ID="lb_panel_fecha_final" CssClass="btn-link" runat="server" OnClick="lb_panel_fecha_final_Click">
                                            <asp:Label ID="lbl_fecha_fin" runat="server" Text="Periodo Fin"></asp:Label>
                                        </asp:LinkButton>
                                        <asp:Panel ID="p_fecha_fin" runat="server" CssClass="panel-calendario" Visible="false">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_mes_fin" runat="server"></asp:DropDownList></td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_anio_fin" runat="server"></asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Calendar ID="calendario2" runat="server" ShowTitle="False" ShowGridLines="True" Width="50%"></asp:Calendar>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 80px 0 0 10px" colspan="3" align="initial">
                                    <asp:Label ID="lbl_turnos" runat="server" Text="Total de Turnos"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 80px 0 0 10px" colspan="3" align="initial">Porcentaje de presentes y ausentes</td>
                            </tr>
                            <tr>
                                <td style="padding: 80px 0 0 10px" colspan="3" align="initial">lista de pacientes</td>
                            </tr>
                        </table>
                    </div>
                    <div style="width: 50%">
                        <br />
                        <table>
                            <tr><td colspan="3"><h2>Informe 2</h2></td></tr>
                            <tr>
                                <td>
                                    <div class="link-contenedor">
                                        <asp:LinkButton ID="lb_fecha_inicio2" CssClass="btn-link" runat="server" OnClick="lb_fecha_inicio2_Click">
                                            <asp:Label ID="lbl_periodo_inicio" runat="server" Text="Periodo Inicio"></asp:Label>
                                        </asp:LinkButton>
                                        <asp:Panel ID="p_fecha_inicio_2" runat="server" Visible="False" CssClass="panel-calendario">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_mes2" runat="server"></asp:DropDownList></td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_anio2" runat="server"></asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Calendar ID="c_calendario2" runat="server" ShowTitle="False" ShowGridLines="True" Width="50%"></asp:Calendar>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </div>
                                </td>
                                <td>
                                    <div class="link-contenedor">
                                        <asp:LinkButton ID="lb_fecha_inicio_2" CssClass="btn-link" runat="server" OnClick="lb_fecha_inicio_2_Click">
                                            <asp:Label ID="lbl_periodo_fin_2" runat="server" Text="Periodo Fin"></asp:Label>
                                        </asp:LinkButton>
                                        <asp:Panel ID="p_fecha_fin_2" runat="server" CssClass="panel-calendario" Visible="false">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_mes_3" runat="server"></asp:DropDownList></td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_anio3" runat="server"></asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Calendar ID="c_calendario_3" runat="server" ShowTitle="False" ShowGridLines="True" Width="50%"></asp:Calendar>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </div>
                                </td>
                                <td>
                                    Seleccione Especialidad
                                    <br />
                                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 80px 0 0 10px" colspan="3" align="initial">
                                    <asp:Label ID="lbl_turnosXespecialidad" runat="server" Text="turnos"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 80px 0 0 10px" colspan="3" align="initial">Especialida mas demandada</td>
                            </tr>
                            <tr>
                                <td style="padding: 80px 0 0 10px" colspan="3" align="initial">promedio de turnos x mes</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div>
                    <table>
                        <tr><td colspan="3"><h2>Informe 3</h2></td></tr>
                        <tr>
                            <td><p>Mes</p>
                                <asp:DropDownList ID="ddl_mes" runat="server"></asp:DropDownList></td>
                            <td><p>Año</p>
                                <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList></td>
                            <td><p>Medico</p>
                                <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList></td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Medico"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Turnos"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Ausentes"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Presentes"></asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div id="contenedor4">
                <div style="width: 50%">
                    <table>
                        <tr><td colspan="3"><h2>Informe 4</h2></td></tr>
                        <tr>
                            <td></td>
                            <td><p>Mes</p><asp:DropDownList ID="ddl_mes_4" runat="server"></asp:DropDownList></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p>Año</p><asp:DropDownList ID="ddl_anio_4" runat="server"></asp:DropDownList></td>
                            <td></td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td style="width: 25px">Lunes</td>
                            <td colspan="2" style="padding: 20px">
                                <asp:Button ID="barra1" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                        </tr>
                        <tr>
                            <td style="width: 25px">Martes</td>
                            <td colspan="2" style="padding: 20px">
                                <asp:Button ID="barra2" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                        </tr>
                        <tr>
                            <td style="width: 25px">Miercoles</td>
                            <td colspan="2" style="padding: 20px">
                                <asp:Button ID="barra3" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                        </tr>
                        <tr>
                            <td style="width: 25px">Jueves</td>
                            <td colspan="2" style="padding: 20px">
                                <asp:Button ID="barra4" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                        </tr>
                        <tr>
                            <td style="width: 25px">Viernes</td>
                            <td colspan="2" style="padding: 20px">
                                <asp:Button ID="barra5" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                        </tr>
                        <tr>
                            <td colspan="3" align="initial">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="width: 50%">
                    <table>
                        <tr><td colspan="3"><h2>Informe 5</h2></td></tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>5</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
