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
        NegocioClinica negocio = new NegocioClinica(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarDropDownListProv();
                CargarDropDownListLocal();
                CargarDropDownListEspe(); 
            }
        }

        public void CargarDropDownListProv()
        {
            ddl_provincia_m.DataSource = negocio.getDropDownListProvincias();
            ddl_provincia_m.DataTextField = "Descripcion_Prov";
            ddl_provincia_m.DataValueField = "Id_Provincia_Prov";
            ddl_provincia_m.DataBind();
            ddl_provincia_m.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0")); 
        }

        public void CargarDropDownListLocal()
        {
            DataTable tabla = negocio.getDropDownListLocalidades();
            tabla.DefaultView.RowFilter = "Id_Provincia_Local = " + ddl_provincia_m.SelectedValue;
            ddl_localidad_m.DataSource = tabla.DefaultView; 
            ddl_localidad_m.DataTextField = "Descripcion_Local";
            ddl_localidad_m.DataValueField = "Id_Provincia_Local";
            ddl_localidad_m.DataBind(); 
            ddl_localidad_m.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }

        protected void ddl_provincia_m_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDropDownListLocal(); 
        }

        public void CargarDropDownListEspe()
        {
            ddl_especalidad_m.DataSource = negocio.getDropDownListEspecialidad();
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
            Response.Redirect("Login.aspx");
        }

        protected void btn_horarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("Horarios_Medicos.aspx"); 
        }

        //protected void btn_menu_Click(object sender, EventArgs e)
        //{
            
        //}

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            DateTime fecha = Convert.ToDateTime(txt_fecha.Text);

            if (negocio.AgregarMedico(txt_legajo_m.Text, Convert.ToInt32(ddl_provincia_m.SelectedValue), Convert.ToInt32(ddl_localidad_m.SelectedValue), Convert.ToInt32(ddl_especalidad_m.SelectedValue), Convert.ToInt32(txt_dni_m.Text), txt_nombre_m.Text, txt_apellido_m.Text, ddl_sexo_m.Text, txt_nacionalidad.Text, fecha , txt_direccion_m.Text, txt_correo_m.Text, txt_telefono_m.Text))
            {
                lbl_mensaje.Text = "exitoso"; 
            }
            else
            {
                lbl_mensaje.Text = "error"; 
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
        }

    }
}