using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{
	SqlConnection con = new SqlConnection(@"server=DESKTOP-S6AF6OE\SQLEXPRESS; database=CozaStore_DB;integrated security=true");
	public int Payment(string AccNo,decimal Total)
    {
		SqlCommand cmd = new SqlCommand();

		cmd.CommandText = @"UPDATE account_tab SET Account_balance = Account_balance - @Total
                            WHERE Account_number  = @AccNo";

		cmd.Parameters.AddWithValue("@AccNo", AccNo);
		cmd.Parameters.AddWithValue("@Total", Total);
		int i= SP_nonquery(cmd);
		return i;
    }
	public int SP_nonquery(SqlCommand cmd)
	{
		if (con.State == ConnectionState.Open)
		{
			con.Close();
		}
		cmd.Connection = con;
		con.Open();
		int i = cmd.ExecuteNonQuery();
		con.Close();
		return i;
	}
	public string GetData(int value)
	{
		return string.Format("You entered: {0}", value);
	}

	public CompositeType GetDataUsingDataContract(CompositeType composite)
	{
		if (composite == null)
		{
			throw new ArgumentNullException("composite");
		}
		if (composite.BoolValue)
		{
			composite.StringValue += "Suffix";
		}
		return composite;
	}
}
