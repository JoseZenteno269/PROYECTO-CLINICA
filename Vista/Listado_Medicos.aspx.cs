using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Listado_Medicos : System.Web.UI.Page
    {
        NegocioClinica negocioClinica = new NegocioClinica();
        Medicos medicos = new Medicos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMedicos();
            }
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lb_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible;
        }

        protected void btn_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        public void CargarMedicos()
        {
            gvMedicos.DataSource = negocioClinica.getMedicos();
            gvMedicos.DataBind();
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            string legajo = txt_buscar.Text;
            medicos.setLegajoMedico(legajo);
            dataTable = negocioClinica.getMedicosFiltrados(medicos);
            gvMedicos.DataSource = dataTable;
            gvMedicos.DataBind();
            txt_buscar.Text = string.Empty;
        }

        protected void btn_Todos_Click(object sender, EventArgs e)
        {
            CargarMedicos();
        }
    }
}