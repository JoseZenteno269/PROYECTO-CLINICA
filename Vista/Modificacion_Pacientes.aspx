<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modificacion_Pacientes.aspx.cs" Inherits="Vista.Modificacion_Pacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Modificacion_Pacientes.css" rel="stylesheet" type="text/css" />
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
            <br />
        </div>
        <div id="divcontenedor">
            <table>
                <tr>
                    <td>Ingrese DNI, Nombre o Apellido: 
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lbl_mensaje" runat="server"></asp:Label>
        </div>
        <div class="contenedor-grid">
            <asp:GridView ID="gv_pacientes" CssClass="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Provincia_Paci,Id_Localidad_Paci,Sexo_Paci" OnRowCancelingEdit="gv_pacientes_RowCancelingEdit" OnRowEditing="gv_pacientes_RowEditing" OnRowUpdating="gv_pacientes_RowUpdating" GridLines="None" BorderStyle="None" BorderWidth="0" CellSpacing="0" CellPadding="0">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                    <asp:TemplateField HeaderText="ID PACIENTE">
                        <EditItemTemplate>
                            <asp:Label ID="lbl_idpaciente" runat="server" Text='<%# Bind("Id_Paciente_Paci") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_idpaciente" runat="server" Text='<%# Bind("Id_Paciente_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_nombre" runat="server" Text='<%# Bind("Nombre_Paci") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_nombre" runat="server" Text='<%# Bind("Nombre_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_apellido" runat="server" Text='<%# Bind("Apellido_Paci") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_apellido" runat="server" Text='<%# Bind("Apellido_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI">
                        <EditItemTemplate>
                            <asp:Label ID="lbl_dni" runat="server" Text='<%# Bind("DNI_Paci") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_dni" runat="server" Text='<%# Bind("DNI_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Provincia">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_provincias" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_provincias_SelectedIndexChanged">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_provincia" runat="server" Text='<%# Bind("Descripcion_Prov") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Localidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_localidades" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_localidad" runat="server" Text='<%# Bind("Descripcion_Local") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sexo">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_genero" runat="server">
                                <asp:ListItem Value="0">--Opcion--</asp:ListItem>
                                <asp:ListItem>Masculino</asp:ListItem>
                                <asp:ListItem>Femenino</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_sexo" runat="server" Text='<%# Bind("Sexo_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nacionalidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_nacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Paci") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_nacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha nacimiento ">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_fecha" runat="server" Text='<%# Bind("FechaNacimiento_Paci", "{0:d}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_fecha" runat="server" Text='<%# Bind("FechaNacimiento_Paci", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_direccion" runat="server" Text='<%# Bind("Direccion_Paci") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_direccion" runat="server" Text='<%# Bind("Direccion_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_correo" runat="server" Text='<%# Bind("CorreoElectronico_Paci") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_correo" runat="server" Text='<%# Bind("CorreoElectronico_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_telefono" runat="server" Text='<%# Bind("Telefono_Paci") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_telefono" runat="server" Text='<%# Bind("Telefono_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
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
