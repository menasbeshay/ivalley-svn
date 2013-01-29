using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Word;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BLL.News objData = new BLL.News();
            objData.GetTopNews();
            object oMissing = System.Reflection.Missing.Value;
            
            Application oWordApp = new Application();
            Document document = oWordApp.Documents.Add(ref oMissing, ref oMissing, ref oMissing, ref oMissing);
            document.Activate();

            int i = 0 ;
            foreach (DataRowView item in objData.DefaultView)
            {
                
                oWordApp.Selection.TypeText(item["ArTitle"].ToString());
                oWordApp.Selection.TypeParagraph();
                oWordApp.Selection.TypeParagraph();

                oWordApp.Selection.InlineShapes.AddPicture("http://localhost:2674/" + item["MainPicturePath"].ToString());
                oWordApp.Selection.TypeParagraph();


                oWordApp.Selection.TypeText(StripTagsCharArray(Server.HtmlDecode(item["ArBody"].ToString())));                
                oWordApp.Selection.InsertNewPage();
                i++;
                
            }
            document.SaveAs(Server.MapPath("~/fileuploads/News.docx"), oMissing, oMissing, oMissing, oMissing, oMissing, oMissing,
                    oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing);
            document.Close();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Charset = "";

            HttpContext.Current.Response.ContentType = "application/docx";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=\"news.docx\"");
            HttpContext.Current.Response.TransmitFile("/fileuploads/News.docx");
            
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
            oWordApp.Application.Quit(ref oMissing, ref oMissing, ref oMissing);
        }


        public string StripTagsCharArray(string source)
        {
            char[] array = new char[source.Length];
            int arrayIndex = 0;
            bool inside = false;

            for (int i = 0; i < source.Length; i++)
            {
                char let = source[i];
                if (let == '<')
                {
                    inside = true;
                    continue;
                }
                if (let == '>')
                {
                    inside = false;
                    continue;
                }
                if (!inside)
                {
                    array[arrayIndex] = let;
                    arrayIndex++;
                }
            }
            return new string(array, 0, arrayIndex);
        }
    }
}