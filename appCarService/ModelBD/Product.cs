namespace appCarService.ModelBD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(100)]
        public string Title { get; set; }

        [Key]
        [Column(Order = 2, TypeName = "money")]
        public decimal Cost { get; set; }

        public string Description { get; set; }

        [StringLength(1000)]
        public string MainImagePath { get; set; }

        [Key]
        [Column(Order = 3)]
        public bool isActive { get; set; }

        public int? ManufactureID { get; set; }

        public string ActualText
        {
            get
            {
                return isActive ? "Актуально" : "Неактуально";
            }
        }
    }
}
