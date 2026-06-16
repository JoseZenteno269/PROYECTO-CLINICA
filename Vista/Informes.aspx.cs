using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Informes : System.Web.UI.Page
    {
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

        protected void lb_panel_fecha_Click(object sender, EventArgs e)
        {
            p_fecha_inicio.Visible = !p_fecha_inicio.Visible;
        }

        protected void lb_panel_fecha_final_Click(object sender, EventArgs e)
        {
            p_fecha_fin.Visible = !p_fecha_fin.Visible;
        }
        protected void lb_fecha_inicio2_Click(object sender, EventArgs e)
        {
            p_fecha_inicio_2.Visible = !p_fecha_inicio_2.Visible;
        }

        protected void lb_fecha_inicio_2_Click(object sender, EventArgs e)
        {
            p_fecha_fin_2.Visible = !p_fecha_fin_2.Visible;
        }


    }
}