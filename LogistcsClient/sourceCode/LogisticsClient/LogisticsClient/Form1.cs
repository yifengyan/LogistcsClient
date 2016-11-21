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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        int b=0;
        static int num=0;
        Form2 f = new Form2();
        public MySqlConnection getcn()               //连接数据库
        {
            string con = String.Format("server={0};uid={1};pwd={2};database={3}",
               "10.3.1.156", "wl", "wl", "wl");
            MySqlConnection cn = new MySqlConnection(con);
            return cn;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "admin" && textBox2.Text=="admin")
            {
                f.Show();
                this.Visible=false;
            }
            else
            {
                MessageBox.Show("密码或用户名错误！");
            }
            textBox1.Text = textBox2.Text = "";
         }

        private void button2_Click(object sender, EventArgs e)
        {
            if (b==0)
            {
                label2.Visible = false;
                textBox2.Visible = false;
                label1.Text = "车辆数：";
                button1.Enabled = false;
                b++;
                button2.Text = "提交";
                MySqlConnection cn = this.getcn();
                cn.Open();
                string str = "START   TRANSACTION; TRUNCATE TABLE tbCar;TRUNCATE TABLE tbGoods;TRUNCATE TABLE tbTime;insert into tbTime values('"+DateTime.Now+"');commit";
                MySqlCommand cmd = new MySqlCommand(str, cn);
                try
                {
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show("删除数据出错!" + ex.Message.ToString());
                }
                finally
                {
                    cmd.Connection.Close();
                }
            } 
            else
            {
                if (textBox1.Text=="0"||textBox1.Text=="")
                {
                    MessageBox.Show("不能输入0或空");
                    textBox1.Text = "";
                } 
                else
                {
                    button2.Enabled = false;
                    label2.Visible = true;
                    textBox2.Visible = true;
                    label1.Text = "用户名：";
                    button1.Enabled = true;
                    num = Convert.ToInt32(textBox1.Text);
                    textBox1.Text = "";
                    b++;
                    Random Rdm = new Random();
                    MySqlConnection cn = this.getcn();
                    string str = "START   TRANSACTION;";
                    int iRdm,iRdm1,sum,small,middle,big;
                    int j = 1;
                    for (int i = 1; i <=num;++i )
                    {
                      string start = "";
                      string end = "";
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
                      iRdm = Rdm.Next(0, 5);
                      switch (iRdm)
                      {
                          case (0): start = "guangzhou"; break;
                          case (1): start = "shanghai"; break;
                          case (2): start = "beijing"; break;
                          case (3): start = "chongqing"; break;
                          case (4): start = "xian"; break;
                      }
                        do 
                        {   
                           iRdm1 = Rdm.Next(0, 5);
                        } 
                        while (iRdm==iRdm1); 
                      switch (iRdm1)
                      {
                          case (0): end = "guangzhou"; break;
                          case (1): end = "shanghai"; break;
                          case (2): end = "beijing"; break;
                          case (3): end = "chongqing"; break;
                          case (4): end = "xian"; break;
                      } 
                      MySqlConnection cnn = this.getcn();
                      cnn.Open();
                      MySqlCommand cmd1 = new MySqlCommand("SELECT CurrTime FROM tbTime limit 1", cnn);
                      DateTime startTime = DateTime.Parse(cmd1.ExecuteScalar().ToString());
                      DateTime endTime=new DateTime();
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
                      str += "insert into tbCar values('" + i + "','" + (sum + t * 1000 + m * 500 + s * 250) + "','" + start + "','" + end + "','" + startTime + "','" + endTime + "');";
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
                    }
                    str += "commit";
                    MySqlCommand cmd = new MySqlCommand(str, cn);
                    try
                    {
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        MessageBox.Show("提交成功！");
                    }
                    catch (System.Exception ex)
                    {
                        MessageBox.Show("提交数据错误!" + ex.Message.ToString());
                    }
                    finally
                    {
                        cmd.Connection.Close();
                    }
                }
            }
        }
        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (b==1)
            {
               e.Handled = true;
               if (e.KeyChar >= '0' && e.KeyChar <= '9'||Convert.ToInt32(e.KeyChar)==8)
               {
                   e.Handled = false;
               }
            }
        }
    }
}
