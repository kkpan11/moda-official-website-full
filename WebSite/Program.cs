using System.Text.Encodings.Web;
using System.Text.Unicode;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews();
builder.Services.AddSession();
builder.Services.AddDistributedMemoryCache();

#region SQL�s�u�r��

var AESkey = builder.Configuration.GetValue<string>("AESKey");
var SqlDecrypt = builder.Configuration.GetConnectionString("MODA");
var needEncryption = builder.Configuration.GetValue<string>("needEncryption");
var _SqlDecrypt = SqlDecrypt;
if (needEncryption == "1")
{
    _SqlDecrypt = Utility.AES.AesDecrypt(SqlDecrypt, AESkey);
}
Services.MODAContext.DB_ConnectionString = _SqlDecrypt;
#endregion

Services.CommonService.WebSiteUrl = builder.Configuration.GetValue<string>("WebSiteUrl");
WebSite.Controllers.BaseController.WebSiteUrl = builder.Configuration.GetValue<string>("WebSiteUrl");
Services.CommonService.WebAPIUrl = builder.Configuration.GetValue<string>("WebAPIUrl");
builder.Services.AddMemoryCache();
builder.Services.AddSingleton(HtmlEncoder.Create(UnicodeRanges.All));
builder.Services.AddSession(options =>
{
    options.Cookie.SecurePolicy = CookieSecurePolicy.None; //����u���b HTTPS �s�u�����p�U�A�~���\�ϥ� Session�C�p���@���ܦ��[�K�s�u�A�N���e���Q�d�I
    options.Cookie.Name = "moda";
    options.IdleTimeout = TimeSpan.FromHours(2); //�L���ɶ�
});

var app = builder.Build();
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();
app.UseSession();
app.UseRouting();
app.UseAuthorization();
app.Use(async (context, next) =>
{
    await next();
});

app.MapControllerRoute(
name: "areaRoute",
pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
