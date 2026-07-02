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
                    SqlDataSourceMedico.SelectCommand = $"SELECT Id_Turno_Tur, Descripcion_EsTur AS Estado, (Nombre_Paci + ' ' + Apellido_Paci) AS Paciente, DNI_Paci AS DNI, CONVERT(VARCHAR(5), Horario_Tur, 108) AS Horario, Fecha_Tur AS Fecha FROM Turnos INNER JOIN Pacientes ON Turnos.Id_Paciente_Tur = Pacientes.Id_Paciente_Paci INNER JOIN EstadoTurno ON Turnos.Id_EstadoTurno_Tur = EstadoTurno.Id_Estado_EsTur WHERE Id_Medico_Tur = {idmedico} AND Fecha_Tur >= CAST(GETDATE() AS DATE) AND Id_EstadoTurno_Tur = 1";
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
            int idTurno = Convert.ToInt32(DLMedico.DataKeys[item.ItemIndex]);

            TextBox txtObs = (TextBox)item.FindControl("txtObservaciones");

            if (ddl.SelectedValue == "1") // Presente
            {
                txtObs.Enabled = true;
            }
            else if (ddl.SelectedValue == "2")
            {
                txtObs.Enabled = false;
                negocioTurnos.AgregarAsistenciaObservacion(idTurno, 2, String.Empty);
            }
        }

        protected void DLMedico_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "GuardarObservacion")
            {
                int idturno = Convert.ToInt32(e.CommandArgument);
                TextBox descipcion = (TextBox)e.Item.FindControl("txtObservaciones");
                DropDownList asistencia = (DropDownList)e.Item.FindControl("ddlAsistencia");

                if (asistencia.SelectedValue == "1")
                {
                    negocioTurnos.AgregarAsistenciaObservacion(idturno, 1, descipcion.Text);
                }
            }
        }



        protected void btn_actualizar_Click(object sender, EventArgs e)
        {
            DLMedico.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            int dni = Convert.ToInt32(txtBuscar.Text);
            SqlDataSourceMedico.SelectCommand = "SELECT Id_Turno_Tur, Descripcion_EsTur AS Estado, (Nombre_Paci + ' ' + Apellido_Paci) AS Paciente, DNI_Paci AS DNI, CONVERT(VARCHAR(5), Horario_Tur, 108) AS Horario, Fecha_Tur AS Fecha FROM Turnos INNER JOIN Pacientes ON Turnos.Id_Paciente_Tur = Pacientes.Id_Paciente_Paci INNER JOIN EstadoTurno ON Turnos.Id_EstadoTurno_Tur = EstadoTurno.Id_Estado_EsTur WHERE Fecha_Tur >= CAST(GETDATE() AS DATE) AND Id_EstadoTurno_Tur = 1 AND Horario_Tur >= CAST(GETDATE() AS TIME) AND CONVERT(VARCHAR(20), DNI_Paci) LIKE @DNI";
            SqlDataSourceMedico.SelectParameters.Clear();
            SqlDataSourceMedico.SelectParameters.Add("DNI", dni + "%");
            DLMedico.DataBind();

        }
    }
}