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
            DataTable tabla = datos.ObtenerTabla("Disponibilidad_Medico", $"SELECT Id_COD_DispMed, Id_Medico_DispMed, Horario_DispMed FROM Disponibilidad_Medico WHERE DiaSemana_DispMed = {dia} ORDER BY Horario_DispMed"); 
            return tabla;
        }

        public Boolean ExisteDisponibilidadMedico(DisponibilidadMedico disponibilidadMedico)
        {
            String consulta = "SELECT * FROM Disponibilidad_Medico WHERE Id_Medico_DispMed = @IDMEDICO AND DiaSemana_DispMed = @DIASEMANA AND Horario_DispMed = @HORAS";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@IDMEDICO", disponibilidadMedico.getIdMedico());
            comando.Parameters.AddWithValue("@DIASEMANA", disponibilidadMedico.getDiaSemana());
            comando.Parameters.AddWithValue("@HORAS", disponibilidadMedico.getHorario()); 
            return datos.Existe(comando, consulta);
        }

        public int AgregarDisponibilidadMedico(DisponibilidadMedico disponibilidadMedico)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosDisponibilidadMedico(ref comando, disponibilidadMedico);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spAgregarHorariosMedico");
        }

        public void ArmarParametrosDisponibilidadMedico(ref SqlCommand comando, DisponibilidadMedico disponibilidadMedico)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = comando.Parameters.Add("@IDMEDICO", SqlDbType.Int);
            parametros.Value = disponibilidadMedico.getIdMedico();

            parametros = comando.Parameters.Add("@DIASEMANA", SqlDbType.Int);
            parametros.Value = disponibilidadMedico.getDiaSemana();

            parametros = comando.Parameters.Add("@HORA", SqlDbType.Time);
            parametros.Value = disponibilidadMedico.getHorario();
        }
    }
}
