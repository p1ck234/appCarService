﻿using appCarService.ModelBD;
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
    /// Interaction logic for RedWindow.xaml
    /// </summary>
    public partial class RedWindow : Window
    {
        public RedWindow()
        {
            InitializeComponent();
            List<string> actual = new List<string>();
            actual.Add("Актуально");
            actual.Add("Неактуально");
            cmbActual.ItemsSource = actual;
            cmbActual.SelectedIndex = 0;
            tbName.Text = TovarPage.selectEntites.Title;
            tbPrice.Text = TovarPage.selectEntites.Cost.ToString();

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

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            AvtorizationWindow.bd.ProductSales.Load();
            ProductSale currentBuy = new ProductSale();

        }
    }
}
