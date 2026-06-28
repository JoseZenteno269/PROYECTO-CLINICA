using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Provincias
    {
        private int IdProvincia;
        private String Descripcion;

        public Provincias()
        {

        }
        
        public void setIdprovincia(int idprovincia)
        {
            IdProvincia = idprovincia;
        }

        public int getIdprovincia()
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
