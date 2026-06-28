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
    public class DaoPacientes
    {
        AccesoDatos datos = new AccesoDatos();
        public DaoPacientes()
        {

        }
        public DataTable getTablaPacientes()
        {
            DataTable tabla = datos.ObtenerTabla("Pacientes", "SELECT Id_Paciente_Paci, DNI_Paci, Id_Provincia_Paci, Id_Localidad_Paci, Descripcion_Prov, Nacionalidad_Paci, FechaNacimiento_Paci, Descripcion_Local, Nombre_Paci, Apellido_Paci, Sexo_Paci, Direccion_Paci, CorreoElectronico_Paci, Telefono_Paci FROM Pacientes " +
                "INNER JOIN Provincias ON Id_Provincia_Paci = Id_Provincia_Prov " +
                "INNER JOIN Localidades ON Id_Localidad_Paci = Id_Localidad_Local WHERE Activo_Paci = 1");
            return tabla;
        }
        public DataTable getTablaPacientes(String consulta)
        {
            DataTable tabla = datos.ObtenerTabla("Pacientes", "SELECT Id_Paciente_Paci, DNI_Paci, Id_Provincia_Paci, Id_Localidad_Paci, Descripcion_Prov, Nacionalidad_Paci, FechaNacimiento_Paci, Descripcion_Local, Nombre_Paci, Apellido_Paci, Sexo_Paci, Direccion_Paci, CorreoElectronico_Paci, Telefono_Paci FROM Pacientes " +
                "INNER JOIN Provincias ON Id_Provincia_Paci = Id_Provincia_Prov " +
                "INNER JOIN Localidades ON Id_Localidad_Paci = Id_Localidad_Local WHERE Activo_Paci = 1 " + consulta);
            return tabla;
        }
        public DataTable getTablaAltaPacientes()
        {
            DataTable tabla = datos.ObtenerTabla("Pacientes", "SELECT Id_Paciente_Paci,DNI_Paci, Nombre_Paci, Apellido_Paci, Sexo_Paci, Nacionalidad_Paci, FechaNacimiento_Paci, Direccion_Paci, CorreoElectronico_Paci, Telefono_Paci, Activo_Paci FROM Pacientes WHERE Activo_Paci = 1");
            return tabla;
        }
        public DataTable getTablaBajaPacientes()
        {
            DataTable tabla = datos.ObtenerTabla("Pacientes", "SELECT Id_Paciente_Paci,DNI_Paci, Nombre_Paci, Apellido_Paci, Sexo_Paci, Nacionalidad_Paci, FechaNacimiento_Paci, Direccion_Paci, CorreoElectronico_Paci, Telefono_Paci, Activo_Paci FROM Pacientes WHERE Activo_Paci = 0");
            return tabla;
        }
        public Boolean ExistePaciente(Pacientes paciente)
        {
            String consulta = "SELECT * FROM Pacientes WHERE DNI_Paci = @DNI";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@DNI", paciente.getDniPaciente());
            return datos.Existe(comando, consulta);
        }
        public int AgregarPaciente(Pacientes pacientes)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosPacientesAgregar(ref comando, pacientes);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spAgregarPaciente");
        }

        public int ModificarPaciente(Pacientes paciente)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosPacientesModificar(ref comando, paciente);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spModificarPaciente");
        }

        public int DarBajaPecientes(Pacientes pacientes)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosPacientesDarBaja(ref comando, pacientes);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spBajaPaciente");
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

            sqlParameter = comando.Parameters.Add("@IDPACIENTE", SqlDbType.Int);
            sqlParameter.Value = pacientes.getIdPaciente();

            //ID PROVINCIA

            sqlParameter = comando.Parameters.Add("@IDPROVINCIA", SqlDbType.Int);
            sqlParameter.Value = pacientes.getIdProvincia();

            //ID LOCALIDAD

            sqlParameter = comando.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            sqlParameter.Value = pacientes.getIdLocalidad();

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
    }
}
