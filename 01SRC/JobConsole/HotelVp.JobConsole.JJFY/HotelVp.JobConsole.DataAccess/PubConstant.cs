﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace HotelVp.Jjzx.DBUtility
{
    /// <summary>
    /// 公共工具类
    /// </summary>
    public class PubConstant
    {
        /// <summary>
        /// 获取固定连接字符串
        /// </summary>
        public static string ConnectionString
        {
            get
            {
                string _connectionString = ConfigurationManager.AppSettings["ConnectionString"];
                string ConStringEncrypt = ConfigurationManager.AppSettings["ConStringEncrypt"];
                if (ConStringEncrypt == "true")
                {
                    _connectionString = DESEncrypt.Decrypt(_connectionString);
                }
                return _connectionString;
            }
        }

        /// <summary>
        /// 动态得到web.config里配置项的数据库连接字符串。
        /// </summary>
        /// <param name="configName"></param>
        /// <returns></returns>
        public static string GetConnectionString(string configName)
        {
            string connectionString = ConfigurationManager.AppSettings[configName];
            string ConStringEncrypt = ConfigurationManager.AppSettings["ConStringEncrypt"];
            if (ConStringEncrypt == "true")
            {
                connectionString = DESEncrypt.Decrypt(connectionString);
            }
            return connectionString;
        }


    }
}
