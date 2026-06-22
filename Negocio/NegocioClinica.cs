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

        public String getIdMedico(String legajo)
        {
            return daoDatos.getIdMedico(legajo);    
        }

        public DataTable getPacientes()
        {
            return daoDatos.getTablaPacientes();
        }

        public DataTable getMedicos()
        {
            return daoDatos.getTablaMedicos();
        }

        public DataTable getBajaMedicos()
        {
            return daoDatos.getTablaBajaMedicos();
        }

        public DataTable getBajaPaciente()
        {
            return daoDatos.getTablaBajaPacientes();
        }

        public DataTable getTurnos()
        {
            return daoDatos.getTablaTurno();
        }

        public String getUsuarios(String usuario, String constrasena)
        {
            return daoDatos.MedicoAdministrador(usuario, constrasena); 
        }

        public DataTable getDropDownListProvincias()
        {
            return daoDatos.getTablaProvincia(); 
        }

        public DataTable getDropDownListLocalidades()
        {
            return daoDatos.getTablaLocalidades(); 
        }

        public DataTable getDropDownListEspecialidad()
        {
            return daoDatos.getTablaEspecialidad(); 
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

            if (daoDatos.ExisteMedico(medicos) == false)
            {
                filasafectadas = daoDatos.AgregarMedico(medicos);
            }

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

            if (daoDatos.ExistePaciente(pacientes) == false)
            {
                Filasafectadas = daoDatos.AgregarPaciente(pacientes);
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

            //if (daoDatos.ExisteUsuario(usuarios) == false)
            //{
            //    FilasAfectadas = daoDatos.AgregarUsuario(usuarios);
            //}

            FilasAfectadas = daoDatos.AgregarUsuario(usuarios);

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

            filasafectadas = daoDatos.AgregarTurnos(turnos);
            return filasafectadas == 1;
        }

        /// DAR DE BAJA
        public Boolean DarBajaMedico(int idMedico)
        {
            Medicos medicos = new Medicos();
            medicos.setIdMedico(idMedico);
            int filasafectadas = daoDatos.DarBajaMedico(medicos);
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
            int filasafectadas = daoDatos.DarBajaPecientes(pacientes);
            if(filasafectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

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
            int filasafecatdas = daoDatos.ModificarMedico(medicos);
            return filasafecatdas == 1; 
        }

        public Boolean CancelarTurnos(int idTurno)
        {
            Turnos turnos = new Turnos();
            turnos.setIdTurno(idTurno);
            int filasafectadas = daoDatos.CancelarTurnos(turnos);
            if(filasafectadas == 1)
            {
                return true;
            }
            else
            {
                return false;  
            }
        }
    }
}
