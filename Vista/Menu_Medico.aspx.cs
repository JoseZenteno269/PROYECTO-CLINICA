using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Vista
{
    public partial class MenuMedico : System.Web.UI.Page
    {

        NegocioTurnos negocioTurnos = new NegocioTurnos();
        NegocioMedicos NegocioMedicos = new NegocioMedicos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UsuarioMed"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioMed"].ToString();
                    int? idmedico = NegocioMedicos.getIdMedico(NegocioMedicos.getLegajoMedico(Session["UsuarioMed"].ToString()));
                    SqlDataSourceMedico.SelectCommand = $"SELECT Descripcion_EsTur AS Estado, (Nombre_Paci + ' ' + Apellido_Paci) AS Paciente, DNI_Paci AS DNI, CONVERT(VARCHAR(5), Horario_Tur, 108) AS Horario, Fecha_Tur AS Fecha FROM Turnos INNER JOIN Pacientes ON Turnos.Id_Paciente_Tur = Pacientes.Id_Paciente_Paci INNER JOIN EstadoTurno ON Turnos.Id_EstadoTurno_Tur = EstadoTurno.Id_Estado_EsTur WHERE Id_Medico_Tur = {idmedico}"; 
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
            Session["UsuarioMed"] = null; 
        }

        protected void lb_perfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil_Medico.aspx"); 
        }

        protected void ddlAsistencia_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            DataListItem item = (DataListItem)ddl.NamingContainer;
            TextBox txtObservacion = (TextBox)item.FindControl("txtObservaciones");


            if (ddl.SelectedValue == "1") // Presente
            {
                txtObservacion.Enabled = true;
            }
            else if(ddl.SelectedValue == "0" || ddl.SelectedValue == "2")
            {
                txtObservacion.Enabled = false;
            }
        }
    }
}