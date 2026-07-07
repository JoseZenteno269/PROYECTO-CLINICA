using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Sockets;
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
            if (!IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarDropDawnListEspecialidades();
                    CargarDropDawnListMedicos();
                    CargarGridViewPacientes();
                    ddl_horas.Items.Insert(0, new ListItem("--Seleccione un Horario", "0"));
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
        protected void ddl_medicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDiasDisponibles();
            c_calendario.DataBind(); 
        }

        public void CargarGridViewPacientes()
        {
            gvPacientesSeleccion.DataSource = NegocioPacientes.getPacientes();
            gvPacientesSeleccion.DataBind();
        }

        public void CargarGridViewPacientes(string dni)
        {
            String consulta = " AND DNI_Paci = '" + dni + "'"; 
            gvPacientesSeleccion.DataSource = NegocioPacientes.getPacientes(consulta);
            gvPacientesSeleccion.DataBind();
        }

        protected void c_calendario_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            CargarDiasDisponibles();
            c_calendario.DataBind();
        }

        protected void ddl_horas_SelectedIndexChanged(object sender, EventArgs e)
        {
            //CargarDiasDisponibles();
            //c_calendario.DataBind();
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
            int diasemanaentero = (numerodia == 0) ? 7 : numerodia;
            String nombredia = fecha.ToString("dddd");

            if (fecha <= DateTime.Now)
            {
                lbl_mensaje.Text = "Debe de seleccionar una fecha posterior a la actual ";
                ddl_horas.Items.Clear();
                ddl_horas.Items.Insert(0, new ListItem("--Seleccione un Horario", "0"));

            }
            else if (fecha > DateTime.Now)
            {
                CargarDiasDisponibles();
                CargarDropDownListDisponibilidad(diasemanaentero);
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

            if (Session["IdPaciente"] == null)
            {
                lbl_mensaje.Text = "Seleccione un paciente para asignar el turno";
                return;
            }

            if (NegocioTurnos.AgregarTurno(Convert.ToInt32(ddl_especialidad.SelectedValue), Convert.ToInt32(ddl_medicos.SelectedValue), fecha, TimeSpan.Parse(ddl_horas.SelectedItem.Text), Convert.ToInt32(Session["IdPaciente"]), 1))
            {
                lbl_mensaje.Text = "El turno a sido registrado correctamente <br /> Medico: " + ddl_medicos.SelectedItem.Text + " -- Especialidad: " + ddl_especialidad.SelectedItem.Text + " -- Fecha: " + fecha.ToString("dd-MM-yyyy") + " -- Hora: " + ddl_horas.SelectedItem.Text;
                LimpiarCampos(); 
            }
            else
            {
                lbl_mensaje.Text = "Error al registrar el turno, por favor intente nuevamente";
                LimpiarCampos(); 
                lbl_mensaje.Text = String.Empty;
            }
        }

        private List<int> diasdisponibles = new List<int>(); 

        public void CargarDiasDisponibles()
        {
            String diasString = NegocioDisponibilidadMedico.getDiasXMedico(Convert.ToInt32(ddl_medicos.SelectedValue));

            if(diasString == string.Empty)
            {
                lbl_mensaje.Text = "El medico seleccionado no tiene dias disponibles";
                return; 
            }

            int[] dias = diasString.Split(',').Select(int.Parse).ToArray();

            foreach (int i in dias)
            {
                diasdisponibles.Add(i);
            }
        }

        protected void c_calendario_DayRender(object sender, DayRenderEventArgs e)
        {
            int diaSemana = (int)e.Day.Date.DayOfWeek; 
            int diasSemanas = (diaSemana == 0) ? 7 : diaSemana;

            if (diasdisponibles.Contains(diasSemanas))
            {
                e.Cell.BackColor = System.Drawing.Color.Green;
            }
            if (!diasdisponibles.Contains(diasSemanas))
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            LimpiarCampos(); 
            lbl_mensaje.Text = String.Empty;
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(txt_buscar.Text.Trim()))
            {
                Session["DNI_Paciente"] = txt_buscar.Text.Trim();
                CargarGridViewPacientes(txt_buscar.Text.Trim());
            }
        }

        protected void btn_todos_Click(object sender, EventArgs e)
        {
            CargarGridViewPacientes(); 
        }

        protected void gvPacientesSeleccion_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPacientesSeleccion.PageIndex = e.NewPageIndex;
            if(Session["DNI_Paciente"] != null)
            {
                CargarGridViewPacientes(Session["DNI_Paciente"].ToString());
            }
            else
            {
                CargarGridViewPacientes();
            }
        }
    }
}