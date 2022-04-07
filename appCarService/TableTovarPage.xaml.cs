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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace appCarService
{
    /// <summary>
    /// Interaction logic for TableTovarPage.xaml
    /// </summary>
    public partial class TableTovarPage : Page
    {
        ModelBD.BaseModel bd = new ModelBD.BaseModel();
        
        public TableTovarPage()
        {
            InitializeComponent();
            bd.ProductSales.Load();
            dtgTovarTable.ItemsSource = bd.ProductSales.Local;
        }
        public static ProductSale selectEntites = new ProductSale();
        private void btnRed_Click(object sender, RoutedEventArgs e)
        {
            bd.ProductSales.Load();
            spRed.Visibility = Visibility.Visible;
            selectEntites = (ProductSale)dtgTovarTable.SelectedItem;
            if (TovarPage.selectEntites != null)
            {
                tbId.Text = selectEntites.ID.ToString();
                tbDateSale.Text = selectEntites.SaleDate.ToString();
                tbIdProd.Text = selectEntites.ProductID.ToString();
                tbQunt.Text = selectEntites.Quantity.ToString();
                selectEntites = null;
            }
            else
            {
                AvtorizationWindow.Exp("Вы ничего не выбрали!");
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            bd.ProductSales.Load();
            ProductSale currentProduct = new ProductSale();
            if (tbId.Text != "" && tbDateSale.Text != "" && tbIdProd.Text != "" && tbQunt.Text != "")
            {
                currentProduct.ID = int.Parse(tbId.Text);
                currentProduct.SaleDate = DateTime.Parse(tbDateSale.Text);
                currentProduct.ProductID = int.Parse(tbIdProd.Text);
                currentProduct.Quantity = int.Parse(tbQunt.Text);
                AvtorizationWindow.Inf("Данный сохранены");
                spRed.Visibility = Visibility.Hidden;
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

        private void tbDateSale_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[0-9/:/\/]");
            Match match = input.Match(e.Text);
            if (!match.Success)
            {
                e.Handled = true;
            }
        }

        private void tbIdProd_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[0-9]");
            Match match = input.Match(e.Text);
            if (!match.Success)
            {
                e.Handled = true;
            }
        }

        private void tbQunt_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex input = new Regex(@"[0-9]");
            Match match = input.Match(e.Text);
            if (!match.Success)
            {
                e.Handled = true;
            }
        }

        private void btnDel_Click(object sender, RoutedEventArgs e)
        {
            bd.ProductSales.Load();
            selectEntites = (ProductSale)dtgTovarTable.SelectedItem;
            if (selectEntites != null)
            {
                try
                {
                    bd.ProductSales.Remove(selectEntites);
                    bd.SaveChanges();
                }
                catch (Exception ex)
                {
                    AvtorizationWindow.Exp(ex.ToString());
                }
            }
            else
            {
                AvtorizationWindow.Exp("Вы ничего не выбрали!");
            }
        }
    }
}
