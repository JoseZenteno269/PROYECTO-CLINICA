using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class EstadoTurno
    {
        private int IdEstado;
        private String Descripcion;

        public EstadoTurno()
        {

        }

        public void setIdEstado(int idEstado)
        {
            IdEstado = idEstado;
        }

        public int getIdEstado()
        {
            return IdEstado;
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
