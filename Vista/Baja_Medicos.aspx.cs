using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Baja_Medicos : System.Web.UI.Page
    {
        NegocioMedicos negocioMedicos = new NegocioMedicos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarActivosMedicos(); 
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void lb_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible; 
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx"); 
        }

        public void CargarActivosMedicos()
        {
          gvMedicos.DataSource =  negocioMedicos.getActivosMedicos();
          gvMedicos.DataBind();  
        }
        public void CargarInactivosMedicos()
        {
          gvMedicos.DataSource =  negocioMedicos.getInactivosMedicos();
          gvMedicos.DataBind();  
        }

        protected void btn_Aceptar_Click(object sender, EventArgs e)
        {
            if(negocioMedicos.DarBajaMedico(Convert.ToInt32(txt_IdMedico.Text)))
            {
                lbl_Mensaje.Text = "Dado de baja con Exito";
                CargarActivosMedicos(); 
                Limpiar();
            }
            else
            {
                lbl_Mensaje.Text = "No se pudo realizar la Baja";
                Limpiar();
            }
        }

        public void Limpiar()
        {
            txt_IdMedico.Text = string.Empty;
        }

        protected void btn_inactivos_Click(object sender, EventArgs e)
        {
            CargarInactivosMedicos(); 
        }

        protected void btn_activos_Click(object sender, EventArgs e)
        {
            CargarActivosMedicos(); 
        }

        protected void lb_perfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil_Administrador.aspx"); 
        }

        protected void lb_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx"); 
        }
    }
}