using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioUsuarios
    {
        DaoUsuarios daoUsuarios = new DaoUsuarios(); 

        public NegocioUsuarios()
        {
        }
        public String getUsuarios(String usuario, String constrasena)
        {
            return daoUsuarios.MedicoAdministrador(usuario, constrasena);
        }
        public int? getIdUsuario(String username)
        {
            return daoUsuarios.getIdUsuario(username);
        }

        public Boolean CambioConstrasena(int idusuario, String contrasena)
        {
            int filasafectadas = daoUsuarios.CambioContrasena(idusuario, contrasena);
            return filasafectadas == 1;
        }
        public Boolean AgregarUsuarios(int idmedico, int? idadministrador, String username, String password)
        {
            int FilasAfectadas = 0;

            Usuarios usuarios = new Usuarios();
            usuarios.setIdMedico(idmedico);
            usuarios.setIdAdministrador(idadministrador);
            usuarios.setUsername(username);
            usuarios.setPassword(password);

            FilasAfectadas = daoUsuarios.AgregarUsuario(usuarios);

            return FilasAfectadas == 1;
        }
    }
}
