<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vista.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/Inicio.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            <div class="centrar div1">
                <table>
                    <tr>
                        <td>
                            <h1>Clinica Medica</h1>
                        </td>
                        <td class="izquierda">
                            <a href="https://www.facebook.com/UTNRegionalPacheco/?locale=es_LA">
                                <img src="iconos/facebook-icon.svg" class="icono" /></a>
                            <a href="https://www.instagram.com/utnpacheco/">
                                <img src="iconos/instagram-icon.svg" class="icono" /></a>
                            <a href="https://www.youtube.com/@utngeneralpachecocanal">
                                <img src="iconos/youtube.svg" class="icono" /></a>
                            <a href="https://x.com/utnfrgpprensa">
                                <img src="iconos/x.svg" class="icono" /></a>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <div class="centrar">
                <table style="width: 100%">
                    <tr>
                        <td align="center">
                            <asp:Button ID="btn_portal" runat="server" Text="Portal" CssClass="buttonp" OnClick="btn_portal_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <div class="divimagen">
                <img src="Imagenes/imagen1.png" class="imagen imagen1" />
                <img src="Imagenes/imagen2.png" class="imagen imagen2" />
                <img src="Imagenes/imagen3.png" class="imagen imagen3" />
                <img src="Imagenes/imagen4.png" class="imagen imagen4" />
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
                    <td><img src="Imagenes/Logo1.png" class="logo1" /></td>
                    <td><img src="Imagenes/Logo2.png" class="logo2" /></td>
                    <td><img src="Imagenes/Logo3.png" class="logo3" /></td>
                </tr>
            </table>
        </div>
        </div>
    </form>
</body>
</html>
