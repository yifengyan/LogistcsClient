using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using MySql.Data;

namespace LogisticsClient
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }
        public MySqlConnection getcn()               //连接数据库
        {
            string con = String.Format("server={0};uid={1};pwd={2};database={3}",
               "10.3.1.156", "wl", "wl", "wl");
            MySqlConnection cn = new MySqlConnection(con);
            return cn;
        }
        public void getda(string st)              //将查询的数据显示到dataGridView控件上
        {
            MySqlConnection cn = this.getcn();
            cn.Open();
            MySqlDataAdapter da = new MySqlDataAdapter(st, cn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }
        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            if (textBox3.Text=="")
            {
                textBox3.Text = "0";
            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            if (textBox2.Text =="")
            {
                textBox2.Text = "0";
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            if (textBox1.Text =="")
            {
                textBox1.Text = "0";
            }
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {
            if (textBox4.Text == "")
            {
                textBox4.Text = "0";
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            int len = comboBox1.Items.Count;
            MySqlConnection cnn = this.getcn();
            cnn.Open();
            MySqlCommand cmd1 = new MySqlCommand("SELECT CurrTime FROM tbTime limit 1", cnn);
            DateTime currentTime = DateTime.Parse(cmd1.ExecuteScalar().ToString());
            currentTime = currentTime.AddDays(Convert.ToDouble(textBox3.Text)).AddHours(Convert.ToDouble(textBox2.Text)).AddMinutes(Convert.ToDouble(textBox1.Text)).AddSeconds(Convert.ToDouble(textBox4.Text));
            string str = "update tbTime set CurrTime=('" + currentTime + "')";
            MySqlCommand cmd = new MySqlCommand(str, cnn);
            cmd.ExecuteNonQuery();
            Random Rdm = new Random();
            MySqlConnection cn = this.getcn();
            str = "START   TRANSACTION;";
            int iRdm1, sum, small, middle, big;
            cmd1 = new MySqlCommand("SELECT Count(*) FROM tbGoods", cnn);
            int j = Int32.Parse(cmd1.ExecuteScalar().ToString());
            for (int i = 1; i <= len;++i )
            {            
                MySqlCommand cmd2 = new MySqlCommand("SELECT EndTime FROM tbCar where CarNum='"+i+"'", cnn);
                DateTime endTime = DateTime.Parse(cmd2.ExecuteScalar().ToString());
                MySqlCommand cmd3 = new MySqlCommand("SELECT EndCity FROM tbCar where CarNum='" + i + "'", cnn);
                string start = cmd3.ExecuteScalar().ToString();
                string end = "";
                while (currentTime>endTime)
                {
                    sum = Rdm.Next(5000, 15000);
                    small = Rdm.Next(0, 60);
                    middle = Rdm.Next(0, 30);
                    big = Rdm.Next(0, 20);
                      int s, m, t;
                          s= m= t = 0;
                      while (sum - 1000 >= 0 && big-- > 0)
                      {
                          sum -= 1000;
                          t++;
                      }
                      while (sum - 500 >= 0 && middle-- > 0)
                      {
                          sum -= 500;
                          m++;
                      }
                      while (sum - 250 >= 0 && small-- > 0)
                      {
                          sum -= 250;
                          s++;
                      }
                        do 
                        {   
                           iRdm1 = Rdm.Next(0, 5);
                           switch (iRdm1)
                          {
                          case (0): end = "guangzhou"; break;
                          case (1): end = "shanghai"; break;
                          case (2): end = "beijing"; break;
                          case (3): end = "chongqing"; break;
                          case (4): end = "xian"; break;
                          } 
                        } 
                        while (start==end); 
                      DateTime startTime = endTime;
                      switch (start + end)
                      {
                          case ("guangzhoubeijing"): endTime = startTime.AddHours(23).AddMinutes(23); break;
                          case ("beijingguangzhou"): endTime = startTime.AddHours(23).AddMinutes(23); break;
                          case ("shanghaibeijing"): endTime = startTime.AddHours(13).AddMinutes(15); break;
                          case ("chongqingbeijing"): endTime = startTime.AddHours(20).AddMinutes(53); break;
                          case ("xianbeijing"): endTime = startTime.AddHours(12).AddMinutes(43); break;
                          case ("guangzhoushanghai"): endTime = startTime.AddHours(16).AddMinutes(49); break;
                          case ("shanghaichongqing"): endTime = startTime.AddHours(19).AddMinutes(55); break;
                          case ("shanghaixian"): endTime = startTime.AddHours(15).AddMinutes(15); break;
                          case ("guangzhouxian"): endTime = startTime.AddHours(19).AddMinutes(27); break;
                          case ("guangzhouchongqing"): endTime = startTime.AddHours(18).AddMinutes(7); break;
                          case ("chongqingxian"): endTime = startTime.AddHours(8).AddMinutes(43); break;
                          case ("beijingshanghai"): endTime = startTime.AddHours(13).AddMinutes(15); break;
                          case ( "beijingchongqing"): endTime = startTime.AddHours(20).AddMinutes(53); break;
                          case ( "beijingxian"): endTime = startTime.AddHours(12).AddMinutes(43); break;
                          case ( "shanghaiguangzhou"): endTime = startTime.AddHours(16).AddMinutes(49); break;
                          case ("chongqingshanghai"): endTime = startTime.AddHours(19).AddMinutes(55); break;
                          case ( "xianshanghai"): endTime = startTime.AddHours(15).AddMinutes(15); break;
                          case ( "xianguangzhou"): endTime = startTime.AddHours(19).AddMinutes(27); break;
                          case ( "chongqingguangzhou"): endTime = startTime.AddHours(18).AddMinutes(7); break;
                          case ( "xianchongqing"): endTime = startTime.AddHours(8).AddMinutes(43); break;
                      }
                      str += "update tbCar set StartCity='" + start + "',EndCity='" + end + "',StartTime='" + startTime + "',EndTime='" + endTime + "' where CarNum='"+i+"';";
                          int x;
                          for (x = 1; x <= t;++x )
                          {
                              str += "insert into tbGoods values('" + j + "','" + 1000 + "','" + i + "','" + start + "','" + end + "','" + startTime + "','" + endTime + "');";
                              j++;
                          }
                          for (x = 1; x <= m; ++x)
                          {
                              str += "insert into tbGoods values('" + j + "','" + 500 + "','" + i + "','" + start + "','" + end + "','" + startTime + "','" + endTime + "');";
                              j++;
                          }
                          for (x = 1; x <= s; ++x)
                          {
                              str += "insert into tbGoods values('" + j + "','" + 250 + "','" + i + "','" + start + "','" + end + "','" + startTime + "','" + endTime + "');";
                              j++;
                          }
                          start = end;
                }
            }
            str += "commit";
            MySqlCommand cmd9 = new MySqlCommand(str, cn);
            try
            {
                cmd9.Connection.Open();
                cmd9.ExecuteNonQuery();
                MessageBox.Show("时间增加成功！");
            }
            catch (System.Exception ex)
            {
                MessageBox.Show("数据错误!" + ex.Message.ToString());
            }
            finally
            {
                cmd.Connection.Close();
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            string str = "select distinct StartCity,EndCity,StartTime,EndTime from tbGoods where CarNum='"+comboBox1.Text.ToString()+"' order by StartTime";
            getda(str);
            label1.Text = comboBox1.Text + "号车的运输过程：";
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            MySqlConnection cn = this.getcn();
            cn.Open();
            MySqlDataAdapter da1 = new MySqlDataAdapter("select * from tbCar", cn);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            comboBox1.DataSource = ds1.Tables[0];
            comboBox1.DisplayMember = "CarNum";

            MySqlDataAdapter da2 = new MySqlDataAdapter("select * from tbGoods", cn);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);
            comboBox2.DataSource = ds2.Tables[0];
            comboBox2.DisplayMember = "GoodsID";
        }

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = true;
            if (e.KeyChar >= '0' && e.KeyChar <= '9' || Convert.ToInt32(e.KeyChar) == 8)
            {
                e.Handled = false;
            }
        }

        private void textBox2_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = true;
            if (e.KeyChar >= '0' && e.KeyChar <= '9' || Convert.ToInt32(e.KeyChar) == 8)
            {
                e.Handled = false;
            }
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = true;
            if (e.KeyChar >= '0' && e.KeyChar <= '9' || Convert.ToInt32(e.KeyChar) == 8)
            {
                e.Handled = false;
            }
        }

        private void textBox4_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = true;
            if (e.KeyChar >= '0' && e.KeyChar <= '9' || Convert.ToInt32(e.KeyChar) == 8)
            {
                e.Handled = false;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string str = "select * from tbCar";          
            getda(str);
            label1.Text = "所有车辆的信息：";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string str = "select * from tbGoods";
            getda(str);
            label1.Text = "所有货物的信息：";
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string str = "select StartCity,SUM(GoodsWeight) as 'Total Weight' from tbGoods group by StartCity";
            getda(str);
            label1.Text = "各仓库的发货状况：";
        }

        private void button8_Click(object sender, EventArgs e)
        {
            string str = "select CarNum,SUM(GoodsWeight) as 'Total Weight' from tbGoods group by CarNum";
            getda(str);
            label1.Text = "各车辆的运送状况：";
        }

        private void button7_Click(object sender, EventArgs e)
        {
            MySqlConnection cn = this.getcn();
            cn.Open();
            string str = "START TRANSACTION; delete from tbCar where CarNum='" + comboBox1.Text.ToString() + "'; delete from tbGoods where CarNum='" + comboBox1.Text.ToString() + "';commit";
            MySqlCommand cmd = new MySqlCommand(str, cn);
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            str = "select * from tbCar";
            getda(str);
            label1.Text = "所有车辆的信息：";
        }

        private void button9_Click(object sender, EventArgs e)
        {
            MySqlConnection cn = this.getcn();
            cn.Open();
            string str = "delete from tbGoods where GoodsID='" + comboBox2.Text.ToString() + "'";
            MySqlCommand cmd = new MySqlCommand(str, cn);
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            str = "select * from tbGoods";
            getda(str);
            label1.Text = "所有货物的信息：";
        }

        private void button10_Click(object sender, EventArgs e)
        {
            MySqlConnection cn = this.getcn();
            cn.Open();
            string str = "update tbCar set CarLoad='"+textBox5.Text+"' where CarNum='"+comboBox1.Text.ToString()+"'";
            MySqlCommand cmd = new MySqlCommand(str, cn);
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            str = "select * from tbCar";
            getda(str);
            label1.Text = "所有车辆的信息：";
        }

        private void textBox5_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = true;
            if (e.KeyChar >= '0' && e.KeyChar <= '9' || Convert.ToInt32(e.KeyChar) == 8)
            {
                e.Handled = false;
            }
        }
    }
}
