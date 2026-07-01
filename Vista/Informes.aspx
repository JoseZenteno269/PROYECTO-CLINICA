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
                <div style="width: 50%" align="center">
                    <br />
                    <table class="table-informes">
                        <tr>
                            <td colspan="2">
                                <h2>Informe 1</h2>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Periodo Inicio</p>
                                <asp:TextBox ID="txt_fecha_inicio" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                            <td>
                                <p>Periodo Fin</p>
                                <asp:TextBox ID="txt_fecha_fin" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="btn_aceptar" runat="server" Text="Aceptar" OnClick="btn_aceptar_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="initial">
                                <asp:Label ID="lbl_turnos" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="initial">
                                <asp:Label ID="lbl_porcentajes" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="width: 50%" align="center">
                    <br />
                    <table class="table-informes">
                        <tr>
                            <td colspan="3">
                                <h2>Informe 2</h2>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Periodo Inicio</p>
                                <asp:TextBox ID="txt_fecha_inicio1" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                            <td>
                                <p>Periodo Fin</p>
                                <asp:TextBox ID="txt_fecha_fin1" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                            <td>
                                <p>Seleccione Especialidad</p>
                                <asp:DropDownList ID="ddl_especialidades" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="btn_aceptar1" runat="server" Text="Aceptar" OnClick="btn_aceptar1_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lbl_turnosXespecialidad" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">Especialida mas demandada</td>
                        </tr>
                        <tr>
                            <td colspan="3">promedio de turnos x mes</td>
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
        <div id="contenedor4" align="center">
            <div style="width: 50%">
                <table class="table-datos">
                    <tr>
                        <td colspan="2"  align="center">
                            <h2>Informe 4</h2>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 90%" colspan="2" align="center">
                            <p>Mes</p>
                            <asp:DropDownList ID="ddl_mes_4" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td colspan="2"  align="center">
                            <p>Año</p>
                            <asp:DropDownList ID="ddl_anio_4" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td style="width: 10%">Lunes</td>
                        <td colspan="2" style="padding: 20px">
                            <asp:Button ID="barra1" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                    </tr>
                    <tr>
                        <td style="width: 10%">Martes</td>
                        <td colspan="2" style="padding: 20px">
                            <asp:Button ID="barra2" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                    </tr>
                    <tr>
                        <td style="width: 10%">Miercoles</td>
                        <td colspan="2" style="padding: 20px">
                            <asp:Button ID="barra3" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                    </tr>
                    <tr>
                        <td style="width: 10%">Jueves</td>
                        <td colspan="2" style="padding: 20px">
                            <asp:Button ID="barra4" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                    </tr>
                    <tr>
                        <td style="width: 10%">Viernes</td>
                        <td colspan="2" style="padding: 20px">
                            <asp:Button ID="barra5" CssClass="barra" runat="server" Text="" Enabled="False" Font-Bold="True" ForeColor="Black" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="initial">
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
