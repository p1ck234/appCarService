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
            List<int> a = new List<int>();
            a.Add(1);
            a.Add(2);
            a.Add(3);
            a.Add(4);
            a.Add(5);
            cmbCount.ItemsSource = a;
            cmbCount.SelectedIndex = 0;
        }

        private void btnYes_Click(object sender, RoutedEventArgs e)
        {
            ModelBD.BaseModel bd = new ModelBD.BaseModel();
            bd.ProductSales.Load();
            ModelBD.ProductSale bd2 = new ModelBD.ProductSale();
            
            bd2.ID = bd.ProductSales.Local.Count + 1;
            bd2.SaleDate = DateTime.Now;
            bd2.ProductID = TovarPage.selectEntites.ID;
            bd2.Quantity = (int)cmbCount.SelectedItem;
            try
            {
                bd.ProductSales.Add(bd2);
                bd.SaveChanges();
                AvtorizationWindow.Inf("Данные сохранены!");
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void btnNo_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
