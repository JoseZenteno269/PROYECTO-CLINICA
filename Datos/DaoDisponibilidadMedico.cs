using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoDisponibilidadMedico
    {
        AccesoDatos datos = new AccesoDatos();

        public DaoDisponibilidadMedico()
        {

        }

        public DataTable getTablaDisponibilidadMedica(int dia)
        {
            //DataTable tabla = datos.ObtenerTabla("Disponibilidad_Medico", "SELECT Id_COD_DispMed, Id_Medico_DispMed, (CASE DiaSemana_DispMed WHEN 1 THEN 'Lunes' WHEN 2 THEN 'Martes' WHEN 3 THEN 'Miércoles' WHEN 4 THEN 'Jueves' WHEN 5 THEN 'Viernes' WHEN 6 THEN 'Sábado' WHEN 7 THEN 'Domingo' END + ' - ' + CAST(Horario_DispMed AS VARCHAR(5))) AS DiayHorario FROM Disponibilidad_Medico");
            DataTable tabla = datos.ObtenerTabla("Disponibilidad_Medico", $"SELECT Id_COD_DispMed, Id_Medico_DispMed, Horario_DispMed FROM Disponibilidad_Medico WHERE DiaSemana_DispMed = {dia}"); 
            return tabla;
        }

        public int AgregarhoraXmedico(int idmedico, int dia, TimeSpan hora)
        {
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@IDMEDICO", idmedico);
            comando.Parameters.AddWithValue("@DIASEMANA", dia);
            comando.Parameters.AddWithValue("@HORA", hora);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spAgregarHorariosMedico");
        }
    }
}
