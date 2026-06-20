using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuarios
    {
        private int IdUsuario;
        private int IdMedico;
        private int? IdAdministrador;
        private String Username;
        private String Password;
        private Boolean Activo;

        public void setIdUsuario(int idUsuario)
        {
            IdUsuario = idUsuario;
        }

        public int getIdUsuario()
        {
            return IdUsuario;
        }

        public void setIdMedico(int idMedico)
        {
            IdMedico = idMedico;
        }

        public int getIdMedico()
        {
            return IdMedico;
        }

        public void setIdAdministrador(int? idAdministrador) 
        { 
            IdAdministrador = idAdministrador;
        }

        public int? getIdAdministrador()
        {
            return IdAdministrador;
        }

        public void setUsername(String username)
        {
            Username = username;
        }

        public String getUsername()
        {
            return Username;
        }

        public void setPassword(String password)
        {
            Password = password;
        }

        public String getPassword()
        {
            return Password;
        }

        public void setActivo(Boolean activo)
        {
            Activo = activo;
        }

        public Boolean getActivo()
        {
            return Activo;
        }
    }
}
