using appCarService.ModelBD;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace appCarService
{
    /// <summary>
    /// Interaction logic for TableTovarPage.xaml
    /// </summary>
    public partial class TableTovarPage : Page
    {
        ModelBD.BaseModel bd = new ModelBD.BaseModel();
        
        public TableTovarPage()
        {
            InitializeComponent();
            bd.ProductSales.Load();
            dtgTovarTable.ItemsSource = bd.ProductSales.Local;
        }
        public static ProductSale selectEntites = new ProductSale();
        private void btnRed_Click(object sender, RoutedEventArgs e)
        {
            bd.ProductSales.Load();
            spRed.Visibility = Visibility.Visible;
            selectEntites = (ProductSale)dtgTovarTable.SelectedItem;
            if (TovarPage.selectEntites != null)
            {
                tbId.Text = selectEntites.ID.ToString();
                tbDateSale.Text = selectEntites.SaleDate.ToString();
                tbIdProd.Text = selectEntites.ProductID.ToString();
                tbQunt.Text = selectEntites.Quantity.ToString();
                selectEntites = null;
            }
            else
            {
                AvtorizationWindow.Exp("Вы ничего не выбрали!");
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            bd.ProductSales.Load();
            ProductSale currentProduct = new ProductSale();
            currentProduct.ID = int.Parse(tbId.Text);
            currentProduct.SaleDate = DateTime.Parse(tbDateSale.Text);
            currentProduct.ProductID = int.Parse(tbIdProd.Text);
            currentProduct.Quantity = int.Parse(tbQunt.Text);

        }

        private void tbId_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }

        private void tbDateSale_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }

        private void tbIdProd_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }

        private void tbQunt_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }
    }
}
