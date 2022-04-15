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
            dtgServicesTable.ItemsSource = AvtorizationWindow.bd.Services.Local;
        }
    }
}
