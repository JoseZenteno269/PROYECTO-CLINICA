using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Recovery : System.Web.UI.Page
    {
        NegocioClinica negocio = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_confirmar_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txt_usuario.Text.Trim()) && !string.IsNullOrEmpty(txt_contrasena1.Text.Trim()) && !string.IsNullOrEmpty(txt_contrasena2.Text.Trim()))
            {
                int? idusuario = negocio.getIdUsuario(txt_usuario.Text.Trim());
                if(idusuario == null)
                {
                    lbl_mensaje.Text = "Usuario inexistente";
                    return; 
                }

                if(negocio.CambioConstrasena(Convert.ToInt32(idusuario), txt_contrasena1.Text.Trim()))
                {
                    lbl_mensaje.Text = "Contraseña actualizada correctamente. Redirigiendo...";
                    Response.AddHeader("REFRESH", "3;URL=Login.aspx");
                }
                else
                {
                    lbl_mensaje.Text = "Ocurrio un Error intentelo mas tarde"; 
                }
            }
        }
    }
}