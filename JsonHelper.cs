using System.Collections.Generic;
using System.IO;
using System.Web;
using Newtonsoft.Json;

public class JsonHelper
{
    private static string filePath = HttpContext.Current.Server.MapPath("~/App_Data/Users.json");

    public static List<NguoiDung> ReadUsers()
    {
        if (!File.Exists(filePath))
        {
            return new List<NguoiDung>();
        }

        string json = File.ReadAllText(filePath);
        return JsonConvert.DeserializeObject<List<NguoiDung>>(json) ?? new List<NguoiDung>();
    }

    public static void WriteUsers(List<NguoiDung> users)
    {
        string json = JsonConvert.SerializeObject(users, Formatting.Indented);
        File.WriteAllText(filePath, json);
    }
}
