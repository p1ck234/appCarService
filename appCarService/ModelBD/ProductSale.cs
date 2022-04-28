namespace appCarService.ModelBD
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductSale")]
    public partial class ProductSale
    {
        public int ID { get; set; }

        public DateTime SaleDate { get; set; }

        public int ProductID { get; set; }

        public int Quantity { get; set; }

        public int? ClientSeviceID { get; set; }
    }
}
