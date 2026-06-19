using Entidades;
using System;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class DaoDatos
    {
        AccesoDatos datos = new AccesoDatos();
        public DaoDatos() 
        {
            /// Constructor vacio
        }

        public DataTable getTablaMedicos()
        {
            DataTable tabla = datos.ObtenerTabla("Medicos", "SELECT Id_Medico_Med, Legajo_Med, DNI_Med, Nombre_Med, Apellido_Med, CorreoElectronico_Med, Telefono_Med FROM Medicos");
            return tabla;
        }

        public DataTable getTablaPacientes()
        {
            DataTable tabla = datos.ObtenerTabla("Pacientes", "SELECT Id_Paciente_Paci, DNI_Paci, Nombre_Paci, Apellido_Paci, Sexo_Paci, Direccion_Paci, CorreoElectronico_Paci, Telefono_Paci FROM Pacientes");
            return tabla;
        }

        public DataTable getTablaTurno()
        {
            DataTable tabla = datos.ObtenerTabla("Turnos", "SELECT Id_Turno_Tur, Id_Medico_Tur, Id_Especialidad_Tur, Id_Paciente_Tur, Id_EstadPaciente_Paci, Id_EstadoTurno_Tur, Fecha_Tur, Horario_Tur, Descripcion_Tur, Activo_Tur FROM Turnos");
            return tabla; 
        }

        public String MedicoAdministrador(String usuario, String constrasena)
        {
            String consulta = "SELECT Username_Usu, Password_Usu, Id_Administrador_Usu, Id_Medico_Usu, CASE WHEN Id_Administrador_Usu IS NOT NULL THEN 'Administrador' WHEN Id_Medico_Usu IS NOT NULL THEN 'Medico' END AS Tipousuario FROM Usuarios WHERE Username_Usu = @USUARIO AND Password_Usu = @PASSWORD AND Activo_Usu = 1";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@USUARIO", usuario.ToString().Trim());
            comando.Parameters.AddWithValue("@PASSWORD", constrasena.ToString().Trim());
            return datos.LoginMedicoAdministrador(comando, consulta);
        }

        public Boolean ExisteMedico(Medicos medicos)
        {
            string ConsultaSQL = "SELECT * FROM Medicos WHERE Id_Medico_Med = " + medicos.getIdMedico();
            return datos.Existe(ConsultaSQL);
        }

        public Boolean ExistePaciente(Pacientes paciente)
        {
            return datos.Existe("SELECT * FROM Pacientes WHERE Id_Paciente_Paci = " + paciente.getIdPaciente());
        }

        public Boolean ExisteTurno(Turnos tunro)
        {
            return datos.Existe("SELECT * FROM Turnos WHERE Id_Turno_Tur = " + tunro.getIdTurno());
        }

        public int AgregarMedico(Medicos medico)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicosAgregar(ref comando, medico);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spAgregarMedico");
        }

        public void ArmarParametrosMedicosAgregar(ref SqlCommand comando, Medicos medicos)
        {
            SqlParameter parametros = new SqlParameter();
            //LEGAJO
            parametros = comando.Parameters.Add("@LEGAJO", SqlDbType.NVarChar);
            parametros.Value = medicos.getLegajoMedico();
            //ID PROVINCIA
            parametros = comando.Parameters.Add("@IDPROVINCIA", SqlDbType.Int);
            parametros.Value = medicos.getIdProvincia();
            //ID LOCALIDAD
            parametros = comando.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            parametros.Value = medicos.getIdLocalidad();
            //ID ESPECIALIDAD
            parametros = comando.Parameters.Add("@IDESPECIALIDAD", SqlDbType.Int);
            parametros.Value = medicos.getIdEspecialidad();
            //DNI
            parametros = comando.Parameters.Add("@DNI", SqlDbType.Int);
            parametros.Value = medicos.getDNIMedico();
            //NOMBRE MEDICO
            parametros = comando.Parameters.Add("@NOMBRE", SqlDbType.NVarChar);
            parametros.Value = medicos.getNombreMedico();
            //APELLIDO MEDICO
            parametros = comando.Parameters.Add("@APELLIDO", SqlDbType.NVarChar);
            parametros.Value = medicos.getApellidoMedico();
            //SEXO MEDICO
            parametros = comando.Parameters.Add("@SEXO", SqlDbType.NVarChar);
            parametros.Value = medicos.getSexoMedico();
            //NACIONALIDAD MEDICO
            parametros = comando.Parameters.Add("@NACIONALIDAD", SqlDbType.NVarChar);
            parametros.Value = medicos.getNacionalidadMedico(); 
            //FECHA NACIMIENTO MEDICO
            parametros = comando.Parameters.Add("@FECHANACIMIENTO", SqlDbType.Date);
            parametros.Value = medicos.getFechaNacimientoMedico();
            //DIRECCION MEDICO
            parametros = comando.Parameters.Add("@DIRECCION", SqlDbType.NVarChar);
            parametros.Value = medicos.getDireccionMedico();
            //EMAIL MEDICO
            parametros = comando.Parameters.Add("@EMAIL", SqlDbType.NVarChar);
            parametros.Value = medicos.getEmailMedico();
            //TELEFONO MEDICO
            parametros = comando.Parameters.Add("@TELEFONO", SqlDbType.NVarChar);
            parametros.Value = medicos.getTelefonoMedico();
        }

        public void ArmarParametrosMedicosModificar(ref SqlCommand comando, Medicos medicos)
        {
            SqlParameter sqlParameter = new SqlParameter();
            //ID PROVINCIA

            sqlParameter = comando.Parameters.Add("@IDPROVINCIA",SqlDbType.Int);
            sqlParameter.Value = medicos.getIdProvincia();

            //ID LOCALIDAD

            sqlParameter = comando.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            sqlParameter.Value = medicos.getIdLocalidad();

            //ID ESPECIALIDAD

            sqlParameter = comando.Parameters.Add("@IDESPECIALIDAD", SqlDbType.Int);
            sqlParameter.Value = medicos.getIdEspecialidad();

            //DNI

            sqlParameter = comando.Parameters.Add("@DNI", SqlDbType.Int);
            sqlParameter.Value = medicos.getDNIMedico();

            //NOMBRE MEDICO

            sqlParameter = comando.Parameters.Add("@NOMBRE", SqlDbType.NVarChar);
            sqlParameter.Value = medicos.getNombreMedico();

            //APELLIDO MEDICO

            sqlParameter = comando.Parameters.Add("@APELLIDO", SqlDbType.NVarChar);
            sqlParameter.Value = medicos.getApellidoMedico();

            //SEXO MEDICO

            sqlParameter = comando.Parameters.Add("@SEXO", SqlDbType.NVarChar);
            sqlParameter.Value = medicos.getSexoMedico();

            //NACIONALIDAD MEDICO

            sqlParameter = comando.Parameters.Add("@NACIONALIDAD", SqlDbType.NVarChar);
            sqlParameter.Value = medicos.getNacionalidadMedico();

            //FECHA NACIMIENTO MEDICO
            sqlParameter = comando.Parameters.Add("@FECHANACIMIENTO", SqlDbType.Date);
            sqlParameter.Value = medicos.getFechaNacimientoMedico();

            //DIRECCION MEDICO

            sqlParameter = comando.Parameters.Add("@DIRECCION", SqlDbType.NVarChar);
            sqlParameter.Value = medicos.getDireccionMedico();

            //EMAIL MEDICO

            sqlParameter = comando.Parameters.Add("@EMAIL", SqlDbType.NVarChar);
            sqlParameter.Value = medicos.getEmailMedico();

            //TELEFONO MEDICO

            sqlParameter = comando.Parameters.Add("@TELEFONO", SqlDbType.NVarChar);
            sqlParameter.Value = medicos.getTelefonoMedico();

        }
        public void ArmarParametrosMedicosDarBaja(ref SqlCommand comando, Medicos medicos)
        {
            SqlParameter parametros = new SqlParameter();

            parametros = comando.Parameters.Add("@IDMEDICO", SqlDbType.Int);
            parametros.Value = medicos.getIdMedico();
        }

        public void ArmarParametrosPacientesAgregar(ref SqlCommand comando, Pacientes pacientes)
        {
            SqlParameter parametros = new SqlParameter();
            //ID PROVINCIA
            parametros = comando.Parameters.Add("@IDPROVINCIA", SqlDbType.Int);
            parametros.Value = pacientes.getIdProvincia();
            //ID LOCALIDAD
            parametros = comando.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            parametros.Value = pacientes.getIdLocalidad();
            //DNI
            parametros = comando.Parameters.Add("@DNI", SqlDbType.Int);
            parametros.Value = pacientes.getDniPaciente(); 
            //NOMBRE PACIENTE
            parametros = comando.Parameters.Add("@NOMBRE", SqlDbType.NVarChar);
            parametros.Value = pacientes.getNombrePaciente(); 
            //APELLIDO PACIENTE
            parametros = comando.Parameters.Add("@APELLIDO", SqlDbType.NVarChar);
            parametros.Value = pacientes.getApellidoPaciente(); 
            //SEXO PACIENTE
            parametros = comando.Parameters.Add("@SEXO", SqlDbType.NVarChar);
            parametros.Value = pacientes.getSexoPaciente();
            //NACIONALIDAD PACIENTE
            parametros = comando.Parameters.Add("@NACIONALIDAD", SqlDbType.NVarChar);
            parametros.Value = pacientes.getNacionalidadPaciente(); 
            //FECHA NACIMIENTO PACIENTE
            parametros = comando.Parameters.Add("@FECHANACIMIENTO", SqlDbType.Date);
            parametros.Value = pacientes.getFechaNacionalidadPaciente(); 
            //DIRECCION PACIENTE
            parametros = comando.Parameters.Add("@DIRECCION", SqlDbType.NVarChar);
            parametros.Value = pacientes.getDireccionPaciente(); 
            //EMAIL PACIENTE
            parametros = comando.Parameters.Add("@EMAIL", SqlDbType.NVarChar);
            parametros.Value = pacientes.getCorreoElectronicoPaciente(); 
            //TELEFONO PACIENTE
            parametros = comando.Parameters.Add("@TELEFONO", SqlDbType.NVarChar);
            parametros.Value = pacientes.getTelefonoPaciente(); 
        }

        public void ArmarParametrosPacientesModificar(ref SqlCommand comando, Pacientes pacientes)
        {
            SqlParameter sqlParameter = new SqlParameter();

            //ID PROVINCIA

            sqlParameter = comando.Parameters.Add("@IDPROVINCIA", SqlDbType.Int);
            sqlParameter.Value = pacientes.getIdProvincia();

            //ID LOCALIDAD

            sqlParameter = comando.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            sqlParameter.Value = pacientes.getIdLocalidad();

            //DNI

            sqlParameter = comando.Parameters.Add("@DNI", SqlDbType.Int);
            sqlParameter.Value = pacientes.getDniPaciente();

            //NOMBRE PACIENTE

            sqlParameter = comando.Parameters.Add("@NOMBRE", SqlDbType.NVarChar);
            sqlParameter.Value = pacientes.getNombrePaciente();

            //APELLIDO PACIENTE

            sqlParameter = comando.Parameters.Add("@APELLIDO", SqlDbType.NVarChar);
            sqlParameter.Value = pacientes.getApellidoPaciente();

            //SEXO PACIENTE

            sqlParameter = comando.Parameters.Add("@SEXO", SqlDbType.NVarChar);
            sqlParameter.Value = pacientes.getSexoPaciente();

            //NACIONALIDAD PACIENTE

            sqlParameter = comando.Parameters.Add("@NACIONALIDAD", SqlDbType.NVarChar);
            sqlParameter.Value = pacientes.getNacionalidadPaciente();

            //FECHA NACIMIENTO PACIENTE

            sqlParameter = comando.Parameters.Add("@FECHANACIMIENTO", SqlDbType.Date);
            sqlParameter.Value = pacientes.getFechaNacionalidadPaciente();

            //DIRECCION PACIENTE

            sqlParameter = comando.Parameters.Add("@DIRECCION", SqlDbType.NVarChar);
            sqlParameter.Value = pacientes.getDireccionPaciente();

            //EMAIL PACIENTE

            sqlParameter = comando.Parameters.Add("@EMAIL", SqlDbType.NVarChar);
            sqlParameter.Value = pacientes.getCorreoElectronicoPaciente();

            //TELEFONO PACIENTE

            sqlParameter = comando.Parameters.Add("@TELEFONO", SqlDbType.NVarChar);
            sqlParameter.Value = pacientes.getTelefonoPaciente();
        }
        public void ArmarParametrosPacientesDarBaja(ref SqlCommand comando, Pacientes pacientes)
        {
            SqlParameter parametros = new SqlParameter();

            parametros = comando.Parameters.Add("@IDPACIENTE", SqlDbType.Int);
            parametros.Value = pacientes.getIdPaciente(); 
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