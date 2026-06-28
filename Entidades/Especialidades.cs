using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Especialidades
    {
        private int IdEspecialidad;
        private String Nombre;
        private String Descripcion;

        public Especialidades()
        {

        }

        public void setIdEspecialidad(int idEspecialidad)
        { 
            IdEspecialidad = idEspecialidad;
        }

        public int getIdEspecialidad()
        {
            return IdEspecialidad;
        }

        public void setNombre(String nombre)
        {
            Nombre = nombre;
        }

        public String getNombre()
        {
            return Nombre;
        }

        public void setDescripcion(String descripcion)
        {
            Descripcion = descripcion;
        }

        public String getDescription()
        {
            return Descripcion;
        }
    }
}

