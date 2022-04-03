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
        ModelBD.BaseModel bd = new ModelBD.BaseModel();
        public TovarPage()
        {
            InitializeComponent();
            bd.Products.Load();
            lvTovar.ItemsSource = bd.Products.Local;
            CheckActual.IsChecked = true;
        }

        private void tbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            bd.Products.Load();
            lvTovar.ItemsSource = bd.Products.Local.Where(x => x.Title.ToLower().Contains(tbSearch.Text.ToLower()));
        }

        private void CheckActual_Checked(object sender, RoutedEventArgs e)
        {
            if (CheckActual.IsChecked.Value)
            {
                bd.Products.Load();
                lvTovar.ItemsSource = bd.Products.Local.Where(x => x.isActive);
            }
        }

        private void CheckActual_Unchecked(object sender, RoutedEventArgs e)
        {
            bd.Products.Load();
            if (CheckActual.IsChecked.Value)
            {
                lvTovar.ItemsSource = bd.Products.Local.Where(x => x.isActive);
            }
        }
        private void btnBuy_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
