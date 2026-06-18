using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Pacientes
    {
        private int IdPaciente;
        private int IdProvincia;
        private int IdLocalidad;
        private int DNIPaciente;
        private String NombrePaciente;
        private String ApellidoPaciente;
        private String SexoPaciente;
        private String NacionalidadPaciente;
        private DateTime FechaNacimientoPaciente;
        private String DireccionPaciente;
        private String CorreoElectronicoPaciente;
        private String TelefonoPaciente;
        private Boolean ActivoPaciente;

        public Pacientes()
        {
            //CONSTRUCTOR VACIO
        }

        public void setIdPaciente(int idPaciente)
        {
            IdPaciente = idPaciente;
        }

        public int getIdPaciente()
        {
            return IdPaciente; 
        }

        public void setIdProvincia(int idProvincia)
        {
            IdProvincia = idProvincia;
        }

        public int getIdProvincia()
        {
            return IdProvincia; 
        }

        public void setIdLocalidad(int idLocalidad)
        {
           IdLocalidad = idLocalidad;
        }

        public int getIdLocalidad()
        {
            return IdLocalidad;
        }

        public void setDniPaciente(int dniPaciente)
        {
            DNIPaciente = dniPaciente;
        }

        public int getDniPaciente()
        {
            return DNIPaciente;
        }

        public void setNombrePaciente(String nombrePaciente)
        {
            NombrePaciente = nombrePaciente;
        }

        public String getNombrePaciente()
        {
            return NombrePaciente;
        }

        public void setApellidoPaciente(String apellidoPaciente)
        {
            ApellidoPaciente = apellidoPaciente;
        }

        public String getApellidoPaciente()
        {
            return ApellidoPaciente;
        }

        public void setSexoPaciente(String sexoPaciente)
        {
            SexoPaciente = sexoPaciente; 
        }

        public String getSexoPaciente()
        {
            return SexoPaciente;
        }

        public void setNacionalidadPaciente(String nacionalidadPaciente)
        {
            NacionalidadPaciente = nacionalidadPaciente; 
        }

        public String getNacionalidadPaciente()
        {
            return NacionalidadPaciente; 
        }

        public void setFechaNacimientoPaciente(DateTime fechaNacimientoPaciente)
        {
            FechaNacimientoPaciente = fechaNacimientoPaciente; 
        }
        public DateTime getFechaNacionalidadPaciente()
        {
            return FechaNacimientoPaciente; 
        }

        public void setDireccionPaciente(String direccionPaciente) 
        {
            DireccionPaciente = direccionPaciente; 
        }

        public String getDireccionPaciente()
        {
            return DireccionPaciente;
        }

        public void setCorreoElectronicoPaciente(String correoElectronicoPaciente)
        {
            CorreoElectronicoPaciente = correoElectronicoPaciente; 
        }

        public String getCorreoElectronicoPaciente()
        {
            return CorreoElectronicoPaciente; 
        }

        public void setTelefonoPaciente(String telefonoPaciente)
        {
            TelefonoPaciente = telefonoPaciente;
        }

        public String getTelefonoPaciente()
        {
            return TelefonoPaciente;
        }

        public void setActivoPaciente(Boolean activoPaciente)
        {
            ActivoPaciente = activoPaciente;
        }

        public Boolean getActivoPaciente()
        {
            return ActivoPaciente;
        }
    }
}

