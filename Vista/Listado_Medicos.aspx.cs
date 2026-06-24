using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Listado_Medicos : System.Web.UI.Page
    {
        NegocioClinica negocioClinica = new NegocioClinica();
        Medicos medicos = new Medicos();
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lb_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible;
        }

        protected void btn_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            SqlDataSourceMedicos.SelectCommand = "SELECT Legajo_Med AS Legajo, Descripcion_Prov AS Provincia, Descripcion_Local AS Localidad, Nombre_Espe AS Especialidad, DNI_Med AS Dni, (Nombre_Med + ' ' + Apellido_Med) AS [Nombre y Apellido], Sexo_Med AS Sexo, Nacionalidad_Med AS Nacionalidad, FechaNacimiento_Med AS [Fecha de Nacimiento], Direccion_Med AS Direccion, CorreoElectronico_Med AS Email, Telefono_Med AS Telefono FROM Medicos INNER JOIN Provincias ON Medicos.Id_Provincia_Med = Provincias.Id_Provincia_Prov INNER JOIN Localidades ON Medicos.Id_Localidad_Med = Localidades.Id_Localidad_Local INNER JOIN Especialidad ON Medicos.Id_Especialidad_Med = Especialidad.Id_Especialidad_Espe WHERE CONVERT(VARCHAR(20), Legajo_Med) LIKE @Legajo";
            SqlDataSourceMedicos.SelectParameters.Clear();
            SqlDataSourceMedicos.SelectParameters.Add("Legajo", "%" + txt_buscar.Text + "%");
            lv_Medicos.DataBind();
        }
    }
}