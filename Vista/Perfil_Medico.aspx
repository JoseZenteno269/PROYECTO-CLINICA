<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil_Medico.aspx.cs" Inherits="Vista.Perfil_Medico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Css/Perfil_Medico.css" rel="stylesheet" type="text/css" />
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
                            <asp:LinkButton ID="lbl_usuario_menu" CssClass="btn-usuario" runat="server" OnClick="lbl_usuario_menu_Click">👤
                                <asp:Label runat="server" ID="lbl_usuario" Text="usuario"></asp:Label></asp:LinkButton>
                            <asp:Panel ID="p_panel" CssClass="dropdown-panel" runat="server" Visible="False">

                                <asp:LinkButton ID="lb_menu" CssClass="opcion-menu" runat="server" OnClick="lb_perfil_Click">Menu</asp:LinkButton>
                                <asp:LinkButton ID="lb_cerrar_sesion" CssClass="opcion-menu opcion-roja" runat="server" OnClick="lb_cerrar_sesion_Click">Cerrar Sesion</asp:LinkButton>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="contenedor">
            <asp:ListView ID="lv_medicos" runat="server" DataKeyNames="Id_Medico_Med" DataSourceID="sds_medicos">
                <%--                <AlternatingItemTemplate>
                    <span style="">Id_Medico_Med:
                    <asp:Label ID="Id_Medico_MedLabel" runat="server" Text='<%# Eval("Id_Medico_Med") %>' />
                    <br />
                    Legajo_Med:
                    <asp:Label ID="Legajo_MedLabel" runat="server" Text='<%# Eval("Legajo_Med") %>' />
                    <br />
                    Id_Provincia_Med:
                    <asp:Label ID="Id_Provincia_MedLabel" runat="server" Text='<%# Eval("Id_Provincia_Med") %>' />
                    <br />
                    Id_Localidad_Med:
                    <asp:Label ID="Id_Localidad_MedLabel" runat="server" Text='<%# Eval("Id_Localidad_Med") %>' />
                    <br />
                    Id_Especialidad_Med:
                    <asp:Label ID="Id_Especialidad_MedLabel" runat="server" Text='<%# Eval("Id_Especialidad_Med") %>' />
                    <br />
                    DNI_Med:
                    <asp:Label ID="DNI_MedLabel" runat="server" Text='<%# Eval("DNI_Med") %>' />
                    <br />
                    Nombre_Med:
                    <asp:Label ID="Nombre_MedLabel" runat="server" Text='<%# Eval("Nombre_Med") %>' />
                    <br />
                    Apellido_Med:
                    <asp:Label ID="Apellido_MedLabel" runat="server" Text='<%# Eval("Apellido_Med") %>' />
                    <br />
                    Sexo_Med:
                    <asp:Label ID="Sexo_MedLabel" runat="server" Text='<%# Eval("Sexo_Med") %>' />
                    <br />
                    Nacionalidad_Med:
                    <asp:Label ID="Nacionalidad_MedLabel" runat="server" Text='<%# Eval("Nacionalidad_Med") %>' />
                    <br />
                    FechaNacimiento_Med:
                    <asp:Label ID="FechaNacimiento_MedLabel" runat="server" Text='<%# Eval("FechaNacimiento_Med") %>' />
                    <br />
                    Direccion_Med:
                    <asp:Label ID="Direccion_MedLabel" runat="server" Text='<%# Eval("Direccion_Med") %>' />
                    <br />
                    CorreoElectronico_Med:
                    <asp:Label ID="CorreoElectronico_MedLabel" runat="server" Text='<%# Eval("CorreoElectronico_Med") %>' />
                    <br />
                    Telefono_Med:
                    <asp:Label ID="Telefono_MedLabel" runat="server" Text='<%# Eval("Telefono_Med") %>' />
                    <br />
                    <asp:CheckBox ID="Activo_MedCheckBox" runat="server" Checked='<%# Eval("Activo_Med") %>' Enabled="false" Text="Activo_Med" />
                    <br />
                    <br /></span>
                </AlternatingItemTemplate>--%>
<%--                <EditItemTemplate>
                    <span style="">Id_Medico_Med:
                    <asp:Label ID="Id_Medico_MedLabel1" runat="server" Text='<%# Eval("Id_Medico_Med") %>' />
                        <br />
                        Legajo_Med:
                    <asp:TextBox ID="Legajo_MedTextBox" runat="server" Text='<%# Bind("Legajo_Med") %>' />
                        <br />
                        Id_Provincia_Med:
                    <asp:TextBox ID="Id_Provincia_MedTextBox" runat="server" Text='<%# Bind("Id_Provincia_Med") %>' />
                        <br />
                        Id_Localidad_Med:
                    <asp:TextBox ID="Id_Localidad_MedTextBox" runat="server" Text='<%# Bind("Id_Localidad_Med") %>' />
                        <br />
                        Id_Especialidad_Med:
                    <asp:TextBox ID="Id_Especialidad_MedTextBox" runat="server" Text='<%# Bind("Id_Especialidad_Med") %>' />
                        <br />
                        DNI_Med:
                    <asp:TextBox ID="DNI_MedTextBox" runat="server" Text='<%# Bind("DNI_Med") %>' />
                        <br />
                        Nombre_Med:
                    <asp:TextBox ID="Nombre_MedTextBox" runat="server" Text='<%# Bind("Nombre_Med") %>' />
                        <br />
                        Apellido_Med:
                    <asp:TextBox ID="Apellido_MedTextBox" runat="server" Text='<%# Bind("Apellido_Med") %>' />
                        <br />
                        Sexo_Med:
                    <asp:TextBox ID="Sexo_MedTextBox" runat="server" Text='<%# Bind("Sexo_Med") %>' />
                        <br />
                        Nacionalidad_Med:
                    <asp:TextBox ID="Nacionalidad_MedTextBox" runat="server" Text='<%# Bind("Nacionalidad_Med") %>' />
                        <br />
                        FechaNacimiento_Med:
                    <asp:TextBox ID="FechaNacimiento_MedTextBox" runat="server" Text='<%# Bind("FechaNacimiento_Med") %>' />
                        <br />
                        Direccion_Med:
                    <asp:TextBox ID="Direccion_MedTextBox" runat="server" Text='<%# Bind("Direccion_Med") %>' />
                        <br />
                        CorreoElectronico_Med:
                    <asp:TextBox ID="CorreoElectronico_MedTextBox" runat="server" Text='<%# Bind("CorreoElectronico_Med") %>' />
                        <br />
                        Telefono_Med:
                    <asp:TextBox ID="Telefono_MedTextBox" runat="server" Text='<%# Bind("Telefono_Med") %>' />
                        <br />
                        <asp:CheckBox ID="Activo_MedCheckBox" runat="server" Checked='<%# Bind("Activo_Med") %>' Text="Activo_Med" />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                        <br />
                        <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No se han devuelto datos.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">Legajo_Med:
                    <asp:TextBox ID="Legajo_MedTextBox" runat="server" Text='<%# Bind("Legajo_Med") %>' />
                        <br />
                        Id_Provincia_Med:
                    <asp:TextBox ID="Id_Provincia_MedTextBox" runat="server" Text='<%# Bind("Id_Provincia_Med") %>' />
                        <br />
                        Id_Localidad_Med:
                    <asp:TextBox ID="Id_Localidad_MedTextBox" runat="server" Text='<%# Bind("Id_Localidad_Med") %>' />
                        <br />
                        Id_Especialidad_Med:
                    <asp:TextBox ID="Id_Especialidad_MedTextBox" runat="server" Text='<%# Bind("Id_Especialidad_Med") %>' />
                        <br />
                        DNI_Med:
                    <asp:TextBox ID="DNI_MedTextBox" runat="server" Text='<%# Bind("DNI_Med") %>' />
                        <br />
                        Nombre_Med:
                    <asp:TextBox ID="Nombre_MedTextBox" runat="server" Text='<%# Bind("Nombre_Med") %>' />
                        <br />
                        Apellido_Med:
                    <asp:TextBox ID="Apellido_MedTextBox" runat="server" Text='<%# Bind("Apellido_Med") %>' />
                        <br />
                        Sexo_Med:
                    <asp:TextBox ID="Sexo_MedTextBox" runat="server" Text='<%# Bind("Sexo_Med") %>' />
                        <br />
                        Nacionalidad_Med:
                    <asp:TextBox ID="Nacionalidad_MedTextBox" runat="server" Text='<%# Bind("Nacionalidad_Med") %>' />
                        <br />
                        FechaNacimiento_Med:
                    <asp:TextBox ID="FechaNacimiento_MedTextBox" runat="server" Text='<%# Bind("FechaNacimiento_Med") %>' />
                        <br />
                        Direccion_Med:
                    <asp:TextBox ID="Direccion_MedTextBox" runat="server" Text='<%# Bind("Direccion_Med") %>' />
                        <br />
                        CorreoElectronico_Med:
                    <asp:TextBox ID="CorreoElectronico_MedTextBox" runat="server" Text='<%# Bind("CorreoElectronico_Med") %>' />
                        <br />
                        Telefono_Med:
                    <asp:TextBox ID="Telefono_MedTextBox" runat="server" Text='<%# Bind("Telefono_Med") %>' />
                        <br />
                        <asp:CheckBox ID="Activo_MedCheckBox" runat="server" Checked='<%# Bind("Activo_Med") %>' Text="Activo_Med" />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                        <br />
                        <br />
                    </span>
                </InsertItemTemplate>--%>
                <ItemTemplate>
                    <span style="">
                        <table class="tabla-listview">
                            <tr>
                                <td>
                                    ID Medico:
                                </td>
                                <td>
                                    <asp:Label ID="Id_Medico_MedLabel" runat="server" Text='<%# Eval("Id_Medico_Med") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Legajo: 
                                </td>
                                <td>
                                    <asp:Label ID="Legajo_MedLabel" runat="server" Text='<%# Eval("Legajo_Med") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    DNI :
                                </td>
                                <td>
                                    <asp:Label ID="DNI_MedLabel" runat="server" Text='<%# Eval("DNI_Med") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Nombre :
                                </td>
                                <td>
                                    <asp:Label ID="Nombre_MedLabel" runat="server" Text='<%# Eval("Nombre_Med") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Apellido_Med:
                                </td>
                                <td>
                                    <asp:Label ID="Apellido_MedLabel" runat="server" Text='<%# Eval("Apellido_Med") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Provincia :
                                </td>
                                <td>
                                    <asp:Label ID="Id_Provincia_MedLabel" runat="server" Text='<%# Eval("Descripcion_Prov") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Localidad :
                                </td>
                                <td>
                                    <asp:Label ID="Id_Localidad_MedLabel" runat="server" Text='<%# Eval("Descripcion_Local") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Especialidad :
                                </td>
                                <td>
                                    <asp:Label ID="Id_Especialidad_MedLabel" runat="server" Text='<%# Eval("Nombre_Espe") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Sexo :
                                </td>
                                <td>
                                    <asp:Label ID="Sexo_MedLabel" runat="server" Text='<%# Eval("Sexo_Med") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Nacionalidad :
                                </td>
                                <td>
                                    <asp:Label ID="Nacionalidad_MedLabel" runat="server" Text='<%# Eval("Nacionalidad_Med") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Fecha De Nacimiento :
                                </td>
                                <td>
                                    <asp:Label ID="FechaNacimiento_MedLabel" runat="server" Text='<%# Eval("FechaNacimiento_Med", "{0:d}") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Direccion :
                                </td>
                                <td>
                                    <asp:Label ID="Direccion_MedLabel" runat="server" Text='<%# Eval("Direccion_Med") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Correo Electronico :
                                </td>
                                <td>
                                    <asp:Label ID="CorreoElectronico_MedLabel" runat="server" Text='<%# Eval("CorreoElectronico_Med") %>' />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td>
                                    Telefono :
                                </td>
                                <td>
                                    <asp:Label ID="Telefono_MedLabel" runat="server" Text='<%# Eval("Telefono_Med") %>' />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="">Id_Medico_Med:
                    <asp:Label ID="Id_Medico_MedLabel" runat="server" Text='<%# Eval("Id_Medico_Med") %>' />
                        <br />
                        Legajo_Med:
                    <asp:Label ID="Legajo_MedLabel" runat="server" Text='<%# Eval("Legajo_Med") %>' />
                        <br />
                        Id_Provincia_Med:
                    <asp:Label ID="Id_Provincia_MedLabel" runat="server" Text='<%# Eval("Id_Provincia_Med") %>' />
                        <br />
                        Id_Localidad_Med:
                    <asp:Label ID="Id_Localidad_MedLabel" runat="server" Text='<%# Eval("Id_Localidad_Med") %>' />
                        <br />
                        Id_Especialidad_Med:
                    <asp:Label ID="Id_Especialidad_MedLabel" runat="server" Text='<%# Eval("Id_Especialidad_Med") %>' />
                        <br />
                        DNI_Med:
                    <asp:Label ID="DNI_MedLabel" runat="server" Text='<%# Eval("DNI_Med") %>' />
                        <br />
                        Nombre_Med:
                    <asp:Label ID="Nombre_MedLabel" runat="server" Text='<%# Eval("Nombre_Med") %>' />
                        <br />
                        Apellido_Med:
                    <asp:Label ID="Apellido_MedLabel" runat="server" Text='<%# Eval("Apellido_Med") %>' />
                        <br />
                        Sexo_Med:
                    <asp:Label ID="Sexo_MedLabel" runat="server" Text='<%# Eval("Sexo_Med") %>' />
                        <br />
                        Nacionalidad_Med:
                    <asp:Label ID="Nacionalidad_MedLabel" runat="server" Text='<%# Eval("Nacionalidad_Med") %>' />
                        <br />
                        FechaNacimiento_Med:
                    <asp:Label ID="FechaNacimiento_MedLabel" runat="server" Text='<%# Eval("FechaNacimiento_Med") %>' />
                        <br />
                        Direccion_Med:
                    <asp:Label ID="Direccion_MedLabel" runat="server" Text='<%# Eval("Direccion_Med") %>' />
                        <br />
                        CorreoElectronico_Med:
                    <asp:Label ID="CorreoElectronico_MedLabel" runat="server" Text='<%# Eval("CorreoElectronico_Med") %>' />
                        <br />
                        Telefono_Med:
                    <asp:Label ID="Telefono_MedLabel" runat="server" Text='<%# Eval("Telefono_Med") %>' />
                        <br />
                        <asp:CheckBox ID="Activo_MedCheckBox" runat="server" Checked='<%# Eval("Activo_Med") %>' Enabled="false" Text="Activo_Med" />
                        <br />
                        <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="sds_medicos" runat="server" ConnectionString="<%$ ConnectionStrings:BDClinicaConnectionString %>" SelectCommand="SELECT [Id_Medico_Med], [Legajo_Med], [Id_Provincia_Med], [Id_Localidad_Med], [Id_Especialidad_Med], [DNI_Med], [Nombre_Med], [Apellido_Med], [Sexo_Med], [Nacionalidad_Med], [FechaNacimiento_Med], [Direccion_Med], [CorreoElectronico_Med], [Telefono_Med], [Activo_Med] FROM [Medicos]"></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="divlogos">
            <table style="width: 100%">
                <tr>
                    <td>
                        <img src="Imagenes/Logo.png" class="logo" />
                    </td>
                    <td>
                        <img src="Imagenes/Logo1.png" class="logo1" /></td>
                    <td>
                        <img src="Imagenes/Logo2.png" class="logo2" /></td>
                    <td>
                        <img src="Imagenes/Logo3.png" class="logo3" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
