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
        NegocioTurnos NegocioTurnos = new NegocioTurnos();
        NegocioMedicos negocioMedicos = new NegocioMedicos();
        NegocioPacientes NegocioPacientes = new NegocioPacientes();
        NegocioEspecialidad NegocioEspecialidad = new NegocioEspecialidad();
        NegocioDisponibilidadMedico NegocioDisponibilidadMedico = new NegocioDisponibilidadMedico(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarDropDawnListEspecialidades();
                    CargarDropDawnListMedicos();
                    CargarGridviewPacientes();
                }
                else
                {
                    Response.Redirect("Inicio.aspx");
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

        }

        public void CargarDropDawnListEspecialidades()
        {
            ddl_especialidad.DataSource = NegocioEspecialidad.getDropDownListEspecialidad();
            ddl_especialidad.DataTextField = "Nombre_Espe";
            ddl_especialidad.DataValueField = "Id_Especialidad_Espe";
            ddl_especialidad.DataBind();
            ddl_especialidad.Items.Insert(0, new ListItem("--Seleccione una especialidad--", "0"));
        }

        public void CargarDropDawnListMedicos()
        {
            DataTable tabla = negocioMedicos.getMedicos();
            tabla.DefaultView.RowFilter = "Id_Especialidad_Med = " + ddl_especialidad.SelectedValue;
            ddl_medicos.DataSource = tabla.DefaultView;
            ddl_medicos.DataTextField = "Nombre_Med";
            ddl_medicos.DataValueField = "Id_Medico_Med";
            ddl_medicos.DataBind();
            ddl_medicos.Items.Insert(0, new ListItem("--Seleccione un medico","0"));
        }


        public void CargarDropDownListDisponibilidad(int dia)
        {
            DataTable tabla = NegocioDisponibilidadMedico.getDropDownListDisponibilidadHoraria(dia);
            tabla.DefaultView.RowFilter = "Id_Medico_DispMed = " + ddl_medicos.SelectedValue;
            ddl_horas.DataSource = tabla.DefaultView;
            ddl_horas.DataTextField = "Horario_DispMed";
            ddl_horas.DataValueField = "Id_COD_DispMed";
            ddl_horas.DataBind();
            ddl_horas.Items.Insert(0, new ListItem("--Seleccione un Horario", "0"));

        }

        protected void ddl_especialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDropDawnListMedicos();
        }
        //protected void ddl_medicos_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //int dia = (int)sender; 
        //    //CargarDropDownListDisponibilidad(dia);
        //}

        public void CargarGridviewPacientes()
        {
            gvPacientesSeleccion.DataSource = NegocioPacientes.getPacientes();
            gvPacientesSeleccion.DataBind();
        }

        public void LimpiarCampos()
        {
            ddl_especialidad.SelectedIndex = 0;
            ddl_medicos.SelectedIndex = 0;
            ddl_horas.SelectedIndex = 0;
            c_calendario.SelectedDate = DateTime.Now;

        }

        protected void lb_perfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil_Administrador.aspx"); 
        }

        protected void lb_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx"); 
        }

        protected void c_calendario_SelectionChanged(object sender, EventArgs e)
        {
            DateTime fecha = c_calendario.SelectedDate;
            DayOfWeek diasemana = fecha.DayOfWeek;
            int numerodia = (int)fecha.DayOfWeek; 
            String nombredia = fecha.ToString("dddd");
            if(fecha < DateTime.Now)
            {
                lbl_mensaje.Text = "La fecha seleccionada es invalida";
                return;
            }
            else
            {
                CargarDropDownListDisponibilidad(numerodia);
            }
             
        }

        protected void gvPacientesSeleccion_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            String idpaciente = ((Label)gvPacientesSeleccion.Rows[e.NewSelectedIndex].FindControl("lbl_it_idpaciente")).Text; 
            String dni = ((Label)gvPacientesSeleccion.Rows[e.NewSelectedIndex].FindControl("lbl_it_DNI")).Text;
            String nombre_apellido = ((Label)gvPacientesSeleccion.Rows[e.NewSelectedIndex].FindControl("lbl_it_NombreApellido")).Text;

            Session["IdPaciente"] = idpaciente; 
        }

        protected void btn_confirmar_Click(object sender, EventArgs e)
        {
            DateTime fecha = c_calendario.SelectedDate; 

            if (NegocioTurnos.AgregarTurno(Convert.ToInt32(ddl_especialidad.SelectedValue), Convert.ToInt32(ddl_medicos.SelectedValue), fecha, TimeSpan.Parse(ddl_horas.SelectedItem.Text), Convert.ToInt32(Session["IdPaciente"]), 1))
            {
                lbl_mensaje.Text = "datos" + fecha.ToString("dd-MM-yyyy") + "-" + ddl_especialidad.Text + "-" + ddl_medicos.Text; 
            }
        }
    }
}