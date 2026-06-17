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
        private string LegajoMedico;
        private int IdProvincia;
        private int IdLocalidad;
        private int IdEspecialidad;
        private int DNIMedico;
        private string NombreMedico;
        private string ApellidoMedico;
        private string SexoMedico;
        private DateTime fechaNacimientoMedico;
        private string DireccionMedico;
        private string EmailMedico;
        private string TelefonoMedico;
        private bool ActivoMedico;

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
        
        public string getLegajoMedico()
        {
            return LegajoMedico;
        }

        public void setLegajoMedico(string legajoMedico)
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

        public string getNombreMedico()
        {
            return NombreMedico;
        }

       public void setNombreMedico(string nombreMedico)
        {
            NombreMedico = nombreMedico;
        }
        public string getApellidoMedico()
        {
            return ApellidoMedico;
        }
        public void setApellidoMedico(string apellidoMedico)
        {
            ApellidoMedico = apellidoMedico;
        }
        public string getSexoMedico()
        {
            return SexoMedico;
        }
        public void setSexoMedico(string sexoMedico)
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
        public string getDireccionMedico()
        {
            return DireccionMedico;
        }
        public void setDireccionMedico(string direccionMedico)
        {
            DireccionMedico = direccionMedico;
        }
        public string getEmailMedico()
        {
            return EmailMedico;
        }
        public void setEmailMedico(string emailMedico)
        {
            EmailMedico = emailMedico;
        }
        public string getTelefonoMedico()
        {
            return TelefonoMedico;
        }
        public void setTelefonoMedico(string telefonoMedico)
        {
            TelefonoMedico = telefonoMedico;
        }
        public bool getActivoMedico()
        {
            return ActivoMedico;
        }
        public void setActivoMedico(bool activo)
        {
            ActivoMedico = activo;
        }
    }
}
