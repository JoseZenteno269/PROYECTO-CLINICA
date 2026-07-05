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
       NegocioMedicos negocioClinica = new NegocioMedicos();
       NegocioProvincias negocioProvincias = new NegocioProvincias();
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

                string Iniciales = Session["FiltroIniciales"]?.ToString() ?? "%";
                string provincia = Session["FiltroProvincia"]?.ToString() ?? "%";

                AplicarFiltros(Iniciales, provincia);
                }
                else
                {
                    Response.Redirect("Inicio.aspx");
                }
            }
        }

        /// Eventos de Panel Perfil del Login
        protected void lb_usuario_menu_Click(object sender, EventArgs e)
        {
            p_panel.Visible = !p_panel.Visible;
        }

        protected void lb_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
        protected void lb_perfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil_Administrador.aspx");
        }

        protected void lb_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        /// Buttons

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

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            ddl_Letras.SelectedIndex = 0;
            ddl_ProvinciasFiltro.SelectedIndex = 0;
            lv_pacientes.DataBind();

            Session["FiltroIniciales"] = "%";
            Session["FiltroProvincia"] = "%";
        }

        /// Cargas DropDownList

        public void CargarLetras()
        {
            for(char Letra = 'A'; Letra <= 'Z';Letra ++)
            {
                ddl_Letras.Items.Add(new ListItem(Letra.ToString(), Letra.ToString()));
            }

            ddl_Letras.Items.Insert(0,new ListItem("-- Elegir una Letra -- ", "%"));
            
        }
        public void CargarDropDownListProvincias()
        {
            ddl_ProvinciasFiltro.DataSource = negocioProvincias.getDropDownListProvincias();
            ddl_ProvinciasFiltro.DataTextField = "Descripcion_Prov";
            ddl_ProvinciasFiltro.DataValueField = "Id_Provincia_Prov";
            ddl_ProvinciasFiltro.DataBind();
            ddl_ProvinciasFiltro.Items.Insert(0, new ListItem("-- Seleccione una Provincia --", "%"));
        }

        /// Filtado
        
        public void FiltrarPacientes()
        {
            string inciales = ddl_Letras.SelectedValue;
            string provincias = ddl_ProvinciasFiltro.SelectedValue;

            Session["FiltroInciales"] = inciales;
            Session["FiltroProvincia"] = provincias;

            AplicarFiltros(inciales, provincias);
        }


        public void AplicarFiltros(string Iniciales, string provincia)
        {
            string consulta = "SELECT DNI_Paci AS DNI,Descripcion_Prov AS Provincia,Descripcion_Local AS Localidad,(Nombre_Paci + ' ' + Apellido_Paci) AS[Nombre y Apellido],Sexo_Paci,Nacionalidad_Paci,FechaNacimiento_Paci,Direccion_Paci,CorreoElectronico_Paci,Telefono_Paci FROM Pacientes INNER JOIN Provincias ON Pacientes.Id_Provincia_Paci = Provincias.Id_Provincia_Prov INNER JOIN Localidades ON Pacientes.Id_Localidad_Paci = Localidades.Id_Localidad_Local WHERE Activo_Paci = 1";
            SqlDataSourcePacientes.SelectParameters.Clear();

            if(Iniciales != "%")
            {
                consulta += " AND Nombre_Paci LIKE @Letras ";
                SqlDataSourcePacientes.SelectParameters.Add("Letras",Iniciales + "%");
            }

            if(provincia != "%")
            {
                consulta += " AND Id_Provincia_Paci = @Provincia ";
                SqlDataSourcePacientes.SelectParameters.Add("Provincia",provincia);
            }

            SqlDataSourcePacientes.SelectCommand = consulta;
            lv_pacientes.DataBind();
        }

        /// Eventos ddl seleccion
        protected void ddl_Letras_SelectedIndexChanged(object sender, EventArgs e)
        {
            FiltrarPacientes();
        }       

        protected void ddl_ProvinciasFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            FiltrarPacientes();
        }

        protected void lv_pacientes_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager dataPager = (DataPager)lv_pacientes.FindControl("DataPager1");
            dataPager.SetPageProperties(e.StartRowIndex,e.MaximumRows,false);

            string Iniciales = Session["FiltroIniciales"]?.ToString() ?? "%";
            string provincia = Session["FiltroProvincia"]?.ToString() ?? "%";

            AplicarFiltros(Iniciales, provincia);
        }
    }
}