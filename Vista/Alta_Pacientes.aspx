<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alta_Pacientes.aspx.cs" Inherits="Vista.ABML_Pacientes" MaintainScrollPositionOnPostback="True" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Alta_Pacientes.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                                <asp:LinkButton ID="lb_cerrar_sesion" CssClass="opcion-menu opcion-roja" runat="server">Cerrar Sesion</asp:LinkButton>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="contediv">
            <asp:Button ID="btn_menu" runat="server" Text="Menu" CssClass="button" OnClick="btn_menu_Click" CausesValidation="False" />
        </div>
        <div class="div">
            <table class="div-pacientes">
                <tr><td colspan="3">Pacientes</td></tr>
                <tr>
                    <td>Ingrese DNI:</td>
                    <td><asp:TextBox ID="txt_dni_p" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_DNI" runat="server" ControlToValidate="txt_dni_p" ErrorMessage="Ingrese un DNI" ValidationGroup="2">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_DNI" runat="server" ControlToValidate="txt_dni_p" ErrorMessage="El DNI solo permite numeros" ValidationExpression="^[0-9]+$" ValidationGroup="2">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><asp:TextBox ID="txt_nombre_p" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Nombre" runat="server" ControlToValidate="txt_nombre_p" ErrorMessage="Ingrese un Nombre" ValidationGroup="2">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Nombre" runat="server" ControlToValidate="txt_nombre_p" ErrorMessage="Solo se permiten letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="2">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Apellido:</td>
                    <td><asp:TextBox ID="txt_apellido_p" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Apellido" runat="server" ControlToValidate="txt_apellido_p" ErrorMessage="Ingrese un Apellido" ValidationGroup="2">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Apellido" runat="server" ControlToValidate="txt_apellido_p" ErrorMessage="Solo se permiten letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="2">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Sexo</td>
                    <td>
                        <asp:DropDownList ID="ddl_sexo_p" runat="server">
                            <asp:ListItem Value="0">--Seleccione una opcion--</asp:ListItem>
                            <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                            <asp:ListItem Value="Femenino">Femenino</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Sexo" runat="server" ControlToValidate="ddl_sexo_p" ErrorMessage="Seleccione una opcion" InitialValue="0" ValidationGroup="2">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Nacionalidad:</td>
                    <td><asp:TextBox ID="txtNacionalidad" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Nacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Ingrese una Nacionalidad" ValidationGroup="2">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Nacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Solo se permiten letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="2">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Fecha de nacimiento:</td>
                    <td><asp:TextBox ID="txt_fecha" runat="server" TextMode="Date"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Fecha" runat="server" ControlToValidate="txt_fecha" ErrorMessage="Ingrese una Fecha" ValidationGroup="2">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Direccion:</td>
                    <td><asp:TextBox ID="txt_direccion_p" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Direccion" runat="server" ControlToValidate="txt_direccion_p" ErrorMessage="Ingrese una Direccion" ValidationGroup="2">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Direccion" runat="server" ControlToValidate="txt_direccion_p" ErrorMessage="Direccion invalida" ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s]+$" ValidationGroup="2">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Provincia:</td>
                    <td>
                        <asp:DropDownList ID="ddl_provincia_p" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_provincia_p_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Provincia" runat="server" ControlToValidate="ddl_provincia_p" ErrorMessage="Seleccione una Provincia" InitialValue="0" ValidationGroup="2">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Localidad:</td>
                    <td>
                        <asp:DropDownList ID="ddl_localdiad_p" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Localidad" runat="server" ControlToValidate="ddl_localdiad_p" ErrorMessage="Seleccione una Localidad" InitialValue="0" ValidationGroup="2">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Correo Electronico:</td>
                    <td><asp:TextBox ID="txt_correo_p" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Correo" runat="server" ControlToValidate="txt_correo_p" ErrorMessage="Ingrese un Correo" ValidationGroup="2">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Correo" runat="server" ControlToValidate="txt_correo_p" ErrorMessage="Ingrese un correo valido" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ValidationGroup="2">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Telefono:</td>
                    <td><asp:TextBox ID="txt_telefono_p" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Telefono" runat="server" ControlToValidate="txt_telefono_p" ErrorMessage="Ingrese un Telefono" ValidationGroup="2">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Telefono" runat="server" ControlToValidate="txt_telefono_p" ErrorMessage="El Telefono solo permite numeros" ValidationExpression="^[0-9]+$" ValidationGroup="2">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>ACTIVO</td>
                    <td><asp:CheckBox ID="cb_activo_p" runat="server" Checked="True" Enabled="False" /></td>
                    <td></td>
                </tr>
               
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lbl_Mensaje" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="botones">
                        <asp:Button ID="btn_guardar" runat="server" Text="Guardar" CssClass="btn-guardar" OnClick="btn_guardar_Click" ValidationGroup="2" />
                        <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="btn-cancelar" OnClick="btn_cancelar_Click" CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </div>
                        <asp:ValidationSummary ID="VSAltaPacientes" runat="server" ValidationGroup="2" ShowMessageBox="True" ShowSummary="False" />
        <br />
        <br />
        <br />
        <div class="divlogos">
            <table style="width: 100%">
                <tr>
                    <td align="center"><img src="Imagenes/Logo.png" class="logo" /></td>
                    <td align="center"><img src="Imagenes/Logo1.png" class="logo1" /></td>
                    <td align="center"><img src="Imagenes/Logo2.png" class="logo2" /></td>
                    <td align="center"><img src="Imagenes/Logo3.png" class="logo3" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>