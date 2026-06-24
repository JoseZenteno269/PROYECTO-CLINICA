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
    public partial class Asignar_Turno : System.Web.UI.Page
    {
        NegocioClinica negocio = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarDropDawnListEspecialidades();
                CargarDropDawnListMedicos();
                CargarGridviewPacientes();
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

        public void CargarDropDawnListEspecialidades()
        {
            ddl_especialidad.DataSource = negocio.getDropDownListEspecialidad();
            ddl_especialidad.DataTextField = "Nombre_Espe";
            ddl_especialidad.DataValueField = "Id_Especialidad_Espe";
            ddl_especialidad.DataBind();
            ddl_especialidad.Items.Insert(0, new ListItem("--Seleccione una especialidad--", "0"));
        }

        public void CargarDropDawnListMedicos()
        {
            DataTable tabla = negocio.getMedicos();
            tabla.DefaultView.RowFilter = "Id_Especialidad_Med = " + ddl_especialidad.SelectedValue;
            ddl_medicos.DataSource = tabla.DefaultView;
            ddl_medicos.DataTextField = "Nombre_Med";
            ddl_medicos.DataValueField = "Id_Medico_Med";
            ddl_medicos.DataBind();
            ddl_medicos.Items.Insert(0, new ListItem("--Seleccione un medico","0"));
        }


        public void CargarDropDownListDisponibilidad()
        {
            DataTable tabla = negocio.getDropDownListDisponibilidadHoraria();
            tabla.DefaultView.RowFilter = "Id_Medico_DispMed = " + ddl_medicos.SelectedValue;
            ddl_horas.DataSource = tabla.DefaultView;
            ddl_horas.DataTextField = "DiayHorario";
            ddl_horas.DataValueField = "Id_COD_DispMed";
            ddl_horas.DataBind();
            ddl_horas.Items.Insert(0, new ListItem("--Seleccione un Horario", "0"));

        }

        protected void ddl_especialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDropDawnListMedicos();
        }
        protected void ddl_medicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDropDownListDisponibilidad();
        }

        public void CargarGridviewPacientes()
        {
            gvPacientesSeleccion.DataSource = negocio.getPacientes();
            gvPacientesSeleccion.DataBind();
        }

        protected void btn_confirmar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
        }

        public void LimpiarCampos()
        {
            ddl_especialidad.SelectedIndex = 0;
            ddl_medicos.SelectedIndex = 0;
            ddl_horas.SelectedIndex = 0;
            c_dias.SelectedDate = DateTime.Now;

        }

    }
}