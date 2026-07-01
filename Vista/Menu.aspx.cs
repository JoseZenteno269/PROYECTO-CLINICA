using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class ABML : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
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
            Response.Redirect("Inicio.aspx");
            Session["UsuarioAdmin"] = null;
        }

        protected void btn_agregarm_Click(object sender, EventArgs e)
        {
            Response.Redirect("Alta_Medicos.aspx"); 
        }

        protected void btn_dar_bajam_Click(object sender, EventArgs e)
        {
            Response.Redirect("Baja_Medicos.aspx");
        }

        protected void btn_modificarm_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modificacion_Medicos.aspx");
        }

        protected void btn_listarm_Click(object sender, EventArgs e)
        {
            Response.Redirect("Listado_Medicos.aspx");
        }

        protected void btn_agregarp_Click(object sender, EventArgs e)
        {
            Response.Redirect("Alta_Pacientes.aspx");
        }

        protected void btn_dar_bajap_Click(object sender, EventArgs e)
        {
            Response.Redirect("Baja_Pacientes.aspx");
        }

        protected void btn_modificarp_Click(object sender, EventArgs e)
        {
            Response.Redirect("Modificacion_Pacientes.aspx");
        }

        protected void btn_listarp_Click(object sender, EventArgs e)
        {
            Response.Redirect("Listado_Pacientes.aspx");
        }

        protected void btn_agregart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Asignar_Turno.aspx");
        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cancelar_Turno.aspx");
        }

        protected void btn_informes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Informes.aspx");
        }

        protected void lb_perfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil_Administrador.aspx"); 
        }
    }
}

