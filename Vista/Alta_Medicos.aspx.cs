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
    public partial class ABML_Medicos : System.Web.UI.Page
    {
        NegocioMedicos negocioMedicos = new NegocioMedicos();
        NegocioProvincias NegocioProvincias = new NegocioProvincias();
        NegocioLocalidades NegocioLocalidades = new NegocioLocalidades();
        NegocioEspecialidad NegocioEspecialidad = new NegocioEspecialidad();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarDropDownListProv();
                    CargarDropDownListLocal();
                    CargarDropDownListEspe();
                    int anio = DateTime.Now.Year;
                    txt_legajo_m.Text = "MED-" + anio + "-" + (negocioMedicos.getCantidadMedicos() + 1);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        public void CargarDropDownListProv()
        {
            ddl_provincia_m.DataSource = NegocioProvincias.getDropDownListProvincias();
            ddl_provincia_m.DataTextField = "Descripcion_Prov";
            ddl_provincia_m.DataValueField = "Id_Provincia_Prov";
            ddl_provincia_m.DataBind();
            ddl_provincia_m.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }

        public void CargarDropDownListLocal()
        {
            DataTable tabla = NegocioLocalidades.getDropDownListLocalidades();
            tabla.DefaultView.RowFilter = "Id_Provincia_Local = " + ddl_provincia_m.SelectedValue;
            ddl_localidad_m.DataSource = tabla.DefaultView;
            ddl_localidad_m.DataTextField = "Descripcion_Local";
            ddl_localidad_m.DataValueField = "Id_Localidad_Local";
            ddl_localidad_m.DataBind();
            ddl_localidad_m.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }

        protected void ddl_provincia_m_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDropDownListLocal();
        }

        public void CargarDropDownListEspe()
        {
            ddl_especalidad_m.DataSource = NegocioEspecialidad.getDropDownListEspecialidad();
            ddl_especalidad_m.DataTextField = "Nombre_Espe";
            ddl_especalidad_m.DataValueField = "Id_Especialidad_Espe";
            ddl_especalidad_m.DataBind();
            ddl_especalidad_m.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }

        protected void lb_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible;
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
            Session["UsuarioAdmin"] = null;
        }

        protected void btn_horarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("Horarios_Medicos.aspx");
        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
        }

        public string generarusuario(string nombre, string apellido, string fecha)
        {
            return nombre[0].ToString().ToUpper() + apellido.Substring(0, apellido.Length - 2).ToUpper() + fecha.Substring(8);
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            DateTime fecha = Convert.ToDateTime(txt_fecha.Text);

            string usuario = generarusuario(txt_nombre_m.Text, txt_apellido_m.Text, txt_fecha.Text);

            if (negocioMedicos.AgregarMedico(txt_legajo_m.Text.Trim(), Convert.ToInt32(ddl_provincia_m.SelectedValue), Convert.ToInt32(ddl_localidad_m.SelectedValue), Convert.ToInt32(ddl_especalidad_m.SelectedValue), Convert.ToInt32(txt_dni_m.Text), txt_nombre_m.Text, txt_apellido_m.Text, ddl_sexo_m.Text, txt_nacionalidad.Text, fecha, txt_direccion_m.Text, txt_correo_m.Text, txt_telefono_m.Text))
            {
                lbl_mensaje.Text = "Medico cargado correctamente";
                lbl_mensaje0.Text = "Redirigiendo...";
                Response.AddHeader("REFRESH", "3;URL=Usuario_Medico.aspx");
                Session["Legajo"] = txt_legajo_m.Text.Trim();
                Session["UsuarioMed"] = usuario.ToString();
            }
            else
            {
                lbl_mensaje.Text = "Error al ingresar nuevo Medico";
                LimpiarCampos();
            }
        }

        protected void btn_Volver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        private void LimpiarCampos()
        {
            txt_legajo_m.Text = string.Empty;
            ddl_provincia_m.SelectedIndex = 0;
            ddl_localidad_m.SelectedIndex = 0;
            ddl_especalidad_m.SelectedIndex = 0;
            txt_dni_m.Text = string.Empty;
            txt_nombre_m.Text = string.Empty;
            txt_apellido_m.Text = string.Empty;
            ddl_sexo_m.SelectedIndex = 0;
            txt_nacionalidad.Text = string.Empty;
            txt_fecha.Text = string.Empty;
            txt_direccion_m.Text = string.Empty;
            txt_correo_m.Text = string.Empty;
            txt_telefono_m.Text = string.Empty;
            lbl_mensaje.Text = string.Empty;
            lbl_mensaje0.Text = string.Empty;
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