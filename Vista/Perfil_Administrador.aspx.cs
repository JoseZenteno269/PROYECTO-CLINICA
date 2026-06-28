using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Perfil_Administrador : System.Web.UI.Page
    {
        NegocioMedicos negocio = new NegocioMedicos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    int idadmin = Convert.ToInt32(negocio.getIdAdministrador(Session["UsuarioAdmin"].ToString()));
                    sds_administrador.SelectCommand = "SELECT [Id_Administrador_Admin], [DNI_Admin], [Nombre_Admin], [CorreoElectronico_Admin], [Apellido_Admin], [Telefono_Admin], [Activo_Admin] FROM [Administradores] WHERE Id_Administrador_Admin = " + idadmin; 
                }
                else
                {
                    Response.Redirect("Inicio.aspx");
                }
            }
        }

        protected void lbl_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible; 
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
            Session["UsuarioAdmin"] = null;
        }

        protected void lb_menu_Click(object sender, EventArgs e)
        {
               Response.Redirect("Menu.aspx"); 
        }
    }
}