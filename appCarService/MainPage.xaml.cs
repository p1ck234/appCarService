using System;
using System.Collections.Generic;
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
    /// Interaction logic for MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        public MainPage()
        {
            InitializeComponent();
            if (Manager.Admin == true)
            {
                btnSell.Visibility = Visibility.Visible;
                btnServicesManager.Visibility = Visibility.Visible;
            }
            else
            {
                btnSell.Visibility = Visibility.Hidden;
                btnServicesManager.Visibility = Visibility.Hidden;
            }
        }

        private void btnTovar_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new TovarPage());
        }

        private void btnServices_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new ServicesPage());
        }

        private void btnSell_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnServicesManager_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
