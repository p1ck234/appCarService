using appCarService.ModelBD;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
            dtgTovarTable.ItemsSource = bd.ProductSales.Local.OrderBy(x => x.ID);
        }

        ProductSale selectEntites = new ProductSale();
        private void btnRed_Click(object sender, RoutedEventArgs e)
        {
            selectEntites = null;
            bd.ProductSales.Load();
            selectEntites = (ProductSale)dtgTovarTable.SelectedItem;
            if (selectEntites != null)
            {
                try
                {
                    tbId.Text = selectEntites.ID.ToString();
                    tbDateSale.Text = selectEntites.SaleDate.ToString();
                    tbIdProd.Text = selectEntites.ProductID.ToString();
                    tbQunt.Text = selectEntites.Quantity.ToString();
                    spRed.Visibility = Visibility.Visible;
                }
                catch (Exception ex)
                { 
                    Console.WriteLine(ex.Message); 
                }
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
            if (tbId.Text != "" && tbDateSale.Text != "" && tbIdProd.Text != "" && tbQunt.Text != "")
            {
                try
                {
                    currentProduct.ID = int.Parse(tbId.Text);
                    currentProduct.SaleDate = DateTime.Parse(tbDateSale.Text);
                    currentProduct.ProductID = int.Parse(tbIdProd.Text);
                    currentProduct.Quantity = int.Parse(tbQunt.Text);
                    bd.ProductSales.Remove(selectEntites);
                    bd.ProductSales.Add(currentProduct);
                    bd.SaveChanges();
                    AvtorizationWindow.Inf("Данный сохранены");
                    spRed.Visibility = Visibility.Hidden;
                    dtgTovarTable.ItemsSource = bd.ProductSales.Local.OrderBy(x => x.ID);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void tbId_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[0-9]");
            Match match = input.Match(e.Text);
            if (!match.Success)
            {
                e.Handled = true;
            }
        }

        private void tbDateSale_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[0-9/:/\/]");
            Match match = input.Match(e.Text);
            if (!match.Success)
            {
                e.Handled = true;
            }
        }

        private void tbIdProd_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[0-9]");
            Match match = input.Match(e.Text);
            if (!match.Success)
            {
                e.Handled = true;
            }
        }

        private void tbQunt_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[0-9]");
            Match match = input.Match(e.Text);
            if (!match.Success)
            {
                e.Handled = true;
            }
        }

        private void btnDel_Click(object sender, RoutedEventArgs e)
        {
            bd.ProductSales.Load();
            selectEntites = (ProductSale)dtgTovarTable.SelectedItem;
            if (selectEntites != null)
            {
                try
                {
                    if (MessageBox.Show("Вы действительно хотите удалить этот элемент из базы данных?","Внимание",MessageBoxButton.YesNo,MessageBoxImage.Question) ==MessageBoxResult.Yes)
                    {
                        bd.ProductSales.Remove(selectEntites);
                        bd.SaveChanges();
                        dtgTovarTable.ItemsSource = bd.ProductSales.Local.OrderBy(x => x.ID);
                        AvtorizationWindow.Inf("Элемент удален");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                AvtorizationWindow.Exp("Вы ничего не выбрали!");
            }
        }

        private void sortDate_Checked(object sender, RoutedEventArgs e)
        {
            bd.ProductSales.Load();
            dtgTovarTable.ItemsSource = bd.ProductSales.Local.OrderByDescending(x => x.SaleDate);
        }

        private void sortQuntity_Checked(object sender, RoutedEventArgs e)
        {
            bd.ProductSales.Load();
            dtgTovarTable.ItemsSource = bd.ProductSales.Local.OrderBy(x => x.Quantity);

        }

        private void sortIdProduct_Checked(object sender, RoutedEventArgs e)
        {
            bd.ProductSales.Load();
            dtgTovarTable.ItemsSource = bd.ProductSales.Local.OrderBy(x => x.ProductID);

        }

        private void sortId_Checked(object sender, RoutedEventArgs e)
        {
            bd.ProductSales.Load();
            dtgTovarTable.ItemsSource = bd.ProductSales.Local.OrderBy(x => x.ID);
        }
    }
}
