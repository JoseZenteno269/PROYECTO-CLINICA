<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modificacion_Medicos.aspx.cs" Inherits="Vista.Modificacion_Medicos" MaintainScrollPositionOnPostback="true"  %>

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

                                <asp:LinkButton ID="lb_perfil" CssClass="opcion-menu" runat="server" OnClick="lb_perfil_Click">Mi Perfil</asp:LinkButton>
                                <asp:LinkButton ID="lb_menu" CssClass="opcion-menu" runat="server" OnClick="lb_menu_Click">Menu</asp:LinkButton>
                                <asp:LinkButton ID="lb_cerrar_sesion" CssClass="opcion-menu opcion-roja" runat="server" OnClick="lb_cerrar_sesion_Click">Cerrar Sesion</asp:LinkButton>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <br />
        <div id="divcontenedor">
            <table>
                <tr>
                    <td>Ingrese Legajo, DNI, Nombre o Apellido: 
                    </td>
                    <td>
                        <asp:TextBox ID="txt_busqueda" runat="server" TextMode="Search"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" OnClick="btn_Aceptar_Click" CssClass="btn_volver" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lbl_mensaje" runat="server"></asp:Label>
            <br />
            <div class="contenedor-grid">
            <asp:GridView ID="gv_medicos" CssClass="gv" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="gv_medicos_RowCancelingEdit" OnRowEditing="gv_medicos_RowEditing" OnRowUpdating="gv_medicos_RowUpdating" DataKeyNames="Id_Provincia_Med,Id_Localidad_Med,Id_Especialidad_Med,Sexo_Med,FechaNacimiento_Med" GridLines="None" BorderStyle="None" BorderWidth="0px" CellPadding="0">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ValidationGroup="1" />
                    <asp:TemplateField HeaderText="ID MEDICO">
                        <EditItemTemplate>
                            <asp:Label ID="lbl_idmedico" runat="server" Text='<%# Bind("Id_Medico_Med") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_idmedico" runat="server" Text='<%# Bind("Id_Medico_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Legajo">
                        <EditItemTemplate>
                            <asp:Label ID="lbl_legajo" runat="server" Text='<%# Bind("Legajo_Med") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_legajo" runat="server" Text='<%# Bind("Legajo_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI">
                        <EditItemTemplate>
                            <asp:Label ID="lbl_dni" runat="server" Text='<%# Bind("DNI_Med") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_dni" runat="server" Text='<%# Bind("DNI_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_nombre" runat="server" Text='<%# Bind("Nombre_Med") %>' Width="70"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_nombre" runat="server" ErrorMessage="Campo Incompleto" ControlToValidate="txt_nombre" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_nombre" runat="server" ErrorMessage="Caracteres invalidos" ControlToValidate="txt_nombre" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_nombre" runat="server" Text='<%# Bind("Nombre_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_apellido" runat="server" Text='<%# Bind("Apellido_Med") %>' Width="70"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_apellido" runat="server" ErrorMessage="Campo incompleto" ValidationGroup="1" ControlToValidate="txt_apellido">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_apellido" runat="server" ErrorMessage="Caracteres invalidos" ValidationGroup="1" ControlToValidate="txt_apellido" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_apellido" runat="server" Text='<%# Bind("Apellido_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Provincia">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_provincias" runat="server" AutoPostBack="True" Width="80" OnSelectedIndexChanged="ddl_provincias_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_provincia" runat="server" ErrorMessage="Eleccion invalida" ControlToValidate="ddl_provincias" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_provincia" runat="server" Text='<%# Bind("Descripcion_Prov") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Localidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_localidad" runat="server" Width="100">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_localidad" runat="server" ErrorMessage="Eleccion invalida" ControlToValidate="ddl_localidad" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_localidad" runat="server" Text='<%# Bind("Descripcion_Local") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_especialidad" runat="server" Width="100">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_especialidad" runat="server" ErrorMessage="Eleccion invalida" ControlToValidate="ddl_especialidad" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_especialidad" runat="server" Text='<%# Bind("Nombre_Espe") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sexo">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_genero" runat="server">
                                <asp:ListItem Value="0">--Opcion--</asp:ListItem>
                                <asp:ListItem>Masculino</asp:ListItem>
                                <asp:ListItem>Femenino</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_genero" runat="server" ErrorMessage="Eleccion invalida" ControlToValidate="ddl_genero" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_sexo" runat="server" Text='<%# Bind("Sexo_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nacionalidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_nacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Med") %>' Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_nacionalidad" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_nacionalidad" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_nacionalidad" runat="server" ErrorMessage="Caracteres invalidos" ControlToValidate="txt_nacionalidad" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_nacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha de Nacimiento">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_fecha" runat="server" Text='<%# Bind("FechaNacimiento_Med", "{0:d}") %>' Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_fecha" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_fecha" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_fecha" runat="server" ErrorMessage="Caracteres invalidos" ControlToValidate="txt_fecha" ValidationExpression="^\d{1,2}[/-]\d{1,2}[/-]\d{4}$" ValidationGroup="1">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_fechanacimiento" runat="server" Text='<%# Bind("FechaNacimiento_Med", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_direccion" runat="server" Text='<%# Bind("Direccion_Med") %>' Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_direccion" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_direccion" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_direccion" runat="server" ErrorMessage="Caracteres invalidos" ControlToValidate="txt_direccion" ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_direccion" runat="server" Text='<%# Bind("Direccion_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_correo" runat="server" Text='<%# Bind("CorreoElectronico_Med") %>' Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_correo" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_correo" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_correo" runat="server" Text='<%# Bind("CorreoElectronico_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_telefono" runat="server" Text='<%# Bind("Telefono_Med") %>' Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_telefono" runat="server" ErrorMessage="Campo incompleto" ControlToValidate="txt_telefono" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_telefono" runat="server" ErrorMessage="Caracteres invalidos" ControlToValidate="txt_telefono" ValidationExpression="^[0-9]+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_telefono" runat="server" Text='<%# Bind("Telefono_Med") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ShowMessageBox="True" ShowSummary="False" ValidationGroup="1" />
            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="divlogos" align="end">
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
