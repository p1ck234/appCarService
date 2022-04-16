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
    /// Interaction logic for TovarPage.xaml
    /// </summary>
    public partial class TovarPage : Page
    {
        public TovarPage()
        {
            InitializeComponent();
            AvtorizationWindow.bd.Products.Load();
            lvTovar.ItemsSource = AvtorizationWindow.bd.Products.Local;
            CheckActual.IsChecked = true;

            if (Manager.Admin == true)
            {
                btnBuy.Visibility = Visibility.Hidden;
                btnRed.Visibility = Visibility.Visible;
            }
            else
            {
                btnBuy.Visibility = Visibility.Visible;
                btnRed.Visibility = Visibility.Hidden;

            }
        }

        public static Product selectEntites = new Product(); 
        private void tbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            AvtorizationWindow.bd.Products.Load();
            lvTovar.ItemsSource = AvtorizationWindow.bd.Products.Local.Where(x => x.Title.ToLower().Contains(tbSearch.Text.ToLower()));
        }

        private void CheckActual_Checked(object sender, RoutedEventArgs e)
        {
            if (CheckActual.IsChecked.Value)
            {
                AvtorizationWindow.bd.Products.Load();
                lvTovar.ItemsSource = AvtorizationWindow.bd.Products.Local.Where(x => x.isActive);
            }
        }

        private void CheckActual_Unchecked(object sender, RoutedEventArgs e)
        {
            AvtorizationWindow.bd.Products.Load();
            lvTovar.ItemsSource = AvtorizationWindow.bd.Products.Local;
            
        }
        private void btnBuy_Click(object sender, RoutedEventArgs e)
        {
            selectEntites = (Product)lvTovar.SelectedItem;
            if (TovarPage.selectEntites != null)
            {
                BuyWindow bw = new BuyWindow();
                bw.Show();
            }
            else
            {
                AvtorizationWindow.Exp("Вы ничего не выбрали!");
            }
        }

        private void btnRed_Click(object sender, RoutedEventArgs e)
        {
            selectEntites = (Product)lvTovar.SelectedItem;
            if (TovarPage.selectEntites != null)
            {
                RedWindow a = new RedWindow();
                a.Show();
            }
            else
            {
                AvtorizationWindow.Exp("Вы ничего не выбрали!");
            }
        }
    }
}
