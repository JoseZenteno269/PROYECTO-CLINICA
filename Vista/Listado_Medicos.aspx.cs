using Entidades;
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
    public partial class Listado_Medicos : System.Web.UI.Page
    {
        NegocioMedicos negocioClinica = new NegocioMedicos();
        Medicos medicos = new Medicos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarDropDownListEspecialidad();
                    CargarDropDownListSexo();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
           
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lb_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible;
        }

        protected void btn_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            SqlDataSourceMedicos.SelectCommand = "SELECT Legajo_Med AS Legajo, Descripcion_Prov AS Provincia, Descripcion_Local AS Localidad, Nombre_Espe AS Especialidad, DNI_Med AS Dni, (Nombre_Med + ' ' + Apellido_Med) AS [Nombre y Apellido], Sexo_Med AS Sexo, Nacionalidad_Med AS Nacionalidad, FechaNacimiento_Med AS [Fecha de Nacimiento], Direccion_Med AS Direccion, CorreoElectronico_Med AS Email, Telefono_Med AS Telefono FROM Medicos INNER JOIN Provincias ON Medicos.Id_Provincia_Med = Provincias.Id_Provincia_Prov INNER JOIN Localidades ON Medicos.Id_Localidad_Med = Localidades.Id_Localidad_Local INNER JOIN Especialidad ON Medicos.Id_Especialidad_Med = Especialidad.Id_Especialidad_Espe WHERE CONVERT(VARCHAR(20), Legajo_Med) LIKE @Legajo";
            SqlDataSourceMedicos.SelectParameters.Clear();
            SqlDataSourceMedicos.SelectParameters.Add("Legajo", "%" + txt_buscar.Text + "%");
            lv_Medicos.DataBind();
            txt_buscar.Text = string.Empty;
            ddl_EspecialidadFiltro.SelectedIndex = 0;
            ddl_SexoFiltrado.SelectedIndex = 0;
        }

        /// Filtrar Especialidad
        public void CargarDropDownListEspecialidad()
        {
            ddl_EspecialidadFiltro.DataSource = negocioClinica.getDropDownListEspecialidad();
            ddl_EspecialidadFiltro.DataTextField = "Nombre_Espe";
            ddl_EspecialidadFiltro.DataValueField = "Id_Especialidad_Espe";
            ddl_EspecialidadFiltro.DataBind();
            ddl_EspecialidadFiltro.Items.Insert(0,new ListItem("-- Seleccione una Especialidad -- ","%"));
        }

        protected void ddl_EspecialidadFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Especialidad = ddl_EspecialidadFiltro.SelectedValue;
            SqlDataSourceMedicos.SelectCommand = "SELECT Legajo_Med AS Legajo, Descripcion_Prov AS Provincia, Descripcion_Local AS Localidad, Nombre_Espe AS Especialidad, DNI_Med AS Dni, (Nombre_Med + ' ' + Apellido_Med) AS [Nombre y Apellido], Sexo_Med AS Sexo, Nacionalidad_Med AS Nacionalidad, FechaNacimiento_Med AS [Fecha de Nacimiento], Direccion_Med AS Direccion, CorreoElectronico_Med AS Email, Telefono_Med AS Telefono FROM Medicos INNER JOIN Provincias ON Medicos.Id_Provincia_Med = Provincias.Id_Provincia_Prov INNER JOIN Localidades ON Medicos.Id_Localidad_Med = Localidades.Id_Localidad_Local INNER JOIN Especialidad ON Medicos.Id_Especialidad_Med = Especialidad.Id_Especialidad_Espe WHERE Id_Especialidad_Med LIKE @Especialidad";
            SqlDataSourceMedicos.SelectParameters.Clear();
            SqlDataSourceMedicos.SelectParameters.Add("Especialidad",Especialidad);
            lv_Medicos.DataBind();
        }


        /// Filtrar por Sexo
        
        public void CargarDropDownListSexo()
        {
            ddl_SexoFiltrado.Items.Add(new ListItem("Masculino", "Masculino"));
            ddl_SexoFiltrado.Items.Add(new ListItem("Femenino", "Femenino"));
            ddl_SexoFiltrado.Items.Insert(0,new ListItem("-- Seleccione un Genero -- ","%"));
        }

        protected void ddl_SexoFiltrado_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Sexo = ddl_SexoFiltrado.SelectedValue;
            SqlDataSourceMedicos.SelectCommand = "SELECT Legajo_Med AS Legajo, Descripcion_Prov AS Provincia, Descripcion_Local AS Localidad, Nombre_Espe AS Especialidad, DNI_Med AS Dni, (Nombre_Med + ' ' + Apellido_Med) AS [Nombre y Apellido], Sexo_Med AS Sexo, Nacionalidad_Med AS Nacionalidad, FechaNacimiento_Med AS [Fecha de Nacimiento], Direccion_Med AS Direccion, CorreoElectronico_Med AS Email, Telefono_Med AS Telefono FROM Medicos INNER JOIN Provincias ON Medicos.Id_Provincia_Med = Provincias.Id_Provincia_Prov INNER JOIN Localidades ON Medicos.Id_Localidad_Med = Localidades.Id_Localidad_Local INNER JOIN Especialidad ON Medicos.Id_Especialidad_Med = Especialidad.Id_Especialidad_Espe WHERE Sexo_Med LIKE @Sexo";
            SqlDataSourceMedicos.SelectParameters.Clear();
            SqlDataSourceMedicos.SelectParameters.Add("Sexo",Sexo);
            lv_Medicos.DataBind();
        }
    }
}