<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado_Pacientes.aspx.cs" Inherits="Vista.Listado_Pacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="Css/Listado_Pacientes.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="divmenu">
            <table class="tablamenu">
                <tr>
                    <td align="initial" style="padding-left: 20px" width="85%"><h1>Clinica Medica</h1></td>
                    <td></td>
                    <td align="end" style="padding-right: 20px">
                        <div class="usuario-container">
                            <asp:LinkButton ID="lb_usuario_menu" CssClass="btn-usuario" runat="server" OnClick="lb_usuario_menu_Click">👤
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
            <asp:Button ID="btn_menu" runat="server" Text="Menu" CssClass="btn_volver" OnClick="btn_menu_Click"/>
        </div>
        <div id="divcontenedor">
            <table>
                <tr>
                    <td colspan="2"><h1>Buscar Pacientes</h1></td>
                </tr>
                <tr>
                    <td>Buscar por DNI </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_buscar" runat="server" TextMode="Search"></asp:TextBox></td>
                    <td>
                        <asp:Button ID="btn_buscar" runat="server" CssClass="btn_volver" Text="Buscar" OnClick="btn_buscar_Click" /></td>
                </tr>
                <tr>
                    <td colspan="2">Filtrar por inicial <br />
                        <asp:DropDownList ID="ddl_Letras" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_Letras_SelectedIndexChanged"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2">Filtrar por provincia <br />
                    <asp:DropDownList ID="ddl_ProvinciasFiltro" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_ProvinciasFiltro_SelectedIndexChanged">
                    </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <br />
        <div class="tabla-datos" align="center">

            <asp:ListView ID="lv_pacientes" runat="server" DataSourceID="SqlDataSourcePacientes">
               <%-- <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="DNILabel" runat="server" Text='<%# Eval("DNI") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProvinciaLabel" runat="server" Text='<%# Eval("Provincia") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LocalidadLabel" runat="server" Text='<%# Eval("Localidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Nombre_y_ApellidoLabel" runat="server" Text='<%# Eval("[Nombre y Apellido]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Sexo_PaciLabel" runat="server" Text='<%# Eval("Sexo_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Nacionalidad_PaciLabel" runat="server" Text='<%# Eval("Nacionalidad_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="FechaNacimiento_PaciLabel" runat="server" Text='<%# Eval("FechaNacimiento_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Direccion_PaciLabel" runat="server" Text='<%# Eval("Direccion_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CorreoElectronico_PaciLabel" runat="server" Text='<%# Eval("CorreoElectronico_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Telefono_PaciLabel" runat="server" Text='<%# Eval("Telefono_Paci") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>--%>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                        </td>
                        <td>
                            <asp:TextBox ID="DNITextBox" runat="server" Text='<%# Bind("DNI") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ProvinciaTextBox" runat="server" Text='<%# Bind("Provincia") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LocalidadTextBox" runat="server" Text='<%# Bind("Localidad") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Nombre_y_ApellidoTextBox" runat="server" Text='<%# Bind("[Nombre y Apellido]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Sexo_PaciTextBox" runat="server" Text='<%# Bind("Sexo_Paci") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Nacionalidad_PaciTextBox" runat="server" Text='<%# Bind("Nacionalidad_Paci") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="FechaNacimiento_PaciTextBox" runat="server" Text='<%# Bind("FechaNacimiento_Paci") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Direccion_PaciTextBox" runat="server" Text='<%# Bind("Direccion_Paci") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CorreoElectronico_PaciTextBox" runat="server" Text='<%# Bind("CorreoElectronico_Paci") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Telefono_PaciTextBox" runat="server" Text='<%# Bind("Telefono_Paci") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No se han devuelto datos.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                        </td>
                        <td>
                            <asp:TextBox ID="DNITextBox" runat="server" Text='<%# Bind("DNI") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ProvinciaTextBox" runat="server" Text='<%# Bind("Provincia") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LocalidadTextBox" runat="server" Text='<%# Bind("Localidad") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Nombre_y_ApellidoTextBox" runat="server" Text='<%# Bind("[Nombre y Apellido]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Sexo_PaciTextBox" runat="server" Text='<%# Bind("Sexo_Paci") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Nacionalidad_PaciTextBox" runat="server" Text='<%# Bind("Nacionalidad_Paci") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="FechaNacimiento_PaciTextBox" runat="server" Text='<%# Bind("FechaNacimiento_Paci") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Direccion_PaciTextBox" runat="server" Text='<%# Bind("Direccion_Paci") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CorreoElectronico_PaciTextBox" runat="server" Text='<%# Bind("CorreoElectronico_Paci") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Telefono_PaciTextBox" runat="server" Text='<%# Bind("Telefono_Paci") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="DNILabel" runat="server" Text='<%# Eval("DNI") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProvinciaLabel" runat="server" Text='<%# Eval("Provincia") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LocalidadLabel" runat="server" Text='<%# Eval("Localidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Nombre_y_ApellidoLabel" runat="server" Text='<%# Eval("[Nombre y Apellido]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Sexo_PaciLabel" runat="server" Text='<%# Eval("Sexo_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Nacionalidad_PaciLabel" runat="server" Text='<%# Eval("Nacionalidad_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="FechaNacimiento_PaciLabel" runat="server" Text='<%# Eval("FechaNacimiento_Paci", "{0:d}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Direccion_PaciLabel" runat="server" Text='<%# Eval("Direccion_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CorreoElectronico_PaciLabel" runat="server" Text='<%# Eval("CorreoElectronico_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Telefono_PaciLabel" runat="server" Text='<%# Eval("Telefono_Paci") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table class="tabla-datos" runat="server">
                                    <tr runat="server" style="">
                                        <th runat="server">DNI</th>
                                        <th runat="server">Provincia</th>
                                        <th runat="server">Localidad</th>
                                        <th runat="server">Nombre y Apellido</th>
                                        <th runat="server">Sexo_Paci</th>
                                        <th runat="server">Nacionalidad_Paci</th>
                                        <th runat="server">FechaNacimiento_Paci</th>
                                        <th runat="server">Direccion_Paci</th>
                                        <th runat="server">CorreoElectronico_Paci</th>
                                        <th runat="server">Telefono_Paci</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="DNILabel" runat="server" Text='<%# Eval("DNI") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProvinciaLabel" runat="server" Text='<%# Eval("Provincia") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LocalidadLabel" runat="server" Text='<%# Eval("Localidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Nombre_y_ApellidoLabel" runat="server" Text='<%# Eval("[Nombre y Apellido]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Sexo_PaciLabel" runat="server" Text='<%# Eval("Sexo_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Nacionalidad_PaciLabel" runat="server" Text='<%# Eval("Nacionalidad_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="FechaNacimiento_PaciLabel" runat="server" Text='<%# Eval("FechaNacimiento_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Direccion_PaciLabel" runat="server" Text='<%# Eval("Direccion_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CorreoElectronico_PaciLabel" runat="server" Text='<%# Eval("CorreoElectronico_Paci") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Telefono_PaciLabel" runat="server" Text='<%# Eval("Telefono_Paci") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <br />

            <asp:SqlDataSource ID="SqlDataSourcePacientes" runat="server" ConnectionString="<%$ ConnectionStrings:BDClinicaConnectionString %>" SelectCommand= "SELECT DNI_Paci AS DNI,Descripcion_Prov AS Provincia,Descripcion_Local AS Localidad, (Nombre_Paci +' '+ Apellido_Paci) AS [Nombre y Apellido],Sexo_Paci,Nacionalidad_Paci,FechaNacimiento_Paci,Direccion_Paci,CorreoElectronico_Paci,Telefono_Paci 
 FROM Pacientes INNER JOIN Provincias ON Pacientes.Id_Provincia_Paci = Provincias.Id_Provincia_Prov 
 INNER JOIN Localidades ON Pacientes.Id_Localidad_Paci = Localidades.Id_Localidad_Local
WHERE Activo_Paci = 1"></asp:SqlDataSource>
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
