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
    public class DaoDatos
    {
        AccesoDatos ds = new AccesoDatos();
        public DaoDatos() 
        {
            /// Constructor vacio
        }

        public DataTable getTablaMedicos()
        {
            DataTable dt = ds.ObtenerTabla("Medicos", "SELECT Legajo_Med,DNI_Med,Nombre_Med,Apellido_Med,CorreoElectronico_Med,Telefono_Med FROM Medicos");
            return dt;
        }

        public DataTable getTablaPacientes()
        {
            DataTable dt = ds.ObtenerTabla("Pacientes", "SELECT DNI_Paci, Nombre_Paci, Apellido_Paci, Sexo_Paci, Direccion_Paci, CorreoElectronico_Paci,Telefono_Paci FROM Pacientes");
            return dt;
        }

        public Boolean ExisteMedico(Medicos medicos)
        {
            string ConsultaSQL = "SELECT * FROM Medicos WHERE Id_Medico_Med = " + medicos.getIdMedico();
            return ds.Existe(ConsultaSQL);
        }

        public void ArmarParametrosMedicosAgregar(ref SqlCommand command, Medicos medicos)
        {
            SqlParameter sqlParameter = new SqlParameter();
            //ID
            sqlParameter = command.Parameters.Add("@IDMEDICO", SqlDbType.Int);
            sqlParameter.Value = medicos.getIdMedico();
            //LEGAJO
            sqlParameter = command.Parameters.Add("@LEGAJO", SqlDbType.VarChar);
            sqlParameter.Value = medicos.getLegajoMedico();
            //ID PROVINCIA
            sqlParameter = command.Parameters.Add("@IDPROVINCIA", SqlDbType.Int);
            sqlParameter.Value = medicos.getIdProvincia();
            //ID LOCALIDAD
            sqlParameter = command.Parameters.Add("@IDLOCALIDAD", SqlDbType.Int);
            sqlParameter.Value = medicos.getIdLocalidad();
            //ID ESPECIALIDAD
            sqlParameter = command.Parameters.Add("@IDESPECIALIDAD", SqlDbType.Int);
            sqlParameter.Value = medicos.getIdEspecialidad();
            //DNI
            sqlParameter = command.Parameters.Add("@DNI", SqlDbType.Int);
            sqlParameter.Value = medicos.getDNIMedico();
            //NOMBRE MEDICO
            sqlParameter = command.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            sqlParameter.Value = medicos.getNombreMedico();
            //APELLIDO MEDICO
            sqlParameter = command.Parameters.Add("@APELLIDO", SqlDbType.VarChar);
            sqlParameter.Value = medicos.getApellidoMedico();
            //SEXO MEDICO
            sqlParameter = command.Parameters.Add("@SEXO", SqlDbType.VarChar);
            sqlParameter.Value = medicos.getSexoMedico();
            //FECHA NACIMIENTO MEDICO
            sqlParameter = command.Parameters.Add("@FECHANACIMIENTO", SqlDbType.Date);
            sqlParameter.Value = medicos.getFechaNacimientoMedico();
            //DIRECCION MEDICO
            sqlParameter = command.Parameters.Add("@DIRECCION", SqlDbType.VarChar);
            sqlParameter.Value = medicos.getDireccionMedico();
            //EMAIL MEDICO
            sqlParameter = command.Parameters.Add("@EMAIL", SqlDbType.VarChar);
            sqlParameter.Value = medicos.getEmailMedico();
            //TELEFONO MEDICO
            sqlParameter = command.Parameters.Add("@TELEFONO", SqlDbType.VarChar);
            sqlParameter.Value = medicos.getTelefonoMedico();
            //ACTIVO MEDICO
            sqlParameter = command.Parameters.Add("@ACTIVO", SqlDbType.Bit);
            sqlParameter.Value = medicos.getActivoMedico();
        }
        public void ArmarParametrosMedicosDarBaja(ref SqlCommand command, Medicos medicos)
        {
            SqlParameter sqlParameter = new SqlParameter();

            sqlParameter = command.Parameters.Add("@IDMEDICO", SqlDbType.Int);
            sqlParameter.Value = medicos.getIdMedico();


        }
    }
}
