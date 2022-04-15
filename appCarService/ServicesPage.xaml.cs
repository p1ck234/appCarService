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
    /// Interaction logic for ServicesPage.xaml
    /// </summary>
    public partial class ServicesPage : Page
    {
        int counter = 0;
        int index = 0;
        public ServicesPage()
        {
            InitializeComponent();
            
        }

        private void btnChek_Click(object sender, RoutedEventArgs e)
        {
            if (cb1.IsChecked != true && cb2.IsChecked != true && cb3.IsChecked != true && cb4.IsChecked != true &&
                cb5.IsChecked != true && cb6.IsChecked != true &&
                cb7.IsChecked != true && cb8.IsChecked != true && cb9.IsChecked != true)
            {
                AvtorizationWindow.Exp("Вы ничего не выбрали");
            }
            else
            {
                borderChech.Visibility = Visibility.Visible;
                if (cb1.IsChecked == true)
                {
                    index++;
                    counter += 2000;
                    tbOtchet.Text += index.ToString() + ". " +  cb1.Content + " (2000 руб.)" + "\n";
                }
                if (cb2.IsChecked == true)
                {
                    index++;
                    counter += 5000;
                    tbOtchet.Text += index.ToString() + ". " + cb2.Content + " (5000 руб.)" + "\n";
                }
                if (cb3.IsChecked == true)
                {
                    index++;
                    counter += 10000;
                    tbOtchet.Text += index.ToString() + ". " + cb3.Content + " (10000 руб.)" + "\n";
                }
                if (cb4.IsChecked == true)
                {
                    index++;
                    counter += 15000;
                    tbOtchet.Text += index.ToString() + ". " + cb4.Content + " (15000 руб.)" + "\n";
                }
                if (cb5.IsChecked == true)
                {
                    index++;
                    counter += 10000;
                    tbOtchet.Text += index.ToString() + ". " + cb5.Content + " (10000 руб.)" + "\n";
                }
                if (cb6.IsChecked == true)
                {
                    index++;
                    counter += 13000;
                    tbOtchet.Text += index.ToString() + ". " + cb6.Content + " (13000 руб.)" + "\n";
                }
                if (cb7.IsChecked == true)
                {
                    index++;
                    counter += 15000;
                    tbOtchet.Text += index.ToString() + ". " + cb7.Content + " (15000 руб.)" + "\n";
                }
                if (cb8.IsChecked == true)
                {
                    index++;
                    counter += 16000;
                    tbOtchet.Text += index.ToString() + ". " + cb8.Content + " (16000 руб.)" + "\n";
                }
                if (cb9.IsChecked == true)
                {
                    index++;
                    counter += 13000;
                    tbOtchet.Text += index.ToString() + ". " + cb9.Content + " (13000 руб.)" + "\n";
                }
                tbOtchet.Text += "Примерная стоимость услуг = "+ counter + "руб." + "\n";
                index = 0;
            }
        }

        private void btnOth_Click(object sender, RoutedEventArgs e)
        {
            tbOtchet.Text = "";
            cb1.IsChecked = false;
            cb2.IsChecked = false;
            cb3.IsChecked = false;
            cb4.IsChecked = false;
            cb5.IsChecked = false; 
            cb6.IsChecked = false;
            cb7.IsChecked = false;
            cb8.IsChecked = false;
            cb9.IsChecked = false;
            borderChech.Visibility = Visibility.Hidden;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            AvtorizationWindow.bd.Services.Load();
            ModelBD.Service a = new ModelBD.Service();
            a.ID = AvtorizationWindow.bd.Services.Local.Count + 1;
            if (cb1.IsChecked != true && cb2.IsChecked != true && cb3.IsChecked != true && cb4.IsChecked != true &&
                cb5.IsChecked != true && cb6.IsChecked != true &&
                cb7.IsChecked != true && cb8.IsChecked != true && cb9.IsChecked != true)
            {
                AvtorizationWindow.Exp("Вы ничего не выбрали");
            }
            else
            {

                if (cb1.IsChecked == true)
                {
                    a.Name += cb1.Content + " ";
                }
                if (cb2.IsChecked == true)
                {
                    a.Name += cb2.Content + " ";
                }
                if (cb3.IsChecked == true)
                {
                    a.Name += cb3.Content + " ";
                }
                if (cb4.IsChecked == true)
                {
                    a.Name += cb4.Content + " ";
                }
                if (cb5.IsChecked == true)
                {
                    a.Name += cb5.Content + " ";
                }
                if (cb6.IsChecked == true)
                {
                    a.Name += cb6.Content + " ";
                }
                if (cb7.IsChecked == true)
                {
                    a.Name += cb7.Content + " ";
                }
                if (cb8.IsChecked == true)
                {
                    a.Name += cb8.Content + " ";
                }
                if (cb9.IsChecked == true)
                {
                    a.Name += cb9.Content + " ";
                }
            }
            a.Price = counter;
            try
            {
                AvtorizationWindow.bd.Services.Add(a);
                AvtorizationWindow.bd.SaveChanges();
                AvtorizationWindow.Inf("Данные сохранены!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
