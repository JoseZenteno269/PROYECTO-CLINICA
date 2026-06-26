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
    public partial class Listado_Pacientes : System.Web.UI.Page
    {
       NegocioClinica negocioClinica = new NegocioClinica();
       Pacientes pacientes = new Pacientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                    CargarLetras();
                    CargarDropDownListProvincias();
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
            Response.Redirect("Login.aspx");
        }

        protected void btn_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

       

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            SqlDataSourcePacientes.SelectCommand = "SELECT DNI_Paci AS DNI,Descripcion_Prov AS Provincia,Descripcion_Local AS Localidad,(Nombre_Paci + ' ' + Apellido_Paci) AS[Nombre y Apellido],Sexo_Paci,Nacionalidad_Paci,FechaNacimiento_Paci,Direccion_Paci,CorreoElectronico_Paci,Telefono_Paci FROM Pacientes INNER JOIN Provincias ON Pacientes.Id_Provincia_Paci = Provincias.Id_Provincia_Prov INNER JOIN Localidades ON Pacientes.Id_Localidad_Paci = Localidades.Id_Localidad_Local WHERE CAST(DNI_Paci AS VARCHAR(20)) LIKE @DNI ";
            SqlDataSourcePacientes.SelectParameters.Clear();
            SqlDataSourcePacientes.SelectParameters.Add("DNI", "%" + txt_buscar.Text + "%");
            lv_pacientes.DataBind();
            ddl_Letras.SelectedIndex = 0;
            ddl_ProvinciasFiltro.SelectedIndex = 0;
            txt_buscar.Text = string.Empty;
        }

        ///FIltrado por Nombre
        
        public void CargarLetras()
        {
            for(char Letra = 'A'; Letra <= 'Z';Letra ++)
            {
                ddl_Letras.Items.Add(new ListItem(Letra.ToString(), Letra.ToString()));
            }

            ddl_Letras.Items.Insert(0,new ListItem("-- Elegir una Letra -- ", "%"));
            
        }

        protected void ddl_Letras_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Letra = ddl_Letras.SelectedValue;
            SqlDataSourcePacientes.SelectCommand = "SELECT DNI_Paci AS DNI,Descripcion_Prov AS Provincia,Descripcion_Local AS Localidad,(Nombre_Paci + ' ' + Apellido_Paci) AS[Nombre y Apellido],Sexo_Paci,Nacionalidad_Paci,FechaNacimiento_Paci,Direccion_Paci,CorreoElectronico_Paci,Telefono_Paci FROM Pacientes INNER JOIN Provincias ON Pacientes.Id_Provincia_Paci = Provincias.Id_Provincia_Prov INNER JOIN Localidades ON Pacientes.Id_Localidad_Paci = Localidades.Id_Localidad_Local WHERE Nombre_Paci LIKE @Letra ";
            SqlDataSourcePacientes.SelectParameters.Clear();
            SqlDataSourcePacientes.SelectParameters.Add("Letra", Letra + "%");
            lv_pacientes.DataBind();
        }


        /// FIltrado por Provincia
        
        public void CargarDropDownListProvincias()
        {
            ddl_ProvinciasFiltro.DataSource = negocioClinica.getDropDownListProvincias();
            ddl_ProvinciasFiltro.DataTextField = "Descripcion_Prov";
            ddl_ProvinciasFiltro.DataValueField = "Id_Provincia_Prov";
            ddl_ProvinciasFiltro.DataBind();
            ddl_ProvinciasFiltro.Items.Insert(0,new ListItem("-- Seleccione una Provincia --","%"));
        }

        protected void ddl_ProvinciasFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Provincias = ddl_ProvinciasFiltro.SelectedValue;
            SqlDataSourcePacientes.SelectCommand = "SELECT DNI_Paci AS DNI,Descripcion_Prov AS Provincia,Descripcion_Local AS Localidad,(Nombre_Paci + ' ' + Apellido_Paci) AS[Nombre y Apellido],Sexo_Paci,Nacionalidad_Paci,FechaNacimiento_Paci,Direccion_Paci,CorreoElectronico_Paci,Telefono_Paci FROM Pacientes INNER JOIN Provincias ON Pacientes.Id_Provincia_Paci = Provincias.Id_Provincia_Prov INNER JOIN Localidades ON Pacientes.Id_Localidad_Paci = Localidades.Id_Localidad_Local WHERE Id_Provincia_Paci LIKE @Provincias ";
            SqlDataSourcePacientes.SelectParameters.Clear();
            SqlDataSourcePacientes.SelectParameters.Add("Provincias", Provincias);
            lv_pacientes.DataBind();

        }
    }
}