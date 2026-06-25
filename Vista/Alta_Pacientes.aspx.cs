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
    public partial class ABML_Pacientes : System.Web.UI.Page
    {
        NegocioClinica negocio = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarDropDownListProv();
                CargarDropDownListLocal();
            }
        }

        /// Metodos DropDawnList
        public void CargarDropDownListProv()
        {
            ddl_provincia_p.DataSource = negocio.getDropDownListProvincias();
            ddl_provincia_p.DataTextField = "Descripcion_Prov";
            ddl_provincia_p.DataValueField = "Id_Provincia_Prov";
            ddl_provincia_p.DataBind();
            ddl_provincia_p.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }

        public void CargarDropDownListLocal()
        {
            DataTable tabla = negocio.getDropDownListLocalidades();
            tabla.DefaultView.RowFilter = "Id_Provincia_Local = " + ddl_provincia_p.SelectedValue;
            ddl_localdiad_p.DataSource = tabla.DefaultView;
            ddl_localdiad_p.DataTextField = "Descripcion_Local";
            ddl_localdiad_p.DataValueField = "Id_Localidad_Local";
            ddl_localdiad_p.DataBind();
            ddl_localdiad_p.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }

        /// Metodos Label Usuario
        protected void ddl_provincia_p_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDropDownListLocal();
        }
        protected void lb_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible;
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }

        /// Metodos Botones 
        protected void btn_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
        }
        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            DateTime Fecha = Convert.ToDateTime(txt_fecha.Text);
            if(negocio.AgregarPacientes(Convert.ToInt32(txt_dni_p.Text),txt_nombre_p.Text,txt_apellido_p.Text,ddl_sexo_p.Text, txtNacionalidad.Text,Fecha,txt_direccion_p.Text,Convert.ToInt32(ddl_provincia_p.SelectedValue),Convert.ToInt32(ddl_localdiad_p.SelectedValue),txt_correo_p.Text,txt_telefono_p.Text))
            {
                lbl_Mensaje.Text = "Paciente Cargado Correctamente";
                LimpiarCampos();
            }
            else
            {
                lbl_Mensaje.Text = "Error al ingresar nuevo Paciente";
                LimpiarCampos();
            }
        }

         private void LimpiarCampos()
         {
            txt_dni_p.Text = string.Empty;
            txt_nombre_p.Text = string.Empty;
            txt_apellido_p.Text = string.Empty;
            txt_direccion_p.Text = string.Empty;
            txt_correo_p.Text = string.Empty;
            txt_telefono_p.Text = string.Empty;
            txt_fecha.Text = string.Empty;
            txtNacionalidad.Text = string.Empty;
            ddl_sexo_p.SelectedIndex = 0;
            ddl_provincia_p.SelectedIndex = 0;
            ddl_localdiad_p.SelectedIndex = 0;
         }

    }
}