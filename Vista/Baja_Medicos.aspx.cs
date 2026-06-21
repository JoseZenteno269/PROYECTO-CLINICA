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
        NegocioClinica negocio = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarBajaMedicos();
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

        public void CargarBajaMedicos()
        {
          gvMedicos.DataSource =  negocio.getBajaMedicos();
          gvMedicos.DataBind();  

        }
    }
}