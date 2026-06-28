using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioAdministradores
    {
        DaoAdministradores daoAdministradores = new DaoAdministradores();
        public NegocioAdministradores()
        {

        }

        public int? getIdAdministrador(String usuario)
        {
            return daoAdministradores.getIdAdministrador(usuario);
        }
    }
}
