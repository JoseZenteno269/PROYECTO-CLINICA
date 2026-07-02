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

        public String getDiasXMedico(int idmedico)
        {
            String consulta = "SELECT STRING_AGG(CAST(DiaSemana_DispMed AS NVARCHAR(MAX)), ',') FROM ( SELECT DISTINCT DiaSemana_DispMed FROM Disponibilidad_Medico WHERE Id_Medico_DispMed = @IDMEDICO) AS D";
            SqlCommand comando = new SqlCommand(); 
            comando.Parameters.AddWithValue("@IDMEDICO", idmedico);
            return datos.EjecutarEscalarString(comando, consulta);
        }

        public DataTable getTablaDisponibilidadMedica(int dia)
        {
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
