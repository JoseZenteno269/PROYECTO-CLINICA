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
    public partial class Modificacion_Pacientes : System.Web.UI.Page
    {
        NegocioClinica negocio = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarGridViewPacientes(); 
            }
        }

        public void CargarGridViewPacientes()
        {
            gv_pacientes.DataSource = negocio.getPacientes();
            gv_pacientes.DataBind(); 
        }
        public void CargarGridViewPacientes(String consulta)
        {
            gv_pacientes.DataSource = negocio.getPacientes(consulta);
            gv_pacientes.DataBind(); 
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

        public void CargarDropDownListProv(DropDownList ddlprov)
        {
            ddlprov.DataSource = negocio.getDropDownListProvincias();
            ddlprov.DataTextField = "Descripcion_Prov";
            ddlprov.DataValueField = "Id_Provincia_Prov";
            ddlprov.DataBind();
            ddlprov.Items.Insert(0, new ListItem("-- Opcion --", "0"));
        }

        public void CargarDropDownListLocal(DropDownList ddlloca, DropDownList ddlprov)
        {
            DataTable tabla = negocio.getDropDownListLocalidades();
            tabla.DefaultView.RowFilter = "Id_Provincia_Local = " + ddlprov.SelectedValue;
            ddlloca.DataSource = tabla.DefaultView;
            ddlloca.DataTextField = "Descripcion_Local";
            ddlloca.DataValueField = "Id_Localidad_Local";
            ddlloca.DataBind();
            ddlloca.Items.Insert(0, new ListItem("-- Opcion --", "0"));
        }

        protected void gv_pacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_pacientes.EditIndex = e.NewEditIndex;
            CargarGridViewPacientes();
            
            DropDownList ddlprovincias = (DropDownList)gv_pacientes.Rows[e.NewEditIndex].FindControl("ddl_provincias"); 
            DropDownList ddllocalidades = (DropDownList)gv_pacientes.Rows[e.NewEditIndex].FindControl("ddl_localidades");

            int idprovincia = Convert.ToInt32(gv_pacientes.DataKeys[e.NewEditIndex]["Id_Provincia_Paci"]); 
            int idlocalidad = Convert.ToInt32(gv_pacientes.DataKeys[e.NewEditIndex]["Id_Localidad_Paci"]); 

            CargarDropDownListProv(ddlprovincias);
            ddlprovincias.SelectedValue = idprovincia.ToString();
            CargarDropDownListLocal(ddllocalidades, ddlprovincias);
            ddllocalidades.SelectedValue = idlocalidad.ToString();
        }

        protected void gv_pacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_pacientes.EditIndex = -1;
            CargarGridViewPacientes(); 
        }

        protected void gv_pacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idpaciente = Convert.ToInt32(Convert.ToString(((Label)gv_pacientes.Rows[e.RowIndex].FindControl("lbl_idpaciente")).Text));
            int idprovincia = Convert.ToInt32(((DropDownList)gv_pacientes.Rows[e.RowIndex].FindControl("ddl_provincias")).SelectedValue); 
            int idlocalidad = Convert.ToInt32(((DropDownList)gv_pacientes.Rows[e.RowIndex].FindControl("ddl_localidades")).SelectedValue); 
            String nombre = ((TextBox)gv_pacientes.Rows[e.RowIndex].FindControl("txt_nombre")).Text; 
            String apellido = ((TextBox)gv_pacientes.Rows[e.RowIndex].FindControl("txt_apellido")).Text; 
            String sexo = Convert.ToString(((DropDownList)gv_pacientes.Rows[e.RowIndex].FindControl("ddl_genero")).SelectedValue);
            String nacionalidad = ((TextBox)gv_pacientes.Rows[e.RowIndex].FindControl("txt_nacionalidad")).Text;
            DateTime fecha = Convert.ToDateTime(((TextBox)gv_pacientes.Rows[e.RowIndex].FindControl("txt_fecha")).Text);
            String direccion = ((TextBox)gv_pacientes.Rows[e.RowIndex].FindControl("txt_direccion")).Text;
            String email = ((TextBox)gv_pacientes.Rows[e.RowIndex].FindControl("txt_correo")).Text;
            String telefono = ((TextBox)gv_pacientes.Rows[e.RowIndex].FindControl("txt_telefono")).Text;

            if (negocio.ModificarPaciente(idpaciente, idprovincia, idlocalidad, nombre, apellido, sexo, nacionalidad, fecha, direccion, email, telefono))
            {
                lbl_mensaje.Text = "Cambios realizado correctamente ";
                gv_pacientes.EditIndex = -1; 
                CargarGridViewPacientes(); 
            }
            else
            {
                lbl_mensaje.Text = "Error al realizar cambios";
            }
        }

        protected void ddl_provincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlprovincia = (DropDownList)sender;

            GridViewRow row = (GridViewRow)ddlprovincia.NamingContainer;

            DropDownList ddllocalidad = (DropDownList)row.FindControl("ddl_localidades");

            CargarDropDownListLocal(ddllocalidad, ddlprovincia);
        }
    }
}