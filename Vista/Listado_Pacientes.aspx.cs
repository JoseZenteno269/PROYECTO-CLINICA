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
    public partial class Listado_Pacientes : System.Web.UI.Page
    {
       NegocioClinica negocioClinica = new NegocioClinica();
       Pacientes pacientes = new Pacientes();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lb_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible;
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btn_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

       

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            SqlDataSourcePacientes.SelectCommand = "SELECT DNI_Paci AS DNI,Descripcion_Prov AS Provincia,Descripcion_Local AS Localidad,(Nombre_Paci + ' ' + Apellido_Paci) AS[Nombre y Apellido],Sexo_Paci,Nacionalidad_Paci,FechaNacimiento_Paci,Direccion_Paci,CorreoElectronico_Paci,Telefono_Paci FROM Pacientes INNER JOIN Provincias ON Pacientes.Id_Provincia_Paci = Provincias.Id_Provincia_Prov INNER JOIN Localidades ON Pacientes.Id_Localidad_Paci = Localidades.Id_Localidad_Local WHERE CAST(DNI_Paci AS VARCHAR(20)) LIKE @DNI ";
            SqlDataSourcePacientes.SelectParameters.Clear();
            SqlDataSourcePacientes.SelectParameters.Add("DNI", "%" + txt_buscar.Text + "%");
            lv_pacientes.DataBind();

        }
    }
}