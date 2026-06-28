using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class EstadoPaciente
    {
        private int IdEstadoPaciente;
        private String Descripcion;

        public EstadoPaciente()
        {

        }

        public void setIdEstadoPaciente(int idEstadoPaciente)
        { 
            IdEstadoPaciente = idEstadoPaciente;
        }

        public int getIdEstadoPaciente()
        {
            return IdEstadoPaciente;
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
