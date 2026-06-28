using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class UsuarioMedico : System.Web.UI.Page
    {
        NegocioClinica negocio = new NegocioClinica(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    txt_usuario.Text = Session["UsuarioMed"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
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

        protected void btn_aceptar_Click(object sender, EventArgs e)
        {
            int? idmedico = negocio.getIdMedico(Session["legajo"].ToString());
            if (idmedico != null)
            {
                if (negocio.AgregarUsuarios(Convert.ToInt32(idmedico), null, txt_usuario.Text.Trim(), txt_contrasena1.Text.Trim()))
                {
                    lbl_mensaje.Text = "Usuario creado correctamente";
                    lbl_mensaje0.Text = "Redirigiendo...";
                    Response.AddHeader("REFRESH", "3;URL=Menu.aspx");
                }
                else
                {
                    lbl_mensaje.Text = "Error al generar el usuario"; 
                }
            }
            else
            {
                lbl_mensaje0.Text = "Error ID no encontrado";
            }
        }
    }
}