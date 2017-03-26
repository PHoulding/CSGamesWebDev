using Microsoft.Extensions.Configuration;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ServerAPI
{
    public static class DatabaseGrabber
    {
        private static readonly string connectionString;
        private const string SP_LOGIN = "login";
        private const string SP_REGISTER = "addUser";

        //DATABASE INFORMATION
        static DatabaseGrabber()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json");
            ConfigurationRoot config = (ConfigurationRoot) builder.Build();
            connectionString = config["connectionString"];
        }

        public static int loginUser(string username, string password)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(SP_LOGIN, conn))
                {
                    int value;

                    cmd.Parameters.Add(new SqlParameter("@username", username));
                    cmd.Parameters.Add(new SqlParameter("@password", password));

                    if(int.TryParse((String) cmd.ExecuteScalar(), out value))
                    {
                        return value;
                    }
                    else
                    {
                        return -1;
                    }
                }
            }
        }

        public static int registerUser(string username, string password)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(SP_REGISTER, conn))
                {
                    int value;

                    cmd.Parameters.Add(new SqlParameter("@username", username));
                    cmd.Parameters.Add(new SqlParameter("@password", password));

                    return cmd.ExecuteNonQuery();
                }
            }
        }

    }
}
