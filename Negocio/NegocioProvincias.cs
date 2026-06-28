using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioProvincias
    {
        DaoProvincias daoProvincias = new DaoProvincias();

        public NegocioProvincias()
        {

        }

        public DataTable getDropDownListProvincias()
        {
            return daoProvincias.getTablaProvincia();
        }
    }
}
