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
                if (cb1.IsChecked == true)
                {
                    counter += 2000;
                    tbOtchet.Text += cb1.Content + "\n";
                }
                if (cb2.IsChecked == true)
                {
                    counter += 5000;
                    tbOtchet.Text += cb2.Content + "\n";
                }
                if (cb3.IsChecked == true)
                {
                    counter += 10000;
                    tbOtchet.Text += cb2.Content + "\n";
                }
                if (cb4.IsChecked == true)
                {
                    counter += 15000;
                    tbOtchet.Text += cb4.Content + "\n";
                }
                if (cb5.IsChecked == true)
                {
                    counter += 10000;
                    tbOtchet.Text += cb5.Content + "\n";
                }
                if (cb6.IsChecked == true)
                {
                    counter += 13000;
                    tbOtchet.Text += cb6.Content + "\n";
                }
                if (cb7.IsChecked == true)
                {
                    counter += 15000;
                    tbOtchet.Text += cb7.Content + "\n";
                }
                if (cb8.IsChecked == true)
                {
                    counter += 16000;
                    tbOtchet.Text += cb8.Content + "\n";
                }
                if (cb9.IsChecked == true)
                {
                    counter += 13000;
                    tbOtchet.Text += cb9.Content + "\n";
                }
                tbOtchet.Text += counter + "руб." + "\n";
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
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            ModelBD.BaseModel bd = new ModelBD.BaseModel();
            bd.Services.Load();
            ModelBD.Service a = new ModelBD.Service();
            a.ID = bd.Services.Local.Count + 1;
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
                    a.Name += cb2.Content + " ";
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
                bd.Services.Add(a);
                bd.SaveChanges();
                AvtorizationWindow.Inf("Данные сохранены!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
