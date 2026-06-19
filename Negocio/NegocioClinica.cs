using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioClinica
    {
        DaoDatos daoDatos = new DaoDatos();
        public NegocioClinica()
        {
            // Constructor Vacío
        }

        public DataTable getPacientes()
        {
            return daoDatos.getTablaPacientes();
        }

        public DataTable getMedicos()
        {
            return daoDatos.getTablaMedicos();
        }

        public DataTable getTurnos()
        {
            return daoDatos.getTablaTurno();
        }

        public String getUsuarios(String usuario, String constrasena)
        {
            return daoDatos.MedicoAdministrador(usuario, constrasena); 
        }

        public Boolean AgregarMedico(String legajo, int idprovincia, int idlocalidad, int idespecialidad, int dni, String nombre, String apellido, String sexo, String nacionalidad, DateTime fecha, String direccion, String mail,  String telefono)
        {
            int filasafectadas = 0;

            Medicos medicos = new Medicos();
            medicos.setLegajoMedico(legajo);
            medicos.setIdProvincia(idprovincia);
            medicos.setIdLocalidad(idlocalidad);
            medicos.setIdEspecialidad(idespecialidad);
            medicos.setDNIMedico(dni);
            medicos.setNombreMedico(nombre);
            medicos.setApellidoMedico(apellido);
            medicos.setSexoMedico(sexo); 
            medicos.setNacionalidadMedico(nacionalidad);
            medicos.setFechaNacimientoMedico(fecha); 
            medicos.setDireccionMedico(direccion);
            medicos.setEmailMedico(mail); 
            medicos.setTelefonoMedico(telefono);

            if (daoDatos.ExisteMedico(medicos) == false)
            {
                filasafectadas = daoDatos.AgregarMedico(medicos); 
            }

            return filasafectadas == 1; 
        }
    }
}
