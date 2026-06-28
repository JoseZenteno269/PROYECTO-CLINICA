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
    public class NegocioMedicos
    {
        DaoMedicos daoMedicos = new DaoMedicos();
        public NegocioMedicos()
        {
            // Constructor Vacío
        }

        public int? getCantidadMedicos()
        {
            return daoMedicos.getCantidadMedicos(); 
        }

        public int? getIdMedico(String legajo)
        {
            return daoMedicos.getIdMedico(legajo);    
        }

        public String getLegajoMedico(String usuario)
        {
            return daoMedicos.getLegajoMedico(usuario); 
        }

        public DataTable getMedicos()
        {
            return daoMedicos.getTablaMedicos();
        }

        public DataTable getMedicos(String consulta)
        {
            return daoMedicos.getTablaMedicos(consulta);
        }

        public DataTable getActivosMedicos()
        {
            return daoMedicos.getTablaAltaMedicos();
        }
        public DataTable getInactivosMedicos()
        {
            return daoMedicos.getTablaBajaMedicos();
        }

        /// AGREGAR
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

            if (daoMedicos.ExisteMedico(medicos) == false)
            {
                filasafectadas = daoMedicos.AgregarMedico(medicos);
            }

            return filasafectadas == 1;
        }

        /// DAR DE BAJA
        public Boolean DarBajaMedico(int idMedico)
        {
            Medicos medicos = new Medicos();
            medicos.setIdMedico(idMedico);
            int filasafectadas = daoMedicos.DarBajaMedico(medicos);
            if(filasafectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// Modificar
        public Boolean ModificarMedico(int idMedico, int idprovincia, int idlocalidad, int idespecialidad, String nombre, String apellido, String sexo, String nacionalidad, DateTime fechanacimiento, String direccion, String email, String telefono)
        {
            Medicos medicos = new Medicos();
            medicos.setIdMedico(idMedico);
            medicos.setIdProvincia(idprovincia);
            medicos.setIdLocalidad(idlocalidad);
            medicos.setIdEspecialidad(idespecialidad);
            medicos.setNombreMedico(nombre);
            medicos.setApellidoMedico(apellido);
            medicos.setSexoMedico(sexo);
            medicos.setNacionalidadMedico(nacionalidad); 
            medicos.setFechaNacimientoMedico(fechanacimiento);
            medicos.setDireccionMedico(direccion);
            medicos.setEmailMedico(email);
            medicos.setTelefonoMedico(telefono);
            int filasafecatdas = daoMedicos.ModificarMedico(medicos);
            return filasafecatdas == 1; 
        }

    }
}
