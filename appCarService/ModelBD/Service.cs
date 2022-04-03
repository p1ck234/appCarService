namespace appCarService.ModelBD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Service
    {
        public int ID { get; set; }

        [Required]
        public string Name { get; set; }

        public long Price { get; set; }
    }
}
