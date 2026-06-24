<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asignar_Turno.aspx.cs" Inherits="Vista.Asignar_Turno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Asignar_Turnos.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 267px;
        }
    </style>
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
        <div id="divrow">
            <div class="divfila">
                <table class="tableturnos">
                    <tr>
                        <td>
                            <p>Seleccione una Especilidad:</p>
                            <asp:DropDownList ID="ddl_especialidad" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_especialidad_SelectedIndexChanged"></asp:DropDownList></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <p>Seleccione un Medico:</p>
                            <asp:DropDownList ID="ddl_medicos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_medicos_SelectedIndexChanged"></asp:DropDownList></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td align="center" class="auto-style1">
                            <p>Elija un dia</p>
                            <asp:Calendar ID="c_dias" runat="server"></asp:Calendar>
                        </td>
                        <td class="auto-style1"></td>
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
                <asp:GridView ID="gvPacientesSeleccion" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="DNI">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_DNI" runat="server" Text='<%# Bind("DNI_Paci") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre y Apellido">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_NombreApellido" runat="server" Text='<%# Eval("Nombre_Paci") + " " + Eval("Apellido_Paci") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefono">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Telefono" runat="server" Text='<%# Bind("Telefono_Paci") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </div>
        </div>
        <div>
            <table style="width: 100%">
                <tr>
                    <td align="center">
                        <asp:Button ID="btn_confirmar" runat="server" Text="Confirmar" OnClick="btn_confirmar_Click" />
                    </td>
                    <td align="center">
                        <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" OnClick="btn_cancelar_Click" />
                    </td>
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
