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
        NegocioClinica negocio = new NegocioClinica(); 
        protected void Page_Load(object sender, EventArgs e)
        { 

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

        protected void btn_Aceptar_Click(object sender, EventArgs e)
        {
            sds_medicos.SelectCommand = "SELECT [Id_Medico_Med], [Legajo_Med], [Id_Provincia_Med], [Id_Localidad_Med], [Id_Especialidad_Med], [DNI_Med], [Nombre_Med], [Apellido_Med], [Sexo_Med], [Nacionalidad_Med], [FechaNacimiento_Med], [Direccion_Med], [CorreoElectronico_Med], [Telefono_Med], [Activo_Med] FROM [Medicos] WHERE [Legajo_Med] = @busqueda OR CAST([DNI_Med] AS NVARCHAR) LIKE @busquedaLIKE OR [Nombre_Med] LIKE @busquedaLIKE OR [Apellido_Med] LIKE @busquedaLIKE";
            sds_medicos.SelectParameters.Clear();
            sds_medicos.SelectParameters.Add("busqueda", txt_busqueda.Text);
            sds_medicos.SelectParameters.Add("busquedaLIKE", "%" + txt_busqueda.Text);
            lv_medicos.DataBind(); 
        }

        public void CargarDropDownListProv(DropDownList ddlprov)
        {
            ddlprov.DataSource = negocio.getDropDownListProvincias();
            ddlprov.DataTextField = "Descripcion_Prov";
            ddlprov.DataValueField = "Id_Provincia_Prov";
            ddlprov.DataBind();
            ddlprov.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }

        public void CargarDropDownListLocal(DropDownList ddlloca, DropDownList ddlprov)
        {
            DataTable tabla = negocio.getDropDownListLocalidades();
            tabla.DefaultView.RowFilter = "Id_Provincia_Local = " + ddlprov.SelectedValue;
            ddlloca.DataSource = tabla.DefaultView;
            ddlloca.DataTextField = "Descripcion_Local";
            ddlloca.DataValueField = "Id_Provincia_Local";
            ddlloca.DataBind();
            ddlloca.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }

        public void CargarDropDownListEspe(DropDownList ddlespe)
        {
            ddlespe.DataSource = negocio.getDropDownListEspecialidad();
            ddlespe.DataTextField = "Nombre_Espe";
            ddlespe.DataValueField = "Id_Especialidad_Espe";
            ddlespe.DataBind();
            ddlespe.Items.Insert(0, new ListItem("-- Seleccione una opcion --", "0"));
        }

        protected void lv_medicos_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lv_medicos.EditIndex = e.NewEditIndex;
            lv_medicos.DataBind();
            ListViewItem item = lv_medicos.Items[e.NewEditIndex];
            Label1.Text = item.ToString(); 

            DropDownList ddlprovincia = (DropDownList)item.FindControl("ddl_Id_Provincia_Med");
            DropDownList ddllocalidades = (DropDownList)item.FindControl("ddl_Id_Localidad_Med");
            DropDownList ddlespecialidades = (DropDownList)item.FindControl("ddl_Id_Especialidad_Med");
            
            CargarDropDownListProv(ddlprovincia);
            CargarDropDownListLocal(ddllocalidades, ddlprovincia);
            CargarDropDownListEspe(ddlespecialidades);

            //DataKey clave = lv_medicos.DataKeys[e.NewEditIndex];
            //int idmedico = Convert.ToInt32(clave.Value);

            //bool medico = negocio.ModificarMedico(idmedico); 
        }

        protected void lv_medicos_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            e.Cancel = false;

            int idmedico = Convert.ToInt32(lv_medicos.DataKeys[e.ItemIndex].Value);

            ListViewItem item = lv_medicos.Items[e.ItemIndex];

            int provincia = Convert.ToInt32(((DropDownList)item.FindControl("ddl_Id_Provincia_Med")).SelectedValue);
            int localidad = Convert.ToInt32(((DropDownList)item.FindControl("ddl_Id_Localidad_Med")).SelectedValue);
            int especialidad = Convert.ToInt32(((DropDownList)item.FindControl("ddl_Id_Especialidad_Med")).SelectedValue);
            String nombre = ((TextBox)item.FindControl("Nombre_MedTextBox")).Text;
            String apellido = ((TextBox)item.FindControl("Apellido_MedTextBox")).Text;
            String sexo = Convert.ToString(((DropDownList)item.FindControl("ddl_Sexo_Med")).SelectedValue);
            String nacionalidad = ((TextBox)item.FindControl("Nacionalidad_MedTextBox")).Text;
            DateTime fecha = Convert.ToDateTime((TextBox)item.FindControl("FechaNacimiento_MedTextBox"));
            String direccion = ((TextBox)item.FindControl("Direccion_MedTextBox")).Text;
            String email = ((TextBox)item.FindControl("CorreoElectronico_MedTextBox")).Text;
            String telefono = ((TextBox)item.FindControl("Telefono_MedTextBox")).Text;

            bool resultado = negocio.ModificarMedico(idmedico, provincia, localidad, especialidad, nombre, apellido, sexo, nacionalidad, fecha, direccion, email, telefono); 
            if (resultado)
            {
                lv_medicos.EditIndex = -1;
                sds_medicos.DataBind();
                lv_medicos.DataBind(); 
            }
        }

        protected void lv_medicos_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lv_medicos.EditIndex = -1;
            lv_medicos.DataBind(); 
        }

    }
}