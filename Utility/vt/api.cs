﻿
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Net.Http;
using System.Net.Http.Headers;

namespace Utility.vt
{
    public class api
    {
        public static string key = "d8ee5feabc69e45392f08f7feaf72d0725c96e70d7faf29568c1e7276e0966cd";

        public static void Scan()
        {
            var path = @"C:\Users\i-pc-136\Desktop\新增資料夾 (6)\p2\p2.png";
            var formdata = new MultipartFormDataContent();
            using (FileStream SourceStream = File.Open(path, FileMode.Open))
            {
                var streamContent = new StreamContent(SourceStream);
                var fileContent = new ByteArrayContent(streamContent.ReadAsByteArrayAsync().Result);
                formdata.Add(fileContent, "p2.png", "p2.png");
            }
            using (HttpClient client = new HttpClient(setHttpNotSafeSSl()))
            {
                var url = @$"https://www.virustotal.com/api/v3/files";
                client.DefaultRequestHeaders.Add("accept", "application/json");
                client.DefaultRequestHeaders.Add("x-apikey", key);
                client.DefaultRequestHeaders.TryAddWithoutValidation("Content-Type", "multipart/form-data");
                var response = client.PostAsync(url, formdata).Result;
                var test = "";
            }
            //var client = new RestClient("https://www.virustotal.com");
            //var request = new RestRequest("/api/v3/files", Method.Post);
            //request.AddHeader("accept", "application/json");
            //request.AddHeader("x-apikey", key);
            //request.AddHeader("content-type", "multipart/form-data; boundary=---011000010111000001101001");
            //var response = client.Execute(request);


        }
        static HttpClientHandler setHttpNotSafeSSl()
        {
            var handler = new HttpClientHandler();
            handler.ClientCertificateOptions = ClientCertificateOption.Manual;
            handler.ServerCertificateCustomValidationCallback =
               (httpRequestMessage, cert, cetChain, policyErrors) =>
               {
                   return true;
               };
            return handler;
        }
    }
}