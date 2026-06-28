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
        NegocioPacientes negocio = new NegocioPacientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarActivosPacientes();
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

        protected void btn_menu_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx"); 
        }

        public void CargarActivosPacientes()
        {
            gvPacientes.DataSource = negocio.getActivosPaciente();
            gvPacientes.DataBind();
        }
        public void CargarInactivosPacientes()
        {
            gvPacientes.DataSource = negocio.getInactivosPaciente();
            gvPacientes.DataBind();
        }

        protected void btn_Aceptar_Click(object sender, EventArgs e)
        {
            if(negocio.DarBajaPacientes(Convert.ToInt32(txt_IDPacientes.Text)))
            {
                lbl_Mensaje.Text = "Operacion exitosa";
                CargarActivosPacientes(); 
                Limpiar();
            }
            else
            {
                lbl_Mensaje.Text = "No se pudo realizar la operacion";
                Limpiar();
            }
        }
        public void Limpiar()
        {
            txt_IDPacientes.Text = string.Empty;
        }

        protected void btn_activos_Click(object sender, EventArgs e)
        {
            CargarActivosPacientes(); 
        }

        protected void btn_inactivos_Click(object sender, EventArgs e)
        {
            CargarInactivosPacientes(); 
        }
    }
}