<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil_Administrador.aspx.cs" Inherits="Vista.Perfil_Administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Css/Perfil_Administrador.css" rel="stylesheet" type="text/css" /> 
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
                            <asp:LinkButton ID="lbl_usuario_menu" CssClass="btn-usuario" runat="server" OnClick="lbl_usuario_menu_Click">
                                👤
                        <asp:Label runat="server" ID="lbl_usuario" Text="usuario"></asp:Label>
                            </asp:LinkButton>
                            <asp:Panel ID="p_panel" CssClass="dropdown-panel" runat="server" Visible="False">
                                <asp:LinkButton ID="lb_menu" CssClass="opcion-menu" runat="server" OnClick="lb_menu_Click">Menu</asp:LinkButton>
                                <asp:LinkButton ID="lb_cerrar_sesion" CssClass="opcion-menu opcion-roja" runat="server" OnClick="lb_cerrar_sesion_Click">Cerrar Sesion</asp:LinkButton>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="contenedor">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Administrador_Admin" DataSourceID="sds_administrador">
                <%--<AlternatingItemTemplate>
                    <span style="">Id_Administrador_Admin:
                    <asp:Label ID="Id_Administrador_AdminLabel" runat="server" Text='<%# Eval("Id_Administrador_Admin") %>' />
                    <br />
                    DNI_Admin:
                    <asp:Label ID="DNI_AdminLabel" runat="server" Text='<%# Eval("DNI_Admin") %>' />
                    <br />
                    Nombre_Admin:
                    <asp:Label ID="Nombre_AdminLabel" runat="server" Text='<%# Eval("Nombre_Admin") %>' />
                    <br />
                    CorreoElectronico_Admin:
                    <asp:Label ID="CorreoElectronico_AdminLabel" runat="server" Text='<%# Eval("CorreoElectronico_Admin") %>' />
                    <br />
                    Apellido_Admin:
                    <asp:Label ID="Apellido_AdminLabel" runat="server" Text='<%# Eval("Apellido_Admin") %>' />
                    <br />
                    Telefono_Admin:
                    <asp:Label ID="Telefono_AdminLabel" runat="server" Text='<%# Eval("Telefono_Admin") %>' />
                    <br />
                    <asp:CheckBox ID="Activo_AdminCheckBox" runat="server" Checked='<%# Eval("Activo_Admin") %>' Enabled="false" Text="Activo_Admin" />
                    <br />
<br /></span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="">Id_Administrador_Admin:
                    <asp:Label ID="Id_Administrador_AdminLabel1" runat="server" Text='<%# Eval("Id_Administrador_Admin") %>' />
                    <br />
                    DNI_Admin:
                    <asp:TextBox ID="DNI_AdminTextBox" runat="server" Text='<%# Bind("DNI_Admin") %>' />
                    <br />
                    Nombre_Admin:
                    <asp:TextBox ID="Nombre_AdminTextBox" runat="server" Text='<%# Bind("Nombre_Admin") %>' />
                    <br />
                    CorreoElectronico_Admin:
                    <asp:TextBox ID="CorreoElectronico_AdminTextBox" runat="server" Text='<%# Bind("CorreoElectronico_Admin") %>' />
                    <br />
                    Apellido_Admin:
                    <asp:TextBox ID="Apellido_AdminTextBox" runat="server" Text='<%# Bind("Apellido_Admin") %>' />
                    <br />
                    Telefono_Admin:
                    <asp:TextBox ID="Telefono_AdminTextBox" runat="server" Text='<%# Bind("Telefono_Admin") %>' />
                    <br />
                    <asp:CheckBox ID="Activo_AdminCheckBox" runat="server" Checked='<%# Bind("Activo_Admin") %>' Text="Activo_Admin" />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    <br /><br /></span>
                </EditItemTemplate>--%>
                <EmptyDataTemplate>
                    <span>No se han devuelto datos.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">DNI_Admin:
                    <asp:TextBox ID="DNI_AdminTextBox" runat="server" Text='<%# Bind("DNI_Admin") %>' />
                    <br />Nombre_Admin:
                    <asp:TextBox ID="Nombre_AdminTextBox" runat="server" Text='<%# Bind("Nombre_Admin") %>' />
                    <br />CorreoElectronico_Admin:
                    <asp:TextBox ID="CorreoElectronico_AdminTextBox" runat="server" Text='<%# Bind("CorreoElectronico_Admin") %>' />
                    <br />Apellido_Admin:
                    <asp:TextBox ID="Apellido_AdminTextBox" runat="server" Text='<%# Bind("Apellido_Admin") %>' />
                    <br />Telefono_Admin:
                    <asp:TextBox ID="Telefono_AdminTextBox" runat="server" Text='<%# Bind("Telefono_Admin") %>' />
                    <br />
                    <asp:CheckBox ID="Activo_AdminCheckBox" runat="server" Checked='<%# Bind("Activo_Admin") %>' Text="Activo_Admin" />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                    <br /><br /></span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <table class="tabla-listview">
                        <tr>
                            <td>
                                Id Administrador :
                            </td>
                            <td>
                                <asp:Label ID="Id_Administrador_AdminLabel" runat="server" Text='<%# Eval("Id_Administrador_Admin") %>' />
                            </td>
                        </tr>
                        <br />
                        <tr>
                            <td>
                                DNI :
                            </td>
                            <td>
                                <asp:Label ID="DNI_AdminLabel" runat="server" Text='<%# Eval("DNI_Admin") %>' />
                            </td>
                        </tr>
                        <br />
                        <tr>
                            <td>
                                Nombre :
                            </td>
                            <td>
                                <asp:Label ID="Nombre_AdminLabel" runat="server" Text='<%# Eval("Nombre_Admin") %>' />
                            </td>
                        </tr>
                        <br />
                        <tr>
                            <td>
                                Apellido :
                            </td>
                            <td>
                                <asp:Label ID="Apellido_AdminLabel" runat="server" Text='<%# Eval("Apellido_Admin") %>' />
                            </td>
                        </tr>
                        <br />
                        <tr>
                            <td>
                                Correo Electronico :
                            </td>
                            <td>
                                <asp:Label ID="CorreoElectronico_AdminLabel" runat="server" Text='<%# Eval("CorreoElectronico_Admin") %>' />
                            </td>
                        </tr>
                        <br />
                        <tr>
                            <td>
                                Telefono :
                            </td>
                            <td>
                                <asp:Label ID="Telefono_AdminLabel" runat="server" Text='<%# Eval("Telefono_Admin") %>' />
                            </td>
                        </tr>
                    </table>
                    <span style="">
                    <br />
                    <br /></span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="">Id_Administrador_Admin:
                    <asp:Label ID="Id_Administrador_AdminLabel" runat="server" Text='<%# Eval("Id_Administrador_Admin") %>' />
                    <br />
                    DNI_Admin:
                    <asp:Label ID="DNI_AdminLabel" runat="server" Text='<%# Eval("DNI_Admin") %>' />
                    <br />
                    Nombre_Admin:
                    <asp:Label ID="Nombre_AdminLabel" runat="server" Text='<%# Eval("Nombre_Admin") %>' />
                    <br />
                    CorreoElectronico_Admin:
                    <asp:Label ID="CorreoElectronico_AdminLabel" runat="server" Text='<%# Eval("CorreoElectronico_Admin") %>' />
                    <br />
                    Apellido_Admin:
                    <asp:Label ID="Apellido_AdminLabel" runat="server" Text='<%# Eval("Apellido_Admin") %>' />
                    <br />
                    Telefono_Admin:
                    <asp:Label ID="Telefono_AdminLabel" runat="server" Text='<%# Eval("Telefono_Admin") %>' />
                    <br />
                    <asp:CheckBox ID="Activo_AdminCheckBox" runat="server" Checked='<%# Eval("Activo_Admin") %>' Enabled="false" Text="Activo_Admin" />
                    <br />
<br /></span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="sds_administrador" runat="server" ConnectionString="<%$ ConnectionStrings:BDClinicaConnectionString %>" SelectCommand="SELECT [Id_Administrador_Admin], [DNI_Admin], [Nombre_Admin], [CorreoElectronico_Admin], [Apellido_Admin], [Telefono_Admin], [Activo_Admin] FROM [Administradores]"></asp:SqlDataSource>
        </div>
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
