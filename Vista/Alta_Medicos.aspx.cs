using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class ABML_Medicos : System.Web.UI.Page
    {
        NegocioClinica negocio = new NegocioClinica(); 
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

        protected void btn_horarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("Horarios_Medicos.aspx"); 
        }

        //protected void btn_menu_Click(object sender, EventArgs e)
        //{
            
        //}

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            DateTime fecha = Convert.ToDateTime(txt_fecha.Text);

            if (negocio.AgregarMedico(txt_legajo_m.Text, Convert.ToInt32(ddl_provincia_m.SelectedValue), Convert.ToInt32(ddl_localidad_m.SelectedValue), Convert.ToInt32(ddl_especalidad_m.SelectedValue), Convert.ToInt32(txt_dni_m.Text), txt_nombre_m.Text, txt_apellido_m.Text, ddl_sexo_m.Text, txt_nacionalidad.Text, fecha , txt_direccion_m.Text, txt_correo_m.Text, txt_telefono_m.Text))
            {
                lbl_mensaje.Text = "exitoso"; 
            }
            else
            {
                lbl_mensaje.Text = "error"; 
            }
        }
    }
}