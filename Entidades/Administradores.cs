using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Administradores
    {
        private int IdAdministrador;
        private int DNI;
        private String Nombre;
        private String Apellido;
        private String CorreoElectronico;
        private String Telefono;
        private Boolean Activo;

        public Administradores()
        {

        }

        public void setIdAdministrador(int idAdministrador)
        {
            IdAdministrador = idAdministrador;
        }

        public int getIdAdministrador()
        {
            return IdAdministrador;
        }

        public void setDni(int dni)
        {
            DNI = dni;
        }

        public int getDni()
        {
            return DNI;
        }

        public void setNombre(String nombre)
        {
            Nombre = nombre;
        }

        public String getNombre()
        {
            return Nombre;
        }

        public void setApellido(String apellido)
        {
            Apellido = apellido;
        }

        public String getApellido()
        {
            return Apellido;
        }

        public void setCorreoElectronico(String correo)
        {
            CorreoElectronico = correo;
        }

        public String getCorreoElectronico()
        {
            return CorreoElectronico;
        }

        public void setTelefono(String telefono)
        {
            Telefono = telefono;
        }

        public String getTelefono()
        {
            return Telefono;
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
