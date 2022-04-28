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
using System.Windows.Shapes;

namespace appCarService
{
    /// <summary>
    /// Interaction logic for WindowAdd.xaml
    /// </summary>
    public partial class WindowAdd : Window
    {
        public WindowAdd()
        {
            InitializeComponent();
            List<string> actual = new List<string>();
            actual.Add("Актуально");
            actual.Add("Неактуально");
            cmbActual.ItemsSource = actual;
            cmbActual.SelectedIndex = 0;
        }

        private void tbName_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[а-яА-Я\,\.0-9a-zA-Z]");
            Match match = input.Match(e.Text);
            if (!match.Success)
            {
                e.Handled = true;
            }
        }

        private void tbPrice_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[0-9]");
            Match match = input.Match(e.Text);
            if (!match.Success)
            {
                e.Handled = true;
            }
        }

        private void tbDescript_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[а-яА-Я\,\.0-9a-zA-Z]");
            Match match = input.Match(e.Text);
            if (!match.Success)
            {
                e.Handled = true;
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            AvtorizationWindow.bd.ProductSales.Load(); 
            Product currentProduct = new Product();
            currentProduct.Title = tbName.Text;
            currentProduct.Cost = int.Parse(tbPrice.Text);
            currentProduct.Description = tbDescript.Text;
            if (cmbActual.SelectedIndex == 0)
            {
               currentProduct.isActive = true;
            }
            else
            {
                currentProduct.isActive = false;
            }
            try
            {
                AvtorizationWindow.bd.Products.Add(currentProduct);
                AvtorizationWindow.bd.SaveChanges();
                AvtorizationWindow.Inf("Информация сохранена!");
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
