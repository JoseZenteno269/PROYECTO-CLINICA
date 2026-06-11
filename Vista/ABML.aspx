<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABML.aspx.cs" Inherits="Vista.ABML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/ABML.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            <div class="divs">
                <table>
                    <tr>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">ABML MEDICOS
                        </td>
                        <td class="auto-style1"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="center">
                            <asp:Menu ID="Menu_Medicos" runat="server" StaticDisplayLevels="1" StaticSubMenuIndent="0" Orientation="Horizontal" ForeColor="Black" RenderingMode="Table">
                                <DynamicMenuItemStyle CssClass="menuitem"/>
                                <DynamicMenuStyle VerticalPadding="15px" />
                                <Items>
                                    <asp:MenuItem Text="Medicos" Value="Medicos">
                                        <asp:MenuItem Text="Alta" Value="Alta"></asp:MenuItem>
                                        <asp:MenuItem Text="Baja" Value="Baja"></asp:MenuItem>
                                        <asp:MenuItem Text="Modificacion" Value="Modificacion"></asp:MenuItem>
                                        <asp:MenuItem Text="Listado" Value="Listado"></asp:MenuItem>
                                    </asp:MenuItem>
                                </Items>
                            </asp:Menu>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="divs">
                <table>
                    <tr>
                        <td></td>
                        <td>ABML PACIENTES
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="center">
                            <asp:Menu ID="Menu_Pacientes" runat="server" StaticDisplayLevels="1" StaticSubMenuIndent="0" Orientation="Horizontal" ForeColor="Black" RenderingMode="Table">
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
                            </asp:Menu>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
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
    </form>
</body>
</html>
