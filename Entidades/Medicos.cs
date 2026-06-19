using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Medicos
    {
        private int IdMedico;
        private String LegajoMedico;
        private int IdProvincia;
        private int IdLocalidad;
        private int IdEspecialidad;
        private int DNIMedico;
        private String NombreMedico;
        private String ApellidoMedico;
        private String SexoMedico;
        private String NacionalidadMedico; 
        private DateTime fechaNacimientoMedico;
        private String DireccionMedico;
        private String EmailMedico;
        private String TelefonoMedico;
        private Boolean ActivoMedico;

        public Medicos()
        {
            /// Constructor vacio
        }

        public int getIdMedico()
        {
            return IdMedico;
        }

        public void setIdMedico(int idMedico)
        {
            IdMedico = idMedico;
        }
        
        public String getLegajoMedico()
        {
            return LegajoMedico;
        }

        public void setLegajoMedico(String legajoMedico)
        {
           LegajoMedico = legajoMedico;
        }

        public int getIdProvincia()
        {
            return IdProvincia;
        }

        public void setIdProvincia(int idProvincia)
        {
            IdProvincia = idProvincia;
        }

        public int getIdLocalidad()
        {
            return IdLocalidad;
        }

        public void setIdLocalidad(int idLocalidad)
        {
            IdLocalidad = idLocalidad;
        }

        public int getIdEspecialidad()
        {
            return IdEspecialidad;
        }

        public void setIdEspecialidad(int idEspecialidad)
        {
            IdEspecialidad = idEspecialidad;
        }

        public int getDNIMedico()
        {
            return DNIMedico;
        }

        public void setDNIMedico(int dNIMedico)
        {
            DNIMedico = dNIMedico;
        }

        public String getNombreMedico()
        {
            return NombreMedico;
        }

       public void setNombreMedico(String nombreMedico)
        {
            NombreMedico = nombreMedico;
        }

        public String getApellidoMedico()
        {
            return ApellidoMedico;
        }

        public void setApellidoMedico(String apellidoMedico)
        {
            ApellidoMedico = apellidoMedico;
        }

        public String getSexoMedico()
        {
            return SexoMedico;
        }

        public void setSexoMedico(String sexoMedico)
        {
            SexoMedico = sexoMedico;
        }

        public DateTime getFechaNacimientoMedico()
        {
            return fechaNacimientoMedico;
        }
        public void setFechaNacimientoMedico(DateTime fechaNacimientoMedico)
        {
            this.fechaNacimientoMedico = fechaNacimientoMedico;
        }

        public void setNacionalidadMedico(String nacionalidadMedico)
        {
            NacionalidadMedico = nacionalidadMedico; 
        }

        public String getNacionalidadMedico()
        {
            return NacionalidadMedico;
        }

        public String getDireccionMedico()
        {
            return DireccionMedico;
        }

        public void setDireccionMedico(String direccionMedico)
        {
            DireccionMedico = direccionMedico;
        }

        public String getEmailMedico()
        {
            return EmailMedico;
        }

        public void setEmailMedico(String emailMedico)
        {
            EmailMedico = emailMedico;
        }

        public String getTelefonoMedico()
        {
            return TelefonoMedico;
        }

        public void setTelefonoMedico(String telefonoMedico)
        {
            TelefonoMedico = telefonoMedico;
        }

        public Boolean getActivoMedico()
        {
            return ActivoMedico;
        }

        public void setActivoMedico(Boolean activo)
        {
            ActivoMedico = activo;
        }
    }
}
