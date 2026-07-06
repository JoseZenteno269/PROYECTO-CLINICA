using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Cancelar_Turno : System.Web.UI.Page
    {
        NegocioTurnos negocioTurnos = new NegocioTurnos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarGridViewTurno();
                }
                else
                {
                    Response.Redirect("Inicio.aspx");
                }
            }
        }

        protected void lb_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        public void CargarGridViewTurno()
        {
            gvTurnos.DataSource = negocioTurnos.getTurnosCancelar();
            gvTurnos.DataBind();
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            if(negocioTurnos.CancelarTurnos(Convert.ToInt32(txt_id.Text)))
            {
                lbl_Mensaje.Text = "Turno cancelado con exito";
                CargarGridViewTurno();
                txt_id.Text = string.Empty;
            }
            else
            {
                lbl_Mensaje.Text = "Error al cancelar el turno";
            }
        }

        protected void lb_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible; 
        }

        protected void lb_perfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil_Administrador.aspx"); 
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }

        protected void gvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTurnos.PageIndex = e.NewPageIndex;
            CargarGridViewTurno(); 
        }
    }
}