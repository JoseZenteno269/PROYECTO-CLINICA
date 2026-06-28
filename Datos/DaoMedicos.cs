using Entidades;
using System;
using System.CodeDom;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class DaoMedicos
    {
        AccesoDatos datos = new AccesoDatos();
        public DaoMedicos()
        {
            /// Constructor vacio
        }

        public int? getCantidadMedicos()
        {
            return datos.EjecutarEscalarInt("SELECT COUNT(*) FROM Medicos");
        }
        public int? getIdMedico(String legajo)
        {
            String consulta = "SELECT Id_Medico_Med FROM Medicos WHERE Legajo_Med = @LEGAJO";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@LEGAJO", legajo);
            return datos.EjecutarEscalarInt(comando, consulta);
        }
        public String getLegajoMedico(String usuario)
        {
            String consulta = "SELECT Legajo_Med FROM Medicos INNER JOIN Usuarios ON Id_Medico_Med = Id_Medico_Usu WHERE Username_usu = @USERNAME";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@USERNAME", usuario);
            return datos.EjecutarEscalarString(comando, consulta);
        }
        public DataTable getTablaMedicos()
        {
            DataTable tabla = datos.ObtenerTabla("Medicos", "SELECT Id_Medico_Med, Legajo_Med, Id_Provincia_Med, Descripcion_Prov, Id_Localidad_Med, Descripcion_Local, Id_Especialidad_Med, Nombre_Espe, DNI_Med, Nombre_Med, Apellido_Med, Sexo_Med, Nacionalidad_Med, FechaNacimiento_Med, Direccion_Med, CorreoElectronico_Med, Telefono_Med FROM Medicos " +
                "INNER JOIN Provincias ON Id_Provincia_Med = Id_Provincia_Prov " +
                "INNER JOIN Localidades  ON Id_Localidad_Med = Id_Localidad_Local " +
                "INNER JOIN Especialidad ON Id_Especialidad_Med = Id_Especialidad_Espe WHERE Activo_Med = 1"); 
            return tabla;
        }

        public DataTable getTablaMedicos(String consulta)
        {
            DataTable tabla = datos.ObtenerTabla("Medicos", "SELECT Id_Medico_Med, Legajo_Med, Id_Provincia_Med, Descripcion_Prov, Id_Localidad_Med, Descripcion_Local, Id_Especialidad_Med, Nombre_Espe, DNI_Med, Nombre_Med, Apellido_Med, Sexo_Med, Nacionalidad_Med, FechaNacimiento_Med, Direccion_Med, CorreoElectronico_Med, Telefono_Med FROM Medicos " +
                "INNER JOIN Provincias ON Id_Provincia_Med = Id_Provincia_Prov " +
                "INNER JOIN Localidades ON Id_Localidad_Med = Id_Localidad_Local " +
                "INNER JOIN Especialidad ON Id_Especialidad_Med = Id_Especialidad_Espe WHERE Activo_Med = 1 " + consulta);
            return tabla;
        }

        public DataTable getTablaAltaMedicos()
        {
            DataTable tabla = datos.ObtenerTabla("Medicos", "SELECT Legajo_Med, Id_Medico_Med, DNI_Med, Nombre_Med, Apellido_Med, FechaNacimiento_Med, CorreoElectronico_Med, Telefono_Med, Id_Especialidad_Med, Nombre_Espe, Activo_Med FROM Medicos INNER JOIN Especialidad ON Medicos.Id_Especialidad_Med = Especialidad.Id_Especialidad_Espe WHERE Activo_Med = 1");
            return tabla;
        }
        public DataTable getTablaBajaMedicos()
        {
            DataTable tabla = datos.ObtenerTabla("Medicos", "SELECT Legajo_Med, Id_Medico_Med, DNI_Med, Nombre_Med, Apellido_Med, FechaNacimiento_Med, CorreoElectronico_Med, Telefono_Med, Id_Especialidad_Med, Nombre_Espe, Activo_Med FROM Medicos INNER JOIN Especialidad ON Medicos.Id_Especialidad_Med = Especialidad.Id_Especialidad_Espe WHERE Activo_Med = 0");
            return tabla;
        }

        public Boolean ExisteMedico(Medicos medicos)
        {
            String consulta = "SELECT * FROM Medicos WHERE DNI_Med = @DNI";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@DNI", medicos.getDNIMedico()); 
            return datos.Existe(comando, consulta);
        }

        /// Medicos
        public int AgregarMedico(Medicos medico)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicosAgregar(ref comando, medico);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spAgregarMedico");
        }

        public int ModificarMedico(Medicos medicos)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicosModificar(ref comando, medicos);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spModificarMedicos");
        }

        public int DarBajaMedico(Medicos medico)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicosDarBaja(ref comando, medico);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spBajaMedica");
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

            sqlParameter = comando.Parameters.Add("@IDMEDICO", SqlDbType.Int);
            sqlParameter.Value = medicos.getIdMedico(); 

            //ID PROVINCIA

            sqlParameter = comando.Parameters.Add("@IDPROVINCIA",SqlDbType.Int);
            sqlParameter.Value = medicos.getIdProvincia();

            //ID LOCALIDAD

            sqlParameter = comando.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            sqlParameter.Value = medicos.getIdLocalidad();

            //ID ESPECIALIDAD

            sqlParameter = comando.Parameters.Add("@IDESPECIALIDAD", SqlDbType.Int);
            sqlParameter.Value = medicos.getIdEspecialidad();

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
    }
}