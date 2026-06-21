using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Baja_Pacientes : System.Web.UI.Page
    {
        NegocioClinica negocio = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarBajaPacientes();
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

        protected void btn_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx"); 
        }

        protected void btn_menu_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx"); 
        }

        public void CargarBajaPacientes()
        {
            gvPacientes.DataSource = negocio.getBajaPaciente();
            gvPacientes.DataBind();
        }
    }
}