﻿using System;
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
using System.Windows.Shapes;

namespace appCarService
{
    /// <summary>
    /// Interaction logic for WindowAdd.xaml
    /// </summary>
    public partial class WindowAdd : Window
    {
        public WindowAdd()
        {
            InitializeComponent();
            List<string> actual = new List<string>();
            actual.Add("Актуально");
            actual.Add("Неактуально");
            cmbActual.ItemsSource = actual;
            cmbActual.SelectedIndex = 0;
        }

        private void tbName_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }

        private void tbPrice_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }

        private void tbDescript_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}