using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioPacientes
    {
        DaoPacientes daoPacientes = new DaoPacientes();

        public NegocioPacientes()
        {

        }
        public DataTable getPacientes()
        {
            return daoPacientes.getTablaPacientes();
        }
        public DataTable getPacientes(String consulta)
        {
            return daoPacientes.getTablaPacientes(consulta);
        }
        public DataTable getActivosPaciente()
        {
            return daoPacientes.getTablaAltaPacientes();
        }
        public DataTable getInactivosPaciente()
        {
            return daoPacientes.getTablaBajaPacientes();
        }
        public Boolean AgregarPacientes(int dni, String nombre, String apellido, String sexo, String nacionalidad, DateTime fecha, String direccion, int idprovincia, int idlocalidad, String mail, String telefono)
        {
            int Filasafectadas = 0;

            Pacientes pacientes = new Pacientes();
            pacientes.setDniPaciente(dni);
            pacientes.setNombrePaciente(nombre);
            pacientes.setApellidoPaciente(apellido);
            pacientes.setSexoPaciente(sexo);
            pacientes.setNacionalidadPaciente(nacionalidad);
            pacientes.setFechaNacimientoPaciente(fecha);
            pacientes.setDireccionPaciente(direccion);
            pacientes.setIdProvincia(idprovincia);
            pacientes.setIdLocalidad(idlocalidad);
            pacientes.setCorreoElectronicoPaciente(mail);
            pacientes.setTelefonoPaciente(telefono);

            if (daoPacientes.ExistePaciente(pacientes) == false)
            {
                Filasafectadas = daoPacientes.AgregarPaciente(pacientes);
            }

            return Filasafectadas == 1;
        }
        public Boolean DarBajaPacientes(int idPaciente)
        {
            Pacientes pacientes = new Pacientes();
            pacientes.setIdPaciente(idPaciente);
            int filasafectadas = daoPacientes.DarBajaPecientes(pacientes);
            if (filasafectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public Boolean ModificarPaciente(int idpaciente, int idprovincia, int idlocalidad, String nombre, String apellido, String sexo, String nacionalidad, DateTime fechanacimiento, String direccion, String email, String telefono)
        {
            Pacientes Paciente = new Pacientes();
            Paciente.setIdPaciente(idpaciente);
            Paciente.setIdProvincia(idprovincia);
            Paciente.setIdLocalidad(idlocalidad);
            Paciente.setNombrePaciente(nombre);
            Paciente.setApellidoPaciente(apellido);
            Paciente.setSexoPaciente(sexo);
            Paciente.setNacionalidadPaciente(nacionalidad);
            Paciente.setFechaNacimientoPaciente(fechanacimiento);
            Paciente.setDireccionPaciente(direccion);
            Paciente.setCorreoElectronicoPaciente(email);
            Paciente.setTelefonoPaciente(telefono);
            int filasafecatdas = daoPacientes.ModificarPaciente(Paciente);
            return filasafecatdas == 1;
        }
    }
}
