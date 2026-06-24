<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado_Medicos.aspx.cs" Inherits="Vista.Listado_Medicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="Css/Listado_Medicos.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 78px;
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
            <asp:Button ID="btn_menu" runat="server" Text="Menu" CssClass="button" OnClick="btn_menu_Click"/>
        </div>
        <div id="divcontenedor">
            <table>
                <tr>
                    <td>
                    Ingrese Legajo: 
                    </td>
                    <td>
                        <asp:TextBox ID="txt_buscar" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Button ID="btn_buscar" runat="server" Text="Buscar" OnClick="btn_buscar_Click" />
                    </td>
                    </tr>
            </table>
        </div>
        <div class="contenedor-lista" >
            <asp:ListView ID="lv_Medicos" runat="server" DataSourceID="SqlDataSourceMedicos">
                <%--<AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="LegajoLabel" runat="server" Text='<%# Eval("Legajo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProvinciaLabel" runat="server" Text='<%# Eval("Provincia") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LocalidadLabel" runat="server" Text='<%# Eval("Localidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EspecialidadLabel" runat="server" Text='<%# Eval("Especialidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DniLabel" runat="server" Text='<%# Eval("Dni") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Nombre_y_ApellidoLabel" runat="server" Text='<%# Eval("[Nombre y Apellido]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SexoLabel" runat="server" Text='<%# Eval("Sexo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NacionalidadLabel" runat="server" Text='<%# Eval("Nacionalidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Fecha_de_NacimientoLabel" runat="server" Text='<%# Eval("[Fecha de Nacimiento]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DireccionLabel" runat="server" Text='<%# Eval("Direccion") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TelefonoLabel" runat="server" Text='<%# Eval("Telefono") %>' />
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
                            <asp:TextBox ID="LegajoTextBox" runat="server" Text='<%# Bind("Legajo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ProvinciaTextBox" runat="server" Text='<%# Bind("Provincia") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LocalidadTextBox" runat="server" Text='<%# Bind("Localidad") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="EspecialidadTextBox" runat="server" Text='<%# Bind("Especialidad") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DniTextBox" runat="server" Text='<%# Bind("Dni") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Nombre_y_ApellidoTextBox" runat="server" Text='<%# Bind("[Nombre y Apellido]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="SexoTextBox" runat="server" Text='<%# Bind("Sexo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="NacionalidadTextBox" runat="server" Text='<%# Bind("Nacionalidad") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Fecha_de_NacimientoTextBox" runat="server" Text='<%# Bind("[Fecha de Nacimiento]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DireccionTextBox" runat="server" Text='<%# Bind("Direccion") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TelefonoTextBox" runat="server" Text='<%# Bind("Telefono") %>' />
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
                            <asp:Button ID="CancelButton0" runat="server" CommandName="Cancel" Text="Borrar" />
                        </td>
                        <td>
                            <asp:TextBox ID="LegajoTextBox0" runat="server" Text='<%# Bind("Legajo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ProvinciaTextBox0" runat="server" Text='<%# Bind("Provincia") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LocalidadTextBox0" runat="server" Text='<%# Bind("Localidad") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="EspecialidadTextBox0" runat="server" Text='<%# Bind("Especialidad") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DniTextBox0" runat="server" Text='<%# Bind("Dni") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Nombre_y_ApellidoTextBox0" runat="server" Text='<%# Bind("[Nombre y Apellido]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="SexoTextBox0" runat="server" Text='<%# Bind("Sexo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="NacionalidadTextBox0" runat="server" Text='<%# Bind("Nacionalidad") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Fecha_de_NacimientoTextBox0" runat="server" Text='<%# Bind("[Fecha de Nacimiento]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DireccionTextBox0" runat="server" Text='<%# Bind("Direccion") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="EmailTextBox0" runat="server" Text='<%# Bind("Email") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TelefonoTextBox0" runat="server" Text='<%# Bind("Telefono") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="LegajoLabel0" runat="server" Text='<%# Eval("Legajo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProvinciaLabel0" runat="server" Text='<%# Eval("Provincia") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LocalidadLabel0" runat="server" Text='<%# Eval("Localidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EspecialidadLabel0" runat="server" Text='<%# Eval("Especialidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DniLabel0" runat="server" Text='<%# Eval("Dni") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Nombre_y_ApellidoLabel0" runat="server" Text='<%# Eval("[Nombre y Apellido]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SexoLabel0" runat="server" Text='<%# Eval("Sexo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NacionalidadLabel0" runat="server" Text='<%# Eval("Nacionalidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Fecha_de_NacimientoLabel0" runat="server" Text='<%# Eval("[Fecha de Nacimiento]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DireccionLabel0" runat="server" Text='<%# Eval("Direccion") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailLabel0" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TelefonoLabel0" runat="server" Text='<%# Eval("Telefono") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table class="tabla-datos" runat="server">
                                    <tr runat="server" style="">
                                        <th runat="server">Legajo</th>
                                        <th runat="server">Provincia</th>
                                        <th runat="server">Localidad</th>
                                        <th runat="server">Especialidad</th>
                                        <th runat="server">Dni</th>
                                        <th runat="server">Nombre y Apellido</th>
                                        <th runat="server">Sexo</th>
                                        <th runat="server">Nacionalidad</th>
                                        <th runat="server">Fecha de Nacimiento</th>
                                        <th runat="server">Direccion</th>
                                        <th runat="server">Email</th>
                                        <th runat="server">Telefono</th>
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
                            <asp:Label ID="LegajoLabel1" runat="server" Text='<%# Eval("Legajo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProvinciaLabel1" runat="server" Text='<%# Eval("Provincia") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LocalidadLabel1" runat="server" Text='<%# Eval("Localidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EspecialidadLabel1" runat="server" Text='<%# Eval("Especialidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DniLabel1" runat="server" Text='<%# Eval("Dni") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Nombre_y_ApellidoLabel1" runat="server" Text='<%# Eval("[Nombre y Apellido]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SexoLabel1" runat="server" Text='<%# Eval("Sexo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NacionalidadLabel1" runat="server" Text='<%# Eval("Nacionalidad") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Fecha_de_NacimientoLabel1" runat="server" Text='<%# Eval("[Fecha de Nacimiento]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DireccionLabel1" runat="server" Text='<%# Eval("Direccion") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailLabel1" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TelefonoLabel1" runat="server" Text='<%# Eval("Telefono") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
             <br />

            <br />
            <asp:SqlDataSource ID="SqlDataSourceMedicos" runat="server" ConnectionString="<%$ ConnectionStrings:BDClinicaListadoMedicos %>" ProviderName="<%$ ConnectionStrings:BDClinicaListadoMedicos.ProviderName %>" SelectCommand="  SELECT Legajo_Med AS Legajo,Descripcion_Prov AS Provincia,Descripcion_Local AS Localidad, Nombre_Espe AS Especialidad,DNI_Med AS Dni,(Nombre_Med + Apellido_Med) AS [Nombre y Apellido], Sexo_Med AS Sexo,Nacionalidad_Med AS Nacionalidad,FechaNacimiento_Med AS [Fecha de Nacimiento],Direccion_Med AS Direccion,CorreoElectronico_Med AS Email,Telefono_Med AS Telefono
  FROM Medicos INNER JOIN Provincias ON Medicos.Id_Provincia_Med = Provincias.Id_Provincia_Prov 
  INNER JOIN Localidades ON Medicos.Id_Localidad_Med = Localidades.Id_Localidad_Local
  INNER JOIN Especialidad ON Medicos.Id_Especialidad_Med = Especialidad.Id_Especialidad_Espe"></asp:SqlDataSource>
         </div>
        </div>
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
