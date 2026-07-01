using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Informes : System.Web.UI.Page
    {
        NegocioTurnos negocioTurnos = new NegocioTurnos();
        NegocioPacientes NegocioPacientes = new NegocioPacientes();
        NegocioEspecialidad NegocioEspecialidad = new NegocioEspecialidad();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarEspecialidades();
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

        protected void btn_aceptar1_Click(object sender, EventArgs e)
        {
            DateTime fechainicio = Convert.ToDateTime(txt_fecha_inicio1.Text);
            DateTime fechafin = Convert.ToDateTime(txt_fecha_fin1.Text);
            int idEspecialidad = Convert.ToInt32(ddl_especialidades.SelectedValue);

            if (fechainicio > fechafin)
            {
                lbl_turnosXespecialidad.Text = "La fecha de inicio no puede ser mayor a la fecha de fin.";
                return;
            }


        }
    }
}