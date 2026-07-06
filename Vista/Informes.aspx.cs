using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Informes : System.Web.UI.Page
    {
        NegocioTurnos negocioTurnos = new NegocioTurnos();
        NegocioPacientes negocioPacientes = new NegocioPacientes();
        NegocioMedicos negocioMedicos = new NegocioMedicos();
        NegocioEspecialidad NegocioEspecialidad = new NegocioEspecialidad();
        NegocioProvincias negocioProvincias = new NegocioProvincias();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarEspecialidades();
                    CargarGridViewPacientes();
                    CargarDropDownListProvincias();
                    CargarDropDownListMedicos();
                    CargarGridViewEdad();
                    CargarDropDownListAños();
                    CargarDropDownListMeses();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        public void CargarDropDownListMeses()
        {
            String[] meses = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
            ddl_mes_4.Items.Add(new ListItem("-- Meses --", "0"));
            for (int i = 0; i < meses.Length; i++)
            {
                ddl_mes_4.Items.Add(new ListItem(meses[i].ToString(), (i + 1).ToString()));
            }
        }

        public void CargarDropDownListAños()
        {
            int anio = DateTime.Now.Year;
            ddl_anio_4.Items.Add(new ListItem("-- Años --", "0")); 
            for(int i = anio; i >= 1900; i--)
            {
                ddl_anio_4.Items.Add(new ListItem(i.ToString(), i.ToString()));
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

        protected void btn_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        public void CargarEspecialidades()
        {
            ddl_especialidades.DataSource = NegocioEspecialidad.getDropDownListEspecialidad();
            ddl_especialidades.DataTextField = "Nombre_Espe";
            ddl_especialidades.DataValueField = "Id_Especialidad_Espe";
            ddl_especialidades.DataBind();
            ddl_especialidades.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }

        //Informe 1
        protected void btn_aceptar_Click(object sender, EventArgs e)
        {
            DateTime fechainiico = Convert.ToDateTime(txt_fecha_inicio.Text);
            DateTime fechafin = Convert.ToDateTime(txt_fecha_fin.Text);

            if (fechainiico > fechafin)
            {
                lbl_turnos.Text = "La fecha de inicio no puede ser mayor a la fecha de fin.";
                lbl_porcentajes.Text = "";
                return;
            }

            int cantidadTurnos = Convert.ToInt32(negocioTurnos.CantidadTurnos(fechainiico.ToString("yyyy-MM-dd"), fechafin.ToString("yyyy-MM-dd")));
            float porcentajePresentes = Convert.ToSingle(negocioTurnos.ConsultaPorcentajePresentes(fechainiico.ToString("yyyy-MM-dd"), fechafin.ToString("yyyy-MM-dd")));
            float porcentajeAusentes = 100 - porcentajePresentes;

            lbl_turnos.Text = "Cantidad de Turnos: " + cantidadTurnos.ToString();
            lbl_porcentajes.Text = "Presentes: " + porcentajePresentes.ToString("F2") + "%" + "<br />" + "Ausentes: " + porcentajeAusentes.ToString("F2") + "%";
        }

        //Informe 2
        protected void btn_aceptar1_Click(object sender, EventArgs e)
        {
            DateTime fechainicio = Convert.ToDateTime(txt_fecha_inicio1.Text);
            DateTime fechafin = Convert.ToDateTime(txt_fecha_fin1.Text);
            String Especialidad = ddl_especialidades.SelectedItem.Text;

            if (fechainicio > fechafin)
            {

                return;
            }

            if(ddl_especialidades.SelectedValue == "0")
            {
                Session["Fechainicio"] = fechainicio.ToString("yyyy-MM-dd");
                Session["Fechafin"] = fechafin.ToString("yyyy-MM-dd");
                Session["Tipo"] = "GridView1";
                CargarGridViewTurnosXEspecialiadades(fechainicio.ToString("yyyy-MM-dd"), fechafin.ToString("yyyy-MM-dd")); 
            }
            else
            {
                Session["Fechainicio"] = fechainicio.ToString("yyyy-MM-dd");
                Session["Fechafin"] = fechafin.ToString("yyyy-MM-dd");
                Session["Especialidad"] = Especialidad;
                Session["Tipo"] = "GridView2";
                CargarGridViewTurnosXEspecialiadades(fechainicio.ToString("yyyy-MM-dd"), fechafin.ToString("yyyy-MM-dd"), Especialidad); 
            }

            lbl_especialidadmayor.Text = negocioTurnos.ConsutaMaxEspecialidad().ToString(); 
        }
        public void CargarGridViewTurnosXEspecialiadades(String fechainicio, String fechafin, String Especialidad)
        {
            gv_TurnosXEspecialidad.DataSource = negocioTurnos.ConsultaTurnosXEspecialidad(fechainicio, fechafin, Especialidad);
            gv_TurnosXEspecialidad.DataBind(); 
        }

        public void CargarGridViewTurnosXEspecialiadades(String fechainicio, String fechafin)
        {
            gv_TurnosXEspecialidad.DataSource = negocioTurnos.ConsultaTurnosXEspecialidad(fechainicio, fechafin);
            gv_TurnosXEspecialidad.DataBind();
        }
        protected void gv_TurnosXEspecialidad_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_TurnosXEspecialidad.PageIndex = e.NewPageIndex;
            if (Session["Tipo"] != null && Session["Tipo"].ToString() == "GridView1")
            {
                CargarGridViewTurnosXEspecialiadades(Session["Fechainicio"].ToString(), Session["Fechafin"].ToString());
            }
            else if (Session["Tipo"] != null && Session["Tipo"].ToString() == "GridView2")
            {
                CargarGridViewTurnosXEspecialiadades(Session["Fechainicio"].ToString(), Session["Fechafin"].ToString(), Session["Especialidad"].ToString());
            }
        }

        /// INFORME 3

        public void CargarGridViewInforme3()
        {
            string medico = ddl_Informe3.SelectedValue;
            string mes = !string.IsNullOrEmpty(txt_MesInfo3.Text)? txt_MesInfo3.Text.Split('-')[1].TrimStart('0') : "";

            if (medico == "0" && string.IsNullOrEmpty(mes))
            {
                gv_Informe3.DataSource = null;
                gv_Informe3.DataBind();
                return;
            }

            gv_Informe3.DataSource = negocioTurnos.ConsultaInforme3(medico, mes);
            gv_Informe3.DataBind();
        }

        public void CargarDropDownListMedicos()
        {
            ddl_Informe3.DataSource = negocioMedicos.getTablaMedicosInforme3();
            ddl_Informe3.DataTextField = "NombreAPellido";
            ddl_Informe3.DataValueField = "Id_Medico_Med";
            ddl_Informe3.DataBind();
            ddl_Informe3.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }
        protected void txt_MesInfo3_TextChanged(object sender, EventArgs e)
        {
            CargarGridViewInforme3();
        }
        protected void ddl_Informe3_SelectedIndexChanged1(object sender, EventArgs e)
        {
            CargarGridViewInforme3();
        }
        protected void gv_Informe3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_Informe3.PageIndex = e.NewPageIndex;
            CargarGridViewInforme3(); 
        }

        //INFORME 4 
        protected void btn_aceptar2_Click(object sender, EventArgs e)
        {
            int mes = Convert.ToInt32(ddl_mes_4.SelectedValue);
            int anio = Convert.ToInt32(ddl_anio_4.SelectedValue);
            int[] dias_semana = new int[7];

            for (int i = 1; i <= 7; i++)
            {
                int dias = negocioTurnos.ConsultaInforme4(mes, anio, i);
                dias_semana[i - 1] = dias;
            }

            barra1.Style["width"] = (dias_semana[0] * 10) + "px";
            barra2.Style["width"] = (dias_semana[1] * 10) + "px";
            barra3.Style["width"] = (dias_semana[2] * 10) + "px";
            barra4.Style["width"] = (dias_semana[3] * 10) + "px";
            barra5.Style["width"] = (dias_semana[4] * 10) + "px";
            barra6.Style["width"] = (dias_semana[5] * 10) + "px";
            barra7.Style["width"] = (dias_semana[6] * 10) + "px";


            barra1.Text = dias_semana[0].ToString();
            barra2.Text = dias_semana[1].ToString();
            barra3.Text = dias_semana[2].ToString();
            barra4.Text = dias_semana[3].ToString();
            barra5.Text = dias_semana[4].ToString();
            barra6.Text = dias_semana[5].ToString();
            barra7.Text = dias_semana[6].ToString();

            lbl_informe4.Text = "Cantidad de turnos por día de la semana para el mes " + ddl_mes_4.SelectedItem.Text + " del año " + ddl_anio_4.SelectedItem.Text;
        }

        /// Informe 5

        public void CargarGridViewPacientes()
        {
            gv_PacientesInforme5.DataSource = negocioPacientes.getPacientes();
            gv_PacientesInforme5.DataBind();
        }

        public void CargarGridViewPacientes(int provincia)
        {
            gv_PacientesInforme5.DataSource = negocioProvincias.FiltradoProvincias(provincia);
            gv_PacientesInforme5.DataBind();
        }

        public void CargarGridViewPacientesPorEdad()
        {
            gvEdad.DataSource = negocioPacientes.getPacientes();
            gvEdad.DataBind();
        }

        public void CargarGridViewEdad()
        {
            gvEdad.DataSource = negocioPacientes.getPacientes();
            gvEdad.DataBind();
        }
        public void CargarGridViewEdad(int min, int max)
        {
            gvEdad.DataSource = negocioPacientes.getPacientesEdad(min, max);
            gvEdad.DataBind();
        }

        public void CargarDropDownListProvincias()
        {
            ddl_ProvinciaInforme5.DataSource = negocioProvincias.getDropDownListProvincias();
            ddl_ProvinciaInforme5.DataTextField = "Descripcion_Prov";
            ddl_ProvinciaInforme5.DataValueField = "Id_Provincia_Prov";
            ddl_ProvinciaInforme5.DataBind();
            ddl_ProvinciaInforme5.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }

        protected void ddl_ProvinciaInforme5_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_ProvinciaInforme5.SelectedValue == "0")
            {
                Session["Provincia"] = "Sinfiltro";
                CargarGridViewPacientes(); 
            }
            else
            {
                Session["Provincia"] = "Confiltro";
                int provincia = Convert.ToInt32(ddl_ProvinciaInforme5.SelectedValue);
                Session["ProvinciaSeleccionada"] = provincia;
                CargarGridViewPacientes(provincia);
            }

        }


        protected void ddl_RangosEdad_SelectedIndexChanged(object sender, EventArgs e)
        {
            int min = 0;
            int max = 0;

            string Seleccion = ddl_RangosEdad.SelectedValue;

            switch (Seleccion)
            {
                case "1": min = 0; max = 18; break;
                case "2": min = 18; max = 30; break;
                case "3": min = 30; max = 60; break;
                case "4": min = 60; max = 99; break;
                case "0": gvEdad.DataSource = negocioPacientes.getPacientes(); gvEdad.DataBind(); return;
            }
            Session["EdadMin"] = min;
            Session["EdadMax"] = max;

            CargarGridViewEdad(min, max);
        }
        protected void gv_PacientesInforme5_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_PacientesInforme5.PageIndex = e.NewPageIndex;
            if(Session["Provincia"] != null && Session["Provincia"].ToString() == "Confiltro")
            {
                int provincia = Convert.ToInt32(Session["ProvinciaSeleccionada"]);
                CargarGridViewPacientes(provincia);
            }
            else
            {
                CargarGridViewPacientes();
            }
        }
        protected void gvEdad_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEdad.PageIndex = e.NewPageIndex;
            if(Session["EdadMin"] != null && Session["EdadMax"] != null)
            {
                int min = Convert.ToInt32(Session["EdadMin"]);
                int max = Convert.ToInt32(Session["EdadMax"]);
                CargarGridViewEdad(min, max);
            }
            else
            {
                CargarGridViewEdad();
            }
         
        }

        protected void lb_perfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil_Administrador.aspx");
        }

        protected void lb_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

    }
}