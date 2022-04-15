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

        Service selectEntites = new Service();
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
            AvtorizationWindow.bd.Services.Load();
            selectEntites = (Service)dtgServicesTable.SelectedItem;
            if(selectEntites != null)
            {
                try
                {
                    AvtorizationWindow.bd.Services.Remove(selectEntites);
                    AvtorizationWindow.bd.SaveChanges();
                    dtgServicesTable.ItemsSource = AvtorizationWindow.bd.Services.Local.OrderBy(x => x.ID);
                    AvtorizationWindow.Inf("Элемент удален");
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

        private void tbId_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[0-9]");
            Match match = input.Match(e.Text);
            if (!match.Success)
            {
                e.Handled = true;
            }
        }

        private void tbName_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[а-яА-Я]");
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

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
