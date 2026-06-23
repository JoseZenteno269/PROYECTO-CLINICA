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
    public partial class Listado_Pacientes : System.Web.UI.Page
    {
       NegocioClinica negocioClinica = new NegocioClinica();
       Pacientes pacientes = new Pacientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarPacientes();
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

        private void CargarPacientes()
        {
            gvPacientes.DataSource = negocioClinica.getPacientes();
            gvPacientes.DataBind();
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            int Dni = Convert.ToInt32(txt_buscar.Text);
            pacientes.setDniPaciente(Dni);
            dataTable = negocioClinica.getPacientesFiltrados(pacientes);
            gvPacientes.DataSource = dataTable;
            gvPacientes.DataBind();
            txt_buscar.Text = string.Empty;
        }

        protected void btn_Mostrar_Click(object sender, EventArgs e)
        {
            CargarPacientes();
        }
    }
}