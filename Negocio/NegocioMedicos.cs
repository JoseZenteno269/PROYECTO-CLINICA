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
        public int? getIdAdministrador(String usuario)
        {
            return daoMedicos.getIdAdministrador(usuario); 
        }

        public int? getIdUsuario(String username)
        {
            return daoMedicos.getIdUsuario(username); 
        }

        public DataTable getPacientes()
        {
            return daoMedicos.getTablaPacientes();
        }
        public DataTable getPacientes(String consulta)
        {
            return daoMedicos.getTablaPacientes(consulta);
        }
        public DataTable getActivosPaciente()
        {
            return daoMedicos.getTablaAltaPacientes();
        }
        public DataTable getInactivosPaciente()
        {
            return daoMedicos.getTablaBajaPacientes();
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

        public DataTable getTurnos()
        {
            return daoMedicos.getTablaTurno();
        }

        public String getUsuarios(String usuario, String constrasena)
        {
            return daoMedicos.MedicoAdministrador(usuario, constrasena); 
        }

        public DataTable getDropDownListProvincias()
        {
            return daoMedicos.getTablaProvincia(); 
        }

        public DataTable getDropDownListLocalidades()
        {
            return daoMedicos.getTablaLocalidades(); 
        }
        
        public DataTable getDropDownListDisponibilidadHoraria()
        {
            return daoMedicos.getTablaDisponibilidadMedica();
        }

        public DataTable getDropDownListEspecialidad()
        {
            return daoMedicos.getTablaEspecialidad(); 
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

        public Boolean AgregarHorarios(int idmedico, int dia, TimeSpan hora)
        {
            int filasafectadas = daoMedicos.AgregarhoraXmedico(idmedico, dia, hora);

            return filasafectadas == 1; 
        }

        public Boolean CambioConstrasena(int idusuario, String contrasena)
        {
            int filasafectadas = daoMedicos.CambioContrasena(idusuario, contrasena);
            return filasafectadas == 1;
        }

        public Boolean AgregarPacientes(int dni, String nombre, String apellido, String sexo, String nacionalidad, DateTime fecha, String direccion, int idprovincia, int idlocalidad, String mail,String telefono)
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

            if (daoMedicos.ExistePaciente(pacientes) == false)
            {
                Filasafectadas = daoMedicos.AgregarPaciente(pacientes);
            }

            return Filasafectadas == 1;
        }

        public Boolean AgregarUsuarios(int idmedico, int? idadministrador, String username, String password)
        {
            int FilasAfectadas = 0; 

            Usuarios usuarios = new Usuarios();
            usuarios.setIdMedico(idmedico);
            usuarios.setIdAdministrador(idadministrador); 
            usuarios.setUsername(username);
            usuarios.setPassword(password);

            FilasAfectadas = daoMedicos.AgregarUsuario(usuarios);

            return FilasAfectadas == 1; 
        }

        public Boolean AgregarTurno(int idEspecialidad,int idMedico,DateTime fecha, TimeSpan Hora,int paciente)
        {
            int filasafectadas = 0;

            Turnos turnos = new Turnos();
            turnos.setIdEspecialidadTurno(idEspecialidad);
            turnos.setIdMedicoTurno(idMedico);
            turnos.setFechaTurno(fecha);
            turnos.setIdPacienteTurno(paciente);

            filasafectadas = daoMedicos.AgregarTurnos(turnos);
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

        public Boolean DarBajaPacientes(int idPaciente)
        {
            Pacientes pacientes = new Pacientes();
            pacientes.setIdPaciente(idPaciente);
            int filasafectadas = daoMedicos.DarBajaPecientes(pacientes);
            if(filasafectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public Boolean CancelarTurnos(int idTurno)
        {
            Turnos turnos = new Turnos();
            turnos.setIdTurno(idTurno);
            int filasafectadas = daoMedicos.CancelarTurnos(turnos);
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
            int filasafecatdas = daoMedicos.ModificarPaciente(Paciente);
            return filasafecatdas == 1;
        }

    }
}
