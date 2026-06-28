using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Perfil_Medico : System.Web.UI.Page
    {
        NegocioMedicos negocio = new NegocioMedicos(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioMed"] != null)
            {
                lbl_usuario.Text = Session["UsuarioMed"].ToString();
                int? idmedico = negocio.getIdMedico(negocio.getLegajoMedico(Session["UsuarioMed"].ToString()));
                sds_medicos.SelectCommand = "SELECT Id_Medico_Med, Legajo_Med, Id_Provincia_Med, Descripcion_Prov, Id_Localidad_Med, Descripcion_Local, Id_Especialidad_Med, Nombre_Espe, DNI_Med, Nombre_Med, Apellido_Med, Sexo_Med, Nacionalidad_Med, FechaNacimiento_Med, Direccion_Med, CorreoElectronico_Med, Telefono_Med FROM Medicos\r\nINNER JOIN Provincias ON Id_Provincia_Med = Id_Provincia_Prov\r\nINNER JOIN Localidades ON Id_Localidad_Med = Id_Localidad_Local\r\nINNER JOIN Especialidad ON Id_Especialidad_Med = Id_Especialidad_Espe WHERE Activo_Med = 1 AND Id_Medico_Med = " + idmedico; 
            }
            else
            {
                Response.Redirect("Inicio.aspx");
            }
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
            Session["UsuarioMed"] = null;
        }

        protected void lbl_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible; 
        }

        protected void lb_perfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu_Medico.aspx"); 
        }
    }
}