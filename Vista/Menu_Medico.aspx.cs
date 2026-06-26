using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Vista
{
    public partial class MenuMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UsuarioMed"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioMed"].ToString();
                    CargarTurnos();
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
            Session["UsuarioMed"] = null; 
        }

        private void CargarTurnos()
        {
            var lista = new List<object>
            {
                new { Estado = "asignado", Fecha = "13/06/2026", Hora = "09:00", Paciente = "Alguien", Medico = "Dr. Alguien" },
                new { Estado = "cancelado", Fecha = "13/06/2026", Hora = "10:30", Paciente = "Alguien", Medico = "Dr. Alguien" },
                new { Estado = "asignado", Fecha = "14/06/2026", Hora = "08:00", Paciente = "Alguien", Medico = "Dr. Alguien" }
            };

            DLTurnos.DataSource = lista;
            DLTurnos.DataBind();
        }

        protected void lb_perfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil_Medico.aspx"); 
        }
    }
}