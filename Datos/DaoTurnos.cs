using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoTurnos
    {
        AccesoDatos datos = new AccesoDatos();

        public DaoTurnos()
        {

        }

        public int? CantidadTurnos(String fechainicio, String fechafin)
        {
            String consulta = "SELECT COUNT(*) FROM Turnos WHERE Activo_Tur = 1 AND Fecha_Tur BETWEEN @FECHAINICIO AND @FECHAFIN";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@FECHAINICIO", fechainicio);
            comando.Parameters.AddWithValue("@FECHAFIN", fechafin);
            return datos.EjecutarEscalarInt(comando, consulta);
        }

        public String ConsultaPorcentajePresentes(String fechainicio, String fechafin)
        {
            String consulta = "SELECT (COUNT(CASE WHEN Id_EstadoPaciente_Tur = 1 THEN 1 END) * 100.0) / NULLIF(COUNT(*), 0) AS Porcentaje_presentes FROM Turnos WHERE Activo_Tur = 1 AND Fecha_Tur BETWEEN @FECHAINICIO AND @FECHAFIN";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@FECHAINICIO", fechainicio);
            comando.Parameters.AddWithValue("@FECHAFIN", fechafin);
            return datos.EjecutarEscalarString(comando, consulta);
        }

        public DataTable getTablaTurno()
        {
            DataTable tabla = datos.ObtenerTabla("Turnos", "SELECT Id_Turno_Tur, Id_Medico_Tur, Id_Especialidad_Tur, Id_Paciente_Tur, Id_EstadoPaciente_Tur, Id_EstadoTurno_Tur, Fecha_Tur, Horario_Tur, Descripcion_Tur, Activo_Tur FROM Turnos");
            return tabla;
        }

        public DataTable getTablaCancelarTurno()
        {
            DataTable tabla = datos.ObtenerTabla("Turnos", "SELECT Id_Turno_Tur, (Nombre_Med + ' ' + Apellido_Med) AS [Nombre y Apellido], Nombre_Espe, CONVERT(VARCHAR(5), Horario_Tur, 108) AS Horario, Fecha_Tur, Descripcion_EsTur FROM Turnos INNER JOIN Medicos ON Turnos.Id_Medico_Tur = Medicos.Id_Medico_Med INNER JOIN Especialidad ON Turnos.Id_Especialidad_Tur = Especialidad.Id_Especialidad_Espe INNER JOIN EstadoTurno ON Turnos.Id_EstadoTurno_Tur = EstadoTurno.Id_Estado_EsTur WHERE Activo_Tur = 1");
            return tabla;
        }

        public int AgregarTurnos(Turnos turnos)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosTurnosAgregar(ref comando, turnos);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spAgregarTurnos");
        }

        public int AgregarAsistenciaObservacion(Turnos turnos)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosTurnosAsistenciaObservacion(ref comando, turnos);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spAgregarEstado_Observacion");
        }

        public int CancelarTurnos(Turnos turnos)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosTurnosCancelar(ref comando, turnos);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spCancelarTurnos");
        }

        public Boolean ExisteTurno(Turnos turno)
        {
            String consulta = "SELECT * FROM Turnos WHERE Id_Turno_Tur = @IDTURNO";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@IDTURNO", turno.getIdTurno());
            return datos.Existe(comando, consulta);
        }
        public void ArmarParametrosTurnosAgregar(ref SqlCommand comando, Turnos turnos)
        {
            SqlParameter parametros = new SqlParameter();
            //ID MEDICO
            parametros = comando.Parameters.Add("@IDMEDICO", SqlDbType.Int);
            parametros.Value = turnos.getIdMedicoTurno();
            //ID ESPECIALIDAD
            parametros = comando.Parameters.Add("@IDESPECIALIDAD", SqlDbType.Int);
            parametros.Value = turnos.getIdEspecialidadTurno();
            //ID PACIENTE
            parametros = comando.Parameters.Add("@IDPACIENTE", SqlDbType.Int);
            parametros.Value = turnos.getIdPacienteTurno();
            //ID ESTADO PACIENTE
            parametros = comando.Parameters.Add("@IDESTADOPACIENTE", SqlDbType.Int);
            parametros.Value = (object)turnos.getIdEstadoPacienteTurno() ?? DBNull.Value;
            //ID ESTADO TURNO
            parametros = comando.Parameters.Add("@IDESTADOTURNO", SqlDbType.Int);
            parametros.Value = turnos.getIdEstadoTurno();
            //FECHA TURNO
            parametros = comando.Parameters.Add("@FECHA", SqlDbType.Date);
            parametros.Value = turnos.getFechaTurno();
            //HORARIO TURNO
            parametros = comando.Parameters.Add("@HORARIO", SqlDbType.Time);
            parametros.Value = turnos.getHorarioTurno();
        }

        public void ArmarParametrosTurnosAsistenciaObservacion(ref SqlCommand comando, Turnos turnos)
        {
            SqlParameter parametros = new SqlParameter();
            //ID TURNO
            parametros = comando.Parameters.Add("@IDTURNO", SqlDbType.Int);
            parametros.Value = turnos.getIdTurno();
            //ID ESTADO PACIENTE
            parametros = comando.Parameters.Add("@IDESTADOPACIENTE", SqlDbType.Int);
            parametros.Value = (object)turnos.getIdEstadoPacienteTurno() ?? DBNull.Value;
            //DESCIPCION TURNO
            parametros = comando.Parameters.Add("@DESCRIPCION", SqlDbType.NVarChar);
            parametros.Value = turnos.getDescripcionTurno();
        }

        public void ArmarParametrosTurnosCancelar(ref SqlCommand comando, Turnos turnos)
        {
            SqlParameter parametros = new SqlParameter();

            parametros = comando.Parameters.Add("@IDTURNO", SqlDbType.Int);
            parametros.Value = turnos.getIdTurno();
        }
    }
}
