using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace QuanLyQuanCaFe.DAO
{
    public class AccountDAO
    {
        private static AccountDAO instance;
        public static AccountDAO Instance
        {
            get { if (instance == null) instance = new AccountDAO(); return instance; }
            private set { instance = value; }
        }

        private AccountDAO() { }

        public bool Login(string userName, string password)
        {
            string query = "SELECT * FROM  dbo.Account WHERE UserName = N'" +userName +"'AND PassWord= N'"+password+"'";
            DataTable result = DataProvider.Intstance.ExecuteQuery(query);
            return result.Rows.Count>0;
        }
    }

    
}
