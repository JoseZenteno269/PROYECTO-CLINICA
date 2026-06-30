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
                    <td>Ingrese DNI, Nombre o Apellido: 
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Search"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" ValidationGroup="2" CssClass="btn_volver" />
                        <asp:RequiredFieldValidator ID="rfv_Busqueda" runat="server" ControlToValidate="TextBox1" ErrorMessage="Ingresar DNI, Nombre o Apellido" ValidationGroup="2">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Busqueda" runat="server" ControlToValidate="TextBox1" ErrorMessage="Ingrese DNI, nombre o apellido valido" ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ]+$" ValidationGroup="2">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lbl_mensaje" runat="server"></asp:Label>
        </div>
        <div class="contenedor-grid">
            <asp:GridView ID="gv_pacientes" CssClass="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Provincia_Paci,Id_Localidad_Paci,Sexo_Paci" OnRowCancelingEdit="gv_pacientes_RowCancelingEdit" OnRowEditing="gv_pacientes_RowEditing" OnRowUpdating="gv_pacientes_RowUpdating" GridLines="None" BorderStyle="None" BorderWidth="0px" CellPadding="0">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ValidationGroup="1" />
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
                            <asp:RequiredFieldValidator ID="rfv_Nombre" runat="server" ControlToValidate="txt_nombre" ErrorMessage="Ingrese un nombre" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_Medicos" runat="server" ControlToValidate="txt_nombre" ErrorMessage="Ingrese solo letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_nombre" runat="server" Text='<%# Bind("Nombre_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_apellido" runat="server" Text='<%# Bind("Apellido_Paci") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_Apellido" runat="server" ControlToValidate="txt_apellido" ErrorMessage="Ingrese un apellido" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_Apellido" runat="server" ControlToValidate="txt_apellido" ErrorMessage="Ingresar solo letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
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
                            <asp:RequiredFieldValidator ID="rfv_Provincia" runat="server" ControlToValidate="ddl_provincias" ErrorMessage="Seleccione una opcion" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_provincia" runat="server" Text='<%# Bind("Descripcion_Prov") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Localidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_localidades" runat="server">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_Localidad" runat="server" ControlToValidate="ddl_localidades" ErrorMessage="Seleccione una opcion" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="rfv_Sexo" runat="server" ControlToValidate="ddl_genero" ErrorMessage="Seleccione una opcion" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_sexo" runat="server" Text='<%# Bind("Sexo_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nacionalidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_nacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Paci") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_Nacionalidad" runat="server" ControlToValidate="txt_nacionalidad" ErrorMessage="Ingrese una nacionalidad" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_Nacionalidad" runat="server" ControlToValidate="txt_nacionalidad" ErrorMessage="Ingrese solo letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_nacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha nacimiento ">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_fecha" runat="server" Text='<%# Bind("FechaNacimiento_Paci", "{0:d}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_Fecha" runat="server" ControlToValidate="txt_fecha" ErrorMessage="Ingrese una fecha" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_fecha" runat="server" ErrorMessage="Caracteres invalidos" ControlToValidate="txt_fecha" ValidationExpression="^\d{1,2}[/-]\d{1,2}[/-]\d{4}$" ValidationGroup="1">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_fecha" runat="server" Text='<%# Bind("FechaNacimiento_Paci", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_direccion" runat="server" Text='<%# Bind("Direccion_Paci") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_Direccion" runat="server" ControlToValidate="txt_direccion" ErrorMessage="Ingrese una direccion" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_Direccion" runat="server" ControlToValidate="txt_direccion" ErrorMessage="Ingrese una direccion valida" ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_direccion" runat="server" Text='<%# Bind("Direccion_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_correo" runat="server" Text='<%# Bind("CorreoElectronico_Paci") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_Correo" runat="server" ControlToValidate="txt_correo" ErrorMessage="Ingrese un correo electronico" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_Correo" runat="server" ControlToValidate="txt_correo" ErrorMessage="Ingrese un correo valido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="1">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_correo" runat="server" Text='<%# Bind("CorreoElectronico_Paci") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_telefono" runat="server" Text='<%# Bind("Telefono_Paci") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_Telefono" runat="server" ControlToValidate="txt_telefono" ErrorMessage="Ingrese un telefono" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_Telefono" runat="server" ControlToValidate="txt_telefono" ErrorMessage="Ingrese solo numeros" ValidationExpression="^[0-9]+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
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
        <asp:ValidationSummary ID="VSPacientes" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="1" />
    </form>
</body>
</html>
