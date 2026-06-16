<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Horarios_Medicos.aspx.cs" Inherits="Vista.Horarios_Medicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Horarios_Medicos.css" rel="stylesheet" type="text/css" />
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
                <div id="contediv">
            <asp:Button ID="btn_menu" runat="server" Text="Menu" CssClass="button" OnClick="btn_menu_Click"/>
        </div>
        <div align="center">
            <table class="tableshoras">
                <tr>
                    <td colspan="5" align="center">
                        <p>Ingrese Legajo</p>
                        <asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="cb_lunes" runat="server" Text="Lunes" /></td>
                    <td>
                        <asp:CheckBox ID="cb_martes" runat="server" Text="Martes" /></td>
                    <td>
                        <asp:CheckBox ID="cb_miercoles" runat="server" Text="Miercoles" /></td>
                    <td>
                        <asp:CheckBox ID="cb_jueves" runat="server" Text="Jueves" /></td>
                    <td>
                        <asp:CheckBox ID="cb_viernes" runat="server" Text="Viernes" /></td>
                </tr>
            </table>
            <table class="tableshoras">
                <tr>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList5" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList6" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList7" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList8" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Hora Inicio:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList9" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>Hora Fin:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList10" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="5" style="text-align: center">
                        <asp:Button ID="Button1" runat="server" Text="Aceptar" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
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
