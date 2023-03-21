﻿namespace ModaMailBox
{
    public class AppSettingHelper
    {
        public static string GetAppsetting(string key)
        {
            try
            {
                var builder = new ConfigurationBuilder()
                         .SetBasePath(Directory.GetCurrentDirectory())
                         .AddJsonFile("appsettings.json");
                var config = builder.Build();
                foreach (var provider in config.Providers)
                {
                    provider.TryGet(key, out var value);
                    return value;
                }
            }
            catch { return ""; }
            return "";
        }
    }
}
