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
    /// Interaction logic for TableServicesPage.xaml
    /// </summary>
    public partial class TableServicesPage : Page
    {
        public TableServicesPage()
        {
            InitializeComponent();
            AvtorizationWindow.bd.Services.Load();
            dtgServicesTable.ItemsSource = AvtorizationWindow.bd.Services.Local.OrderBy(x => x.ID);
        }

        private void sortPrice_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void sortId_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void btnRed_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnDel_Click(object sender, RoutedEventArgs e)
        {

        }

        private void tbId_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }

        private void tbName_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }

        private void tbPrice_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
