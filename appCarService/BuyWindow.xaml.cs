using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace appCarService
{
    /// <summary>
    /// Interaction logic for BuyWindow.xaml
    /// </summary>
    public partial class BuyWindow : Window
    {
        public BuyWindow()
        {
            InitializeComponent();
            tbBuy.Text += "\"" + TovarPage.selectEntites.Title + "\"" + "?";
        }

        private void btnYes_Click(object sender, RoutedEventArgs e)
        {
            ModelBD.BaseModel bd = new ModelBD.BaseModel();
            bd.ProductSales.Load();
            ModelBD.ProductSale bd2 = new ModelBD.ProductSale();
            
            bd2.ID = bd.ProductSales.Local.Count + 1;
            bd2.SaleDate = DateTime.Now;
            bd2.ProductID = TovarPage.selectEntites.ID;
            bd2.Quantity = 1;
            bd.ProductSales.Add(bd2);
            bd.SaveChanges();
        }

        private void btnNo_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
