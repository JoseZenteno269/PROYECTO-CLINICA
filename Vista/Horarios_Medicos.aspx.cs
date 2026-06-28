using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Horarios_Medicos : System.Web.UI.Page
    {
        NegocioMedicos negocio = new NegocioMedicos(); 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UsuarioAdmin"] != null)
                {
                    lbl_usuario.Text = Session["UsuarioAdmin"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btn_menu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void cb_lunes_CheckedChanged(object sender, EventArgs e)
        {
            horainiciol.Enabled = !horainiciol.Enabled;
            horafinl.Enabled = !horafinl.Enabled;
        }

        protected void cb_martes_CheckedChanged(object sender, EventArgs e)
        {
            horainiciom.Enabled = !horainiciom.Enabled;
            horafinm.Enabled = !horafinm.Enabled;
        }

        protected void cb_miercoles_CheckedChanged(object sender, EventArgs e)
        {
            horainiciomi.Enabled = !horainiciomi.Enabled;
            horafinmi.Enabled = !horafinmi.Enabled;
        }

        protected void cb_jueves_CheckedChanged(object sender, EventArgs e)
        {
            horainicioj.Enabled = !horainicioj.Enabled;
            horafinj.Enabled = !horafinj.Enabled;
        }

        protected void cb_viernes_CheckedChanged(object sender, EventArgs e)
        {
            horainiciov.Enabled = !horainiciov.Enabled;
            horafinv.Enabled = !horafinv.Enabled;
        }
        protected void cb_sabado_CheckedChanged(object sender, EventArgs e)
        {
            horainicios.Enabled = !horainicios.Enabled;
            horafins.Enabled = !horafins.Enabled;
        }
        protected void cb_domingo_CheckedChanged(object sender, EventArgs e)
        {
            horainiciod.Enabled = !horainiciod.Enabled;
            horafind.Enabled = !horafind.Enabled;
        }

        protected void btn_aceptar_Click(object sender, EventArgs e)
        {
            int? idmedico = negocio.getIdMedico(txt_legajo.Text.Trim());
            if (idmedico == null)
            {
                Label1.Text = "error al cargar";
                return;
            }

            int[] dia = new int[7];
            dia[0] = (cb_lunes.Checked ? Math.Abs((int)(TimeSpan.Parse(horainiciol.Text.Trim()) - TimeSpan.Parse(horafinl.Text.Trim())).TotalHours) : 0);
            dia[1] = (cb_martes.Checked ? Math.Abs((int)(TimeSpan.Parse(horainiciom.Text.Trim()) - TimeSpan.Parse(horafinm.Text.Trim())).TotalHours) : 0);
            dia[2] = (cb_miercoles.Checked ? Math.Abs((int)(TimeSpan.Parse(horainiciomi.Text.Trim()) - TimeSpan.Parse(horafinmi.Text.Trim())).TotalHours) : 0);
            dia[3] = (cb_jueves.Checked ? Math.Abs((int)(TimeSpan.Parse(horainicioj.Text.Trim()) - TimeSpan.Parse(horafinj.Text.Trim())).TotalHours) : 0);
            dia[4] = (cb_viernes.Checked ? Math.Abs((int)(TimeSpan.Parse(horainiciov.Text.Trim()) - TimeSpan.Parse(horafinv.Text.Trim())).TotalHours) : 0);
            dia[5] = (cb_sabado.Checked ? Math.Abs((int)(TimeSpan.Parse(horainicios.Text.Trim()) - TimeSpan.Parse(horafins.Text.Trim())).TotalHours) : 0);
            dia[6] = (cb_domingo.Checked ? Math.Abs((int)(TimeSpan.Parse(horainiciod.Text.Trim()) - TimeSpan.Parse(horafind.Text.Trim())).TotalHours) : 0); 

            int[] horainicio = new int[7];
            horainicio[0] = (cb_lunes.Checked ? (int)(TimeSpan.Parse(horainiciol.Text.Trim()).Hours) : 0); 
            horainicio[1] = (cb_martes.Checked ? (int)(TimeSpan.Parse(horainiciom.Text.Trim()).Hours) : 0); 
            horainicio[2] = (cb_miercoles.Checked ? (int)(TimeSpan.Parse(horainiciomi.Text.Trim()).Hours) : 0);
            horainicio[3] = (cb_jueves.Checked ? (int)(TimeSpan.Parse(horainicioj.Text.Trim()).Hours) : 0);
            horainicio[4] = (cb_viernes.Checked ? (int)(TimeSpan.Parse(horainiciov.Text.Trim()).Hours) : 0);
            horainicio[5] = (cb_sabado.Checked ? (int)(TimeSpan.Parse(horainicios.Text.Trim()).Hours) : 0);
            horainicio[6] = (cb_domingo.Checked ? (int)(TimeSpan.Parse(horainiciod.Text.Trim()).Hours) : 0); 

            for(int i = 0; i < dia.Length; i++)
            {
                if (dia[i] != 0)
                {
                    for (int j = 0; j < dia[i]; j++)
                    {
                        if (negocio.AgregarHorarios(Convert.ToInt32(idmedico), (i + 1), TimeSpan.FromHours(horainicio[i] + j)))
                        {
                            Label1.Text = "horarios agregador con exito"; 
                        }
                    }
                }
            }
        }
    }
}
