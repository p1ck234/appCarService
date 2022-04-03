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
            ModelBD.BaseModel bd = new ModelBD.BaseModel();
            bd.Products.Load();
            lvTovar.ItemsSource = bd.Products.Local;
        }
    }
}
