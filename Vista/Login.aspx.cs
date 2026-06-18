using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Login : System.Web.UI.Page
    {
        NegocioClinica negocio = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_iniciar_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(txt_usuario.Text.Trim()) && !string.IsNullOrEmpty(txt_contrasena.Text.Trim()))
            {
                if(negocio.getUsuarios(txt_usuario.Text.Trim(), txt_contrasena.Text.Trim()))
                {

                }
            }
        }
    }
}