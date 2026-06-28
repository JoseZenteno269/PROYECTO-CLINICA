using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Modificacion_Medicos : System.Web.UI.Page
    {
        NegocioMedicos negocio = new NegocioMedicos();
        NegocioProvincias negocioProvincias = new NegocioProvincias();
        NegocioLocalidades negocioLocalidades = new NegocioLocalidades();
        NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarGridViewMedicos(); 
                }
                else
                {
                    Response.Redirect("Inicio.aspx");
                }
            }
        }

        public void CargarGridViewMedicos()
        {
            gv_medicos.DataSource = negocio.getMedicos(); 
            gv_medicos.DataBind();
        }

        public void CargarGridViewMedicos(String consulta)
        {
            gv_medicos.DataSource = negocio.getMedicos(consulta);
            gv_medicos.DataBind();
        }

        protected void lb_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible;
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx"); 
        }

        public void CargarDropDownListProv(DropDownList ddlprov)
        {
            ddlprov.DataSource = negocioProvincias.getDropDownListProvincias();
            ddlprov.DataTextField = "Descripcion_Prov";
            ddlprov.DataValueField = "Id_Provincia_Prov";
            ddlprov.DataBind();
            ddlprov.Items.Insert(0, new ListItem("-- Opcion --", "0"));
        }

        public void CargarDropDownListLocal(DropDownList ddlloca, DropDownList ddlprov)
        {
            DataTable tabla = negocioLocalidades.getDropDownListLocalidades();
            tabla.DefaultView.RowFilter = "Id_Provincia_Local = " + ddlprov.SelectedValue;
            ddlloca.DataSource = tabla.DefaultView;
            ddlloca.DataTextField = "Descripcion_Local";
            ddlloca.DataValueField = "Id_Localidad_Local";
            ddlloca.DataBind();
            ddlloca.Items.Insert(0, new ListItem("-- Opcion --", "0"));
        }

        public void CargarDropDownListEspe(DropDownList ddlespe)
        {
            ddlespe.DataSource = negocioEspecialidad.getDropDownListEspecialidad();
            ddlespe.DataTextField = "Nombre_Espe";
            ddlespe.DataValueField = "Id_Especialidad_Espe";
            ddlespe.DataBind();
            ddlespe.Items.Insert(0, new ListItem("-- Opcion --", "0"));
        }

        protected void gv_medicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_medicos.EditIndex = e.NewEditIndex;
            CargarGridViewMedicos();
            

            DropDownList ddlprovincia = (DropDownList)gv_medicos.Rows[e.NewEditIndex].FindControl("ddl_provincias");
            DropDownList ddllocalidad = (DropDownList)gv_medicos.Rows[e.NewEditIndex].FindControl("ddl_localidad"); 
            DropDownList ddlespecialidad = (DropDownList)gv_medicos.Rows[e.NewEditIndex].FindControl("ddl_especialidad");
            DropDownList ddlgenero = (DropDownList)gv_medicos.Rows[e.NewEditIndex].FindControl("ddl_genero");

            int idProvincia = Convert.ToInt32(gv_medicos.DataKeys[e.NewEditIndex]["Id_Provincia_Med"]);
            int idLocalidad = Convert.ToInt32(gv_medicos.DataKeys[e.NewEditIndex]["Id_Localidad_Med"]);
            int idEspecialidad = Convert.ToInt32(gv_medicos.DataKeys[e.NewEditIndex]["Id_Especialidad_Med"]);
            String genero = gv_medicos.DataKeys[e.NewEditIndex]["Sexo_Med"].ToString();

            CargarDropDownListProv(ddlprovincia); 
            CargarDropDownListEspe(ddlespecialidad);
            ddlprovincia.SelectedValue = idProvincia.ToString(); 
            CargarDropDownListLocal(ddllocalidad, ddlprovincia);
            ddllocalidad.SelectedValue = idLocalidad.ToString();
            ddlespecialidad.SelectedValue = idEspecialidad.ToString();
            ddlgenero.SelectedValue = genero.ToString();
        }

        protected void gv_medicos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_medicos.EditIndex = -1;
            CargarGridViewMedicos(); 
        }

        protected void gv_medicos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            String idmedico = Convert.ToString(((Label)gv_medicos.Rows[e.RowIndex].FindControl("lbl_idmedico")).Text); 
            int provincia = Convert.ToInt32(((DropDownList)gv_medicos.Rows[e.RowIndex].FindControl("ddl_provincias")).SelectedValue);
            int localidad = Convert.ToInt32(((DropDownList)gv_medicos.Rows[e.RowIndex].FindControl("ddl_localidad")).SelectedValue);
            int especialidad = Convert.ToInt32(((DropDownList)gv_medicos.Rows[e.RowIndex].FindControl("ddl_especialidad")).SelectedValue);
            String nombre = ((TextBox)gv_medicos.Rows[e.RowIndex].FindControl("txt_nombre")).Text;
            String apellido = ((TextBox)gv_medicos.Rows[e.RowIndex].FindControl("txt_apellido")).Text;
            String sexo = Convert.ToString(((DropDownList)gv_medicos.Rows[e.RowIndex].FindControl("ddl_genero")).SelectedValue);
            String nacionalidad = ((TextBox)gv_medicos.Rows[e.RowIndex].FindControl("txt_nacionalidad")).Text;
            DateTime fecha = Convert.ToDateTime(((TextBox)gv_medicos.Rows[e.RowIndex].FindControl("txt_fecha")).Text);
            String direccion = ((TextBox)gv_medicos.Rows[e.RowIndex].FindControl("txt_direccion")).Text;
            String email = ((TextBox)gv_medicos.Rows[e.RowIndex].FindControl("txt_correo")).Text;
            String telefono = ((TextBox)gv_medicos.Rows[e.RowIndex].FindControl("txt_telefono")).Text;

            if(negocio.ModificarMedico(Convert.ToInt32(idmedico), provincia, localidad, especialidad, nombre, apellido, sexo, nacionalidad, fecha, direccion, email, telefono))
            {
                lbl_mensaje.Text = "Cambios realizado correctamente ";
                gv_medicos.EditIndex = -1;
                CargarGridViewMedicos(); 
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

            DropDownList ddllocalidad = (DropDownList)row.FindControl("ddl_localidad");

            CargarDropDownListLocal(ddllocalidad, ddlprovincia);
        }

        protected void btn_Aceptar_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txt_busqueda.Text.Trim()))
            {
                String busqueda = txt_busqueda.Text.Trim();
                String consulta = $" AND Legajo_Med = '{busqueda}' OR CAST(DNI_Med AS NVARCHAR) LIKE '{busqueda}%' OR Nombre_Med LIKE '{busqueda}%' OR Apellido_Med LIKE '{busqueda}%'";
                CargarGridViewMedicos(consulta); 
            }
            else
            {
                CargarGridViewMedicos(); 
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