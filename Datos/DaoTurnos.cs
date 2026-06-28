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
    public class DaoTurnos
    {
        AccesoDatos datos = new AccesoDatos();

        public DaoTurnos()
        {

        }

        public DataTable getTablaTurno()
        {
            DataTable tabla = datos.ObtenerTabla("Turnos", "SELECT Id_Turno_Tur, Id_Medico_Tur, Id_Especialidad_Tur, Id_Paciente_Tur, Id_EstadoPaciente_Tur, Id_EstadoTurno_Tur, Fecha_Tur, Horario_Tur, Descripcion_Tur, Activo_Tur FROM Turnos");
            return tabla;
        }

        public int AgregarTurnos(Turnos turnos)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosTurnosAgregar(ref comando, turnos);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spAgregarTurnos");
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
            parametros.Value = turnos.getIdEstadoPacienteTurno();
            //ID ESTADO TURNO
            parametros = comando.Parameters.Add("@IDESTADOTURNO", SqlDbType.Int);
            parametros.Value = turnos.getIdEstadoTurno();
            //FECHA TURNO
            parametros = comando.Parameters.Add("@FECHA", SqlDbType.Date);
            parametros.Value = turnos.getFechaTurno();
            //HORARIO TURNO
            parametros = comando.Parameters.Add("@HORARIO", SqlDbType.Time);
            parametros.Value = turnos.getHorarioTurno();
            //DESCIPCION TURNO
            parametros = comando.Parameters.Add("@DESCIPCION", SqlDbType.NVarChar);
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
