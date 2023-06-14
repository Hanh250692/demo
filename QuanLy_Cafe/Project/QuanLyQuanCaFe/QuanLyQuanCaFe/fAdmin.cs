using QuanLyQuanCaFe.DAO;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace QuanLyQuanCaFe
{
    public partial class fAdmin : Form
    {
        public fAdmin()
        {
            InitializeComponent();
            LoadAccountList();
        }



        void LoadAccountList()
        {
            string query = "EXEC dbo.USP_GetAccountByUserName @userName";
            DataProvider provider = new DataProvider();
            dtgvAccount.DataSource = provider.ExecuteQuery(query,new object[] {"Nguyễn Hồng Hạnh"});



        }
    }
}
