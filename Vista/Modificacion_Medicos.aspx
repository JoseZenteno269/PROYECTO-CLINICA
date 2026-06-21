<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modificacion_Medicos.aspx.cs" Inherits="Vista.Modificacion_Medicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Modificacion_Medicos.css" rel="stylesheet" type="text/css" />
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
        <div id="divcontenedor">
            <table>
                <tr>
                    <td>Ingrese Legajo, DNI, Nombre o Apellido: 
                    </td>
                    <td>
                        <asp:TextBox ID="txt_busqueda" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" OnClick="btn_Aceptar_Click" />
                    </td>
                </tr>
            </table>
            <asp:ListView ID="lv_medicos" runat="server" DataKeyNames="Id_Medico_Med" DataSourceID="sds_medicos" OnItemCanceling="lv_medicos_ItemCanceling" OnItemEditing="lv_medicos_ItemEditing" OnItemUpdating="lv_medicos_ItemUpdating">
                <AlternatingItemTemplate>
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
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Id_Medico_MedLabel1" runat="server" Text='<%# Eval("Id_Medico_Med") %>'></asp:Label>
                    <br />
                    Legajo_Med:
                    <asp:Label ID="lbl_Legajo_Med" runat="server" Text='<%# Bind("Legajo_Med") %>'></asp:Label>
                    <br />
                    Id_Provincia_Med:
                    <asp:DropDownList ID="ddl_Id_Provincia_Med" runat="server" AutoPostBack="True"></asp:DropDownList>
                    <br />
                    Id_Localidad_Med:
                    <asp:DropDownList ID="ddl_Id_Localidad_Med" runat="server"></asp:DropDownList>
                    <br />
                    Id_Especialidad_Med:
                    <asp:DropDownList ID="ddl_Id_Especialidad_Med" runat="server" AutoPostBack="True"></asp:DropDownList>
                    <br />
                    DNI_Med:
                    <asp:Label ID="lbl_DNI_Med" runat="server" Text='<%# Bind("DNI_Med") %>'></asp:Label>
                    <br />
                    Nombre_Med:
                    <asp:TextBox ID="Nombre_MedTextBox" runat="server" Text='<%# Bind("Nombre_Med") %>'></asp:TextBox>
                    <br />
                    Apellido_Med:
                    <asp:TextBox ID="Apellido_MedTextBox" runat="server" Text='<%# Bind("Apellido_Med") %>'></asp:TextBox>
                    <br />
                    Sexo_Med:
                    <asp:DropDownList ID="ddl_Sexo_Med" runat="server" AutoPostBack="True">
                        <asp:ListItem>Masculino</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    Nacionalidad_Med:
                    <asp:TextBox ID="Nacionalidad_MedTextBox" runat="server" Text='<%# Bind("Nacionalidad_Med") %>'></asp:TextBox>
                    <br />
                    FechaNacimiento_Med:
                    <asp:TextBox ID="FechaNacimiento_MedTextBox" runat="server" Text='<%# Bind("FechaNacimiento_Med", "{0:d}") %>' TextMode="Date"></asp:TextBox>
                    <br />
                    Direccion_Med:
                    <asp:TextBox ID="Direccion_MedTextBox" runat="server" Text='<%# Bind("Direccion_Med") %>'></asp:TextBox>
                    <br />
                    CorreoElectronico_Med:
                    <asp:TextBox ID="CorreoElectronico_MedTextBox" runat="server" Text='<%# Bind("CorreoElectronico_Med") %>'></asp:TextBox>
                    <br />
                    Telefono_Med:
                    <asp:TextBox ID="Telefono_MedTextBox" runat="server" Text='<%# Bind("Telefono_Med") %>'></asp:TextBox>
                    <br />
                    <asp:CheckBox ID="Activo_MedCheckBox" runat="server" Checked='<%# Bind("Activo_Med") %>' Enabled="False" Text="Activo_Med" />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    <span>
                    </span>
                    <div style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No se han devuelto datos.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">Legajo_Med:
                    <asp:TextBox ID="Legajo_MedTextBox" runat="server" Text='<%# Bind("Legajo_Med") %>' />
                    <br />Id_Provincia_Med:
                    <asp:TextBox ID="Id_Provincia_MedTextBox" runat="server" Text='<%# Bind("Id_Provincia_Med") %>' />
                    <br />Id_Localidad_Med:
                    <asp:TextBox ID="Id_Localidad_MedTextBox" runat="server" Text='<%# Bind("Id_Localidad_Med") %>' />
                    <br />Id_Especialidad_Med:
                    <asp:TextBox ID="Id_Especialidad_MedTextBox" runat="server" Text='<%# Bind("Id_Especialidad_Med") %>' />
                    <br />DNI_Med:
                    <asp:TextBox ID="DNI_MedTextBox" runat="server" Text='<%# Bind("DNI_Med") %>' />
                    <br />Nombre_Med:
                    <asp:TextBox ID="Nombre_MedTextBox" runat="server" Text='<%# Bind("Nombre_Med") %>' />
                    <br />Apellido_Med:
                    <asp:TextBox ID="Apellido_MedTextBox" runat="server" Text='<%# Bind("Apellido_Med") %>' />
                    <br />Sexo_Med:
                    <asp:TextBox ID="Sexo_MedTextBox" runat="server" Text='<%# Bind("Sexo_Med") %>' />
                    <br />Nacionalidad_Med:
                    <asp:TextBox ID="Nacionalidad_MedTextBox" runat="server" Text='<%# Bind("Nacionalidad_Med") %>' />
                    <br />FechaNacimiento_Med:
                    <asp:TextBox ID="FechaNacimiento_MedTextBox" runat="server" Text='<%# Bind("FechaNacimiento_Med") %>' />
                    <br />Direccion_Med:
                    <asp:TextBox ID="Direccion_MedTextBox" runat="server" Text='<%# Bind("Direccion_Med") %>' />
                    <br />CorreoElectronico_Med:
                    <asp:TextBox ID="CorreoElectronico_MedTextBox" runat="server" Text='<%# Bind("CorreoElectronico_Med") %>' />
                    <br />Telefono_Med:
                    <asp:TextBox ID="Telefono_MedTextBox" runat="server" Text='<%# Bind("Telefono_Med") %>' />
                    <br />
                    <asp:CheckBox ID="Activo_MedCheckBox" runat="server" Checked='<%# Bind("Activo_Med") %>' Text="Activo_Med" />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                    <br /><br /></span>
                </InsertItemTemplate>
                <ItemTemplate>
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
                    <asp:Label ID="FechaNacimiento_MedLabel" runat="server" Text='<%# Eval("FechaNacimiento_Med", "{0:d}") %>' />
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
                    <asp:CheckBox ID="Activo_MedCheckBox" runat="server" Checked='<%# Eval("Activo_Med") %>' Enabled="False" Text="Activo_Med" />
                    <br />
                    <br /></span>
                    <asp:LinkButton ID="lb_editar" runat="server" CommandName="Edit" Text="Editar" />
                    <br />
                    <br />
                    <span>                   
                    <div style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                        </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span style="" />
                        Id_Medico_Med: <span id="itemPlaceholder" runat="server"></span>
                    </div>
                    </span>
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
<br /></span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:SqlDataSource ID="sds_medicos" runat="server" ConnectionString="<%$ ConnectionStrings:BDClinicaConnectionString %>" ProviderName="<%$ ConnectionStrings:BDClinicaConnectionString.ProviderName %>" SelectCommand="SELECT [Id_Medico_Med], [Legajo_Med], [Id_Provincia_Med], [Id_Localidad_Med], [Id_Especialidad_Med], [DNI_Med], [Nombre_Med], [Apellido_Med], [Sexo_Med], [Nacionalidad_Med], [FechaNacimiento_Med], [Direccion_Med], [CorreoElectronico_Med], [Telefono_Med], [Activo_Med] FROM [Medicos]">
            </asp:SqlDataSource>
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
