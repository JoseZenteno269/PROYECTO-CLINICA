<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alta_Pacientes.aspx.cs" Inherits="Vista.ABML_Pacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Alta_Pacientes.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr><td colspan="3">Pacientes</td></tr>
                <tr>
                    <td>
                        Ingrese DNI: 
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Nombre: 
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Apellido:

                    </td>
                    <td>

                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Sexo

                    </td>
                    <td>

                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Nacionalidad:

                    </td>
                    <td>

                        <asp:DropDownList ID="DropDownList2" runat="server">
                        </asp:DropDownList>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        fecha de naciemiento:

                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList><asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList>
                        <asp:Calendar ID="Calendar1" runat="server" ShowGridLines="True" ShowNextPrevMonth="False" ShowTitle="False"></asp:Calendar>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Direccion:

                    </td>
                    <td>

                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Localidad:

                    </td>
                    <td>

                        <asp:DropDownList ID="DropDownList5" runat="server">
                        </asp:DropDownList>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Provincia:

                    </td>
                    <td>

                        <asp:DropDownList ID="DropDownList6" runat="server">
                        </asp:DropDownList>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Correo Electronico:

                    </td>
                    <td>

                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>

                        Telefono:

                    </td>
                    <td>

                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>ACTIVO</td>
                    <td>
                        <asp:CheckBox ID="CheckBox1" runat="server" /></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
