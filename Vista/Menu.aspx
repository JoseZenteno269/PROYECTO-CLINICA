<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Vista.ABML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Menu.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="divmenu">
            <table class="tablamenu">
                <tr>
                    <td align="initial" style="padding-left: 20px" width="85%"><h1>Clinica Medica</h1></td>
                    <td>
                        <asp:Label ID="lbl_usuario" runat="server" Text="USUARIO"></asp:Label></td>
                    <td align="end" style="padding-right: 20px">
                        <asp:Button ID="btn_cerrar" runat="server" Text="Cerrar Sesion" CssClass="bottoncerrarsesion"/>

                    </td>
                </tr>
            </table>
        </div>
        <div id="contenedor">
            <div class="divs">
                <table class="tablaABML">
                    <tr>
                        <td>
                            <img src="Imagenes/Medico.png" class="imagen" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <%--                            <asp:Menu ID="Menu_Medicos" runat="server" StaticDisplayLevels="1" StaticSubMenuIndent="0" Orientation="Horizontal" ForeColor="Black" RenderingMode="Table">
                                <DynamicMenuItemStyle CssClass="menuitem"/>
                                <DynamicMenuStyle VerticalPadding="15px"/>
                                <Items>
                                    <asp:MenuItem Text="Medicos" Value="Medicos">
                                        <asp:MenuItem Text="Alta" Value="Alta"></asp:MenuItem>
                                        <asp:MenuItem Text="Baja" Value="Baja"></asp:MenuItem>
                                        <asp:MenuItem Text="Modificacion" Value="Modificacion"></asp:MenuItem>
                                        <asp:MenuItem Text="Listado" Value="Listado"></asp:MenuItem>
                                    </asp:MenuItem>
                                </Items>
                            </asp:Menu>--%>
                            <h2>Medicos</h2>
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_agregarm" cssclass="botones" runat="server" Text="Agregar" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_dar_bajam" runat="server" Text="Eliminar" CssClass="botones" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_modificarm" runat="server" Text="Modificar" CssClass="botones" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_listarm" runat="server" Text="Listar" CssClass="botones" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="divs">
                <table class="tablaABML">
                    <tr>
                        <td>
                            <img src="Imagenes/paciente.png" class="imagen" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <%--                            <asp:Menu ID="Menu_Pacientes" runat="server" StaticDisplayLevels="1" StaticSubMenuIndent="0" Orientation="Horizontal" ForeColor="Black" RenderingMode="Table">
                                <DynamicMenuItemStyle CssClass="menuitem" />
                                <DynamicMenuStyle VerticalPadding="15px" />
                                <Items>
                                    <asp:MenuItem Text="Pacientes" Value="Pacientes">
                                        <asp:MenuItem Text="Alta" Value="Alta"></asp:MenuItem>
                                        <asp:MenuItem Text="Baja" Value="Baja"></asp:MenuItem>
                                        <asp:MenuItem Text="Modificacion" Value="Modificacion"></asp:MenuItem>
                                        <asp:MenuItem Text="Listado" Value="Listado"></asp:MenuItem>
                                    </asp:MenuItem>
                                </Items>
                            </asp:Menu>--%>
                            <h2>Pacientes</h2>
                        </td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_agregarp" runat="server" Text="Agregar" CssClass="botones" /></td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_dar_bajap" runat="server" Text="Eliminar" CssClass="botones" /></td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_modificarp" runat="server" Text="Modificar" CssClass="botones" /></td>
                    </tr>
                    <tr>
                        <td class="td">
                            <asp:Button ID="btn_listarp" runat="server" Text="Listar" CssClass="botones" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
