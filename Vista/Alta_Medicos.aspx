<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alta_Medicos.aspx.cs" Inherits="Vista.ABML_Medicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="Css/Alta_Meidicos.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="form-medicos">
                <tr><td colspan="3">Medicos</td></tr>
                <tr>
                    <td>Legajo:</td>
                    <td><asp:TextBox ID="txt_legajo_m" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Ingrese DNI:</td>
                    <td><asp:TextBox ID="txt_dni_m" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><asp:TextBox ID="txt_nombre_m" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Apellido:</td>
                    <td><asp:TextBox ID="txt_apellido_m" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Sexo:</td>
                    <td>
                        <asp:DropDownList ID="ddl_sexo_m" runat="server"></asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Nacionalidad:</td>
                    <td>
                        <asp:DropDownList ID="ddl_nacionalidad_m" runat="server"></asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Fecha de nacimiento:</td>
                    <td>
                        <asp:DropDownList ID="ddl_mes_m" runat="server"></asp:DropDownList>
                        <asp:DropDownList ID="ddl_anio_m" runat="server"></asp:DropDownList>
                        <br />
                        <asp:Calendar ID="c_calendario_m" runat="server" CssClass="aspNetCalendar" ShowGridLines="True" ShowNextPrevMonth="False" ShowTitle="False"></asp:Calendar>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Direccion:</td>
                    <td><asp:TextBox ID="txt_direccion_m" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Localidad:</td>
                    <td>
                        <asp:DropDownList ID="ddl_localidad_m" runat="server"></asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Provincia:</td>
                    <td>
                        <asp:DropDownList ID="ddl_provincia_m" runat="server"></asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Correo Electronico:</td>
                    <td><asp:TextBox ID="txt_correo_m" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Telefono:</td>
                    <td><asp:TextBox ID="txt_telefono_m" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>ACTIVO:</td>
                    <td><asp:CheckBox ID="cb_activo_m" runat="server" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" class="botones">
                        <asp:Button ID="btn_guardar" runat="server" Text="Guardar" CssClass="btn-guardar" />
                        <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="btn-cancelar" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>