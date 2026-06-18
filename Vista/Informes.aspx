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
        <div id="contediv">
            <asp:Button ID="btn_menu" runat="server" Text="Menu" CssClass="button" OnClick="btn_menu_Click" />
        </div>
        <div id="contenedor1">
                <div style="width: 50%">
                    <br />
                    <table>
                        <tr>
                            <td colspan="2">
                                <h2>Informe 1</h2>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_fecha_inicio" runat="server" TextMode="Date"></asp:TextBox>
                                <%--<div class="link-contenedor">
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
                                </div>--%>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_fecha_fin" runat="server" TextMode="Date"></asp:TextBox>
                                <%--<div class="link-contenedor">
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
                                </div>--%>
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
                        <tr>
                            <td colspan="3">
                                <h2>Informe 2</h2>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_fecha_inicio1" runat="server" TextMode="Date"></asp:TextBox>
                                <%--<div class="link-contenedor">
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
                                </div>--%>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_fecha_fin1" runat="server" TextMode="Date"></asp:TextBox>
                                <%--<div class="link-contenedor">
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
                                </div>--%>
                            </td>
                            <td>Seleccione Especialidad
                                    <br />
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>--Seleccione una especialidad--</asp:ListItem>
                                    <asp:ListItem>Pediatra</asp:ListItem>
                                    <asp:ListItem>Cirujano</asp:ListItem>
                                    <asp:ListItem>Neo-Cirujano</asp:ListItem>
                                </asp:DropDownList>
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
        <div id="contenedor2">
            <div>
                <table>
                    <tr>
                        <td colspan="3">
                            <h2>Informe 3</h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Mes</p>
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Month"></asp:TextBox>
<%--                            <asp:DropDownList ID="ddl_mes" runat="server">
                                <asp:ListItem>--Seleccione un Mes</asp:ListItem>
                                <asp:ListItem>Enero</asp:ListItem>
                                <asp:ListItem>Febrero</asp:ListItem>
                                <asp:ListItem>Marzo</asp:ListItem>
                                <asp:ListItem>Abril</asp:ListItem>
                                <asp:ListItem>Mayo</asp:ListItem>
                                <asp:ListItem>Junio</asp:ListItem>
                                <asp:ListItem>Julio</asp:ListItem>
                                <asp:ListItem>Agosto</asp:ListItem>
                                <asp:ListItem>Septiembre</asp:ListItem>
                                <asp:ListItem>Octubre</asp:ListItem>
                                <asp:ListItem>Noviembre</asp:ListItem>
                                <asp:ListItem>Diciembre</asp:ListItem>
                            </asp:DropDownList>--%>

                        </td>
                        <td>
                            <p>Año</p>
<%--                            <asp:DropDownList ID="DropDownList2" runat="server">
                                <asp:ListItem>--Seleccione Año--</asp:ListItem>
                                <asp:ListItem>2020</asp:ListItem>
                                <asp:ListItem>2021</asp:ListItem>
                                <asp:ListItem>2022</asp:ListItem>
                                <asp:ListItem>2023</asp:ListItem>
                                <asp:ListItem>2024</asp:ListItem>
                                <asp:ListItem>2025</asp:ListItem>
                                <asp:ListItem>2026</asp:ListItem>
                            </asp:DropDownList>--%>

                        </td>
                        <td>
                            <p>Medico</p>
                            <asp:DropDownList ID="DropDownList3" runat="server">
                                <asp:ListItem>--Seleccione un Medico--</asp:ListItem>
                                <asp:ListItem>Medico 1</asp:ListItem>
                                <asp:ListItem>Medico 2</asp:ListItem>
                                <asp:ListItem>Medico 3</asp:ListItem>
                            </asp:DropDownList></td>
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
                    <tr>
                        <td colspan="3">
                            <h2>Informe 4</h2>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <p>Mes</p>
                            <asp:DropDownList ID="ddl_mes_4" runat="server"></asp:DropDownList></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <p>Año</p>
                            <asp:DropDownList ID="ddl_anio_4" runat="server"></asp:DropDownList></td>
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
                    <tr>
                        <td colspan="3">
                            <h2>Informe 5</h2>
                        </td>
                    </tr>
                    <tr>
                        <td>Seleccione una provincia:</td>
                        <td>
                            <asp:DropDownList ID="ddl_Informe5" runat="server">
                                <asp:ListItem>--Seleccione una provincia--</asp:ListItem>
                                <asp:ListItem>Buenos Aires</asp:ListItem>
                                <asp:ListItem>Tucuman</asp:ListItem>
                                <asp:ListItem>Santa Fe</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Pacientes por Provincia</td>
                        <td>
                            <asp:GridView ID="gvInforme5" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="DNI"></asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nombre"></asp:TemplateField>
                                    <asp:TemplateField HeaderText="Apellido"></asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td class="auto-style1"></td>
                    </tr>
                    <tr>
                        <td>Seleccione una disponibilidad:</td>
                        <td>
                            <asp:DropDownList ID="ddlInforme5" runat="server">
                                <asp:ListItem>--Seleccione una Disponibilidad Horaria--</asp:ListItem>
                                <asp:ListItem>De 08 a 16 HS</asp:ListItem>
                                <asp:ListItem>De 10 a 19 HS</asp:ListItem>
                                <asp:ListItem>De 15 a 23 HS</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style1"></td>
                    </tr>
                    <tr>
                        <td>Medicos sin disponibilidad:</td><td>
                        <asp:GridView ID="gv_Informe5" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Legajo"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Especialidad"></asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>Seleccione un Rango de edad:</td><td>
                        <asp:DropDownList ID="ddlRangos" runat="server">
                            <asp:ListItem>--Seleccione un rango de Edad--</asp:ListItem>
                            <asp:ListItem>0 a 18 Años</asp:ListItem>
                            <asp:ListItem>19 a 30</asp:ListItem>
                            <asp:ListItem>31 a 50</asp:ListItem>
                            <asp:ListItem>51 a 59</asp:ListItem>
                            <asp:ListItem>60 +</asp:ListItem>
                        </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Pacientes:</td><td>
                        <asp:GridView ID="gvEdad" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="DNI"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha Nacimiento"></asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        </td>
                    </tr>
                </table>
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
