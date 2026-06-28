using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Localidades
    {
        private int IdLocalidad;
        private int IdProvincia;
        private String Descripcion;

        public Localidades()
        {

        }

        public void setIdLodalidad(int idLocalidad)
        {
            IdLocalidad = idLocalidad;
        }

        public int getIdLocalidad()
        {
            return IdLocalidad;
        }

        public void setIdProvincia(int idProvincia)
        {
            IdProvincia = idProvincia;
        }

        public int getProvincia()
        {
            return IdProvincia;
        }

        public void setDescripcion(String descripcion)
        {
            Descripcion = descripcion;
        }

        public String getDescripcion()
        {
            return Descripcion; 
        }
    }
}
