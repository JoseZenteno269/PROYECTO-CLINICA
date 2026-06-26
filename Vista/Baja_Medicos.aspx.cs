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
        NegocioClinica negocio = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarBajaMedicos(); 
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

        protected void btn_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        public void CargarBajaMedicos()
        {
          gvMedicos.DataSource =  negocio.getBajaMedicos();
          gvMedicos.DataBind();  

        }

        //protected void btn_Listar_Click(object sender, EventArgs e)
        //{
        //    CargarBajaMedicos();
        //}

        protected void btn_Aceptar_Click(object sender, EventArgs e)
        {
            if(negocio.DarBajaMedico(Convert.ToInt32(txt_IdMedico.Text)))
            {
                lbl_Mensaje.Text = "Dado de baja con Exito";
                CargarBajaMedicos(); 
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
    }
}