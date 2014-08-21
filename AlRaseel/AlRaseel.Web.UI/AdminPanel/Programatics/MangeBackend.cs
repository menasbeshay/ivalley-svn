using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.Web.UI.WebControls;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Text;
using AjaxControlToolkit;

using Data.DataModels;
using Data.Extensions;
using Data;



namespace Web.UI.AdminPanel.Programatics
{
    public class MangeBackend : System.Web.UI.Page
    {

        protected virtual void Page_Init(object sender, EventArgs e)
        {
            foreach (object r in Page.Validators)
            {
                if (r is RequiredFieldValidator)
                {
                    RequiredFieldValidator req = r as RequiredFieldValidator;
                    req.Display = ValidatorDisplay.None;
                    req.ErrorMessage = "You must enter a value in this field";
                    AjaxControlToolkit.ValidatorCalloutExtender validatorCalloutExtender = new AjaxControlToolkit.ValidatorCalloutExtender();
                    validatorCalloutExtender.ID = req.ID + "vce";
                    validatorCalloutExtender.WarningIconImageUrl = "~/system/backend/lib/img/warning.gif";
                    validatorCalloutExtender.TargetControlID = req.ID;
                    validatorCalloutExtender.HighlightCssClass = "highlight";
                    req.Parent.Controls.Add(validatorCalloutExtender);
                }
                else if (r is CompareValidator)
                {
                    CompareValidator req = r as CompareValidator;
                    req.Display = ValidatorDisplay.None;
                    req.ErrorMessage = "Passwords do not Match";
                    AjaxControlToolkit.ValidatorCalloutExtender validatorCalloutExtender = new AjaxControlToolkit.ValidatorCalloutExtender();
                    validatorCalloutExtender.ID = req.ID + "ValidatorCalloutExtender1";
                    validatorCalloutExtender.WarningIconImageUrl = "~/system/backend/lib/img/warning.gif";
                    validatorCalloutExtender.TargetControlID = req.ID;
                    validatorCalloutExtender.HighlightCssClass = "highlight";
                    req.Parent.Controls.Add(validatorCalloutExtender);
                }
                else if (r is CustomValidator)
                {
                    CustomValidator req = r as CustomValidator;
                    req.Display = ValidatorDisplay.None;
                    AjaxControlToolkit.ValidatorCalloutExtender validatorCalloutExtender = new AjaxControlToolkit.ValidatorCalloutExtender();
                    validatorCalloutExtender.ID = req.ID + "ValidatorCalloutExtender1";
                    validatorCalloutExtender.TargetControlID = req.ID;
                    validatorCalloutExtender.HighlightCssClass = "highlight";
                    validatorCalloutExtender.WarningIconImageUrl = "~/system/backend/lib/img/warning.gif";
                    req.Parent.Controls.Add(validatorCalloutExtender);
                }
                else if (r is RangeValidator)
                {
                    RangeValidator req = r as RangeValidator;
                    req.Display = ValidatorDisplay.None;
                    AjaxControlToolkit.ValidatorCalloutExtender validatorCalloutExtender = new AjaxControlToolkit.ValidatorCalloutExtender();
                    validatorCalloutExtender.ID = req.ID + "ValidatorCalloutExtender1";
                    validatorCalloutExtender.TargetControlID = req.ID;
                    validatorCalloutExtender.HighlightCssClass = "highlight";
                    req.Parent.Controls.Add(validatorCalloutExtender);
                }
                else if (r is RegularExpressionValidator)
                {
                    RegularExpressionValidator req = r as RegularExpressionValidator;
                    req.Display = ValidatorDisplay.None;
                    AjaxControlToolkit.ValidatorCalloutExtender validatorCalloutExtender = new AjaxControlToolkit.ValidatorCalloutExtender();
                    validatorCalloutExtender.ID = req.ID + "ValidatorCalloutExtender1";
                    validatorCalloutExtender.TargetControlID = req.ID;
                    validatorCalloutExtender.HighlightCssClass = "highlight";
                    validatorCalloutExtender.WarningIconImageUrl = "~/system/backend/lib/img/warning.gif";
                    req.Parent.Controls.Add(validatorCalloutExtender);
                }
            }
        }
        public void BackendMessages(int MessageCode)
        {
            ContentPlaceHolder holder = (ContentPlaceHolder)Page.Master.FindControl("CPHContent");//content place holder
            if (holder != null)
            {
                System.Web.UI.HtmlControls.HtmlTableCell tr = holder.FindControl("msg") as System.Web.UI.HtmlControls.HtmlTableCell;
                if (tr != null)
                {
                    Label lblMsg = holder.FindControl("lblMessge") as Label;
                    if (lblMsg != null)
                    {
                        if (MessageCode == 101)// success
                        {
                            lblMsg.Text = "Done, changes has been saved successfully!"; tr.Attributes["class"] = "msg-success";
                        }
                        else if (MessageCode == 201)//error
                        {
                            lblMsg.Text = "Error, Please try again later!"; tr.Attributes["class"] = "msg-error";
                        }
                        else if (MessageCode == 202)//not enered password
                        {
                            lblMsg.Text = "Error, Please enter user password!"; tr.Attributes["class"] = "msg-error";
                        }
                    }
                }
            }
        }
        public string GetCompleteUrl(string page)
        {
            string[] splits = Request.Url.AbsoluteUri.Split('/');
            if (splits.Length >= 2)
            {
                string url = splits[0] + "//";
                for (int i = 2; i < splits.Length - 1; i++)
                {
                    url += splits[i];
                    url += "/";
                }
                return url + page;
            }
            return page;
        }
        public string MangeShowArrow(object RecOrd, string type, int RowsCount)
        {
            if (type == "D")//deleted
            {
                if (RowsCount > 0)
                {
                    if (int.Parse(RecOrd.ToString()) == RowsCount)
                    {
                        return "none";
                    }
                    return "block";
                }
                return "none";
            }
            else
            {
                if (RowsCount > 0)
                {
                    if (int.Parse(RecOrd.ToString()) == 1)
                        return "none";
                    return "block";
                }
                return "none";
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        public bool ContainsArabicLetters(string text)
        {
            foreach (char character in text.ToCharArray())
            {
                if (character >= 0x600 && character <= 0x6ff)
                    return true;
                if (character >= 0x750 && character <= 0x77f)
                    return true;
                if (character >= 0xfb50 && character <= 0xfc3f)
                    return true;
                if (character >= 0xfe70 && character <= 0xfefc)
                    return true;
            }
            return false;
        }
        public void ExportFile(GridView grdData, string value, bool VLCulomn)
        {
            if (!string.IsNullOrEmpty(value))
            {
                #region PDF
                if (value == "pdf")
                {
                    int clm = grdData.Columns.Count;
                    grdData.AllowPaging = false;
                    grdData.DataBind();
                    if (VLCulomn == true)
                        clm = grdData.Columns.Count - 1;
                    BaseFont bf = BaseFont.CreateFont(Environment.GetEnvironmentVariable("windir") + @"\fonts\Arial.ttf", BaseFont.IDENTITY_H, true);
                    iTextSharp.text.pdf.PdfPTable table = new iTextSharp.text.pdf.PdfPTable(clm);
                    int[] widths = new int[clm];
                    for (int x = 0; x < clm; x++)
                    {
                        widths[x] = (int)grdData.Columns[x].ItemStyle.Width.Value;
                        string cellText = Server.HtmlDecode(grdData.HeaderRow.Cells[x].Text);
                        iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 10, iTextSharp.text.Font.NORMAL);
                        font.Color = Color.WHITE;
                        iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(12, cellText, font));
                        cell.BackgroundColor = Color.BLACK;
                        cell.BorderColor = Color.WHITE;
                        table.AddCell(cell);
                    }
                    table.SetWidths(widths);
                    for (int i = 0; i < grdData.Rows.Count; i++)
                    {
                        if (grdData.Rows[i].RowType == DataControlRowType.DataRow)
                        {
                            for (int j = 0; j < clm; j++)
                            {
                                string cellText = Server.HtmlDecode(grdData.Rows[i].Cells[j].Text);
                                iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 10, iTextSharp.text.Font.NORMAL);
                                // font.Color = new Color(grdData.RowStyle.ForeColor);
                                iTextSharp.text.pdf.PdfPCell cell = new iTextSharp.text.pdf.PdfPCell(new Phrase(12, cellText, font));
                                if (grdData.Rows[i].Cells[j].Controls.Count > 0)
                                {
                                    for (int c = 0; c < grdData.Rows[i].Cells[j].Controls.Count; c++)
                                    {
                                        if (grdData.Rows[i].Cells[j].Controls[c].GetType() == typeof(Label))
                                        {
                                            Label lbl = grdData.Rows[i].Cells[j].Controls[c] as Label;
                                            cell.AddElement(new Phrase(12, lbl.Text, font));
                                        }
                                        else if (grdData.Rows[i].Cells[j].Controls[c].GetType() == typeof(System.Web.UI.WebControls.Image))
                                        {
                                            System.Web.UI.WebControls.Image img = grdData.Rows[i].Cells[j].Controls[c] as System.Web.UI.WebControls.Image;
                                            iTextSharp.text.Image Imgc = iTextSharp.text.Image.GetInstance(img.ImageUrl);
                                            Imgc.ScaleAbsolute((float)img.Width.Value, (float)img.Height.Value);
                                            cell.AddElement(Imgc);
                                        }

                                    }
                                }
                                //Set Color of row
                                if (i % 2 == 0)
                                {
                                    cell.BackgroundColor = Color.LIGHT_GRAY;
                                }
                                if (ContainsArabicLetters(cellText))
                                    cell.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
                                else
                                    cell.RunDirection = PdfWriter.RUN_DIRECTION_LTR;
                                cell.BorderColor = Color.WHITE;
                                table.AddCell(cell);
                            }
                        }
                    }
                    for (int x = 0; x < clm; x++)
                    {
                        widths[x] = (int)grdData.Columns[x].ItemStyle.Width.Value;
                        string cellText2 = Server.HtmlDecode(grdData.FooterRow.Cells[x].Text);
                        iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 10, iTextSharp.text.Font.NORMAL);
                        font.Color = Color.WHITE;
                        iTextSharp.text.pdf.PdfPCell cell2 = new iTextSharp.text.pdf.PdfPCell(new Phrase(12, cellText2, font));
                        cell2.BackgroundColor = Color.BLACK;
                        cell2.BorderColor = Color.WHITE;
                        table.AddCell(cell2);
                    }
                    table.SetWidths(widths);

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=" + Data.Extensions.GeneralMethods.CreateRandomName(10) + ".pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    StringWriter sw = new StringWriter();
                    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    grdData.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    pdfDoc.Add(table);
                    pdfDoc.Close();
                    Response.Write(pdfDoc);
                    Response.End();
                    grdData.AllowPaging = true;
                    grdData.DataBind();
                }
                #endregion
                #region Word
                else if (value == "word")
                {
                    grdData.AllowPaging = false;
                    grdData.DataBind();
                    Response.Clear();
                    Response.Buffer = true;
                    HidenColomn(grdData, VLCulomn);
                    grdData.AlternatingRowStyle.BackColor = System.Drawing.Color.LightGray;
                    grdData.HeaderStyle.BackColor = System.Drawing.Color.Black;
                    grdData.HeaderStyle.ForeColor = System.Drawing.Color.White;
                    grdData.FooterStyle.BackColor = System.Drawing.Color.Black;
                    grdData.FooterStyle.ForeColor = System.Drawing.Color.White;
                    Response.AddHeader("content-disposition",
                    "attachment;filename=" + Data.Extensions.GeneralMethods.CreateRandomName(10) + ".doc");
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.ms-word ";
                    StringWriter stw = new StringWriter();
                    HtmlTextWriter htw = new HtmlTextWriter(stw);
                    grdData.RenderControl(htw);
                    Response.Output.Write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"); // add this line to fix characterset in arabic
                    Response.Output.Write(stw.ToString());
                    Response.Flush();
                    Response.End();
                    grdData.AllowPaging = true;
                    grdData.DataBind();
                }
                #endregion
                #region Exel
                else if (value == "exel")
                {
                    string ARIALUNI_TFF = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Fonts), "Arial.ttf");
                    //Create a base font object making sure to specify IDENTITY-H
                    BaseFont bf = BaseFont.CreateFont(ARIALUNI_TFF, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
                    //Create a specific font object
                    iTextSharp.text.Font f = new iTextSharp.text.Font(bf, 12, iTextSharp.text.Font.NORMAL);
                    grdData.AllowPaging = false;
                    grdData.DataBind();
                    Response.Clear();
                    Response.Buffer = true;
                    HidenColomn(grdData, VLCulomn);
                    grdData.AlternatingRowStyle.BackColor = System.Drawing.Color.LightGray;
                    grdData.HeaderStyle.BackColor = System.Drawing.Color.Black;
                    grdData.HeaderStyle.ForeColor = System.Drawing.Color.White;
                    grdData.FooterStyle.BackColor = System.Drawing.Color.Black;
                    grdData.FooterStyle.ForeColor = System.Drawing.Color.White;
                    Response.AddHeader("content-disposition",
                    "attachment;filename=" + Data.Extensions.GeneralMethods.CreateRandomName(10) + ".xls");
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.ContentEncoding = System.Text.Encoding.UTF8;
                    StringWriter strw = new StringWriter();
                    HtmlTextWriter htmw = new HtmlTextWriter(strw);
                    grdData.RenderControl(htmw);
                    //style to format numbers to string
                    string style = @"<style> .textmode { mso-number-format:\@; } </style>";
                    Response.Output.Write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");// add this line to fix characterset in arabic
                    Response.Write(style);
                    Response.Output.Write(strw.ToString());
                    Response.Flush();
                    Response.End();
                    grdData.AllowPaging = true;
                    grdData.DataBind();
                }
                #endregion
            }
        }
        public void HidenColomn(GridView grdData, bool x)
        {
            int c = grdData.HeaderRow.Cells.Count;
            if (x)
            {

                if (grdData.HeaderRow != null && grdData.HeaderRow.Cells.Count > 0)
                {
                    grdData.HeaderRow.Cells[c - 1].Visible = false;
                }
                foreach (GridViewRow row in grdData.Rows)
                {
                    row.Cells[c - 1].Visible = false;

                }
            }
            else
            {
                if (grdData.HeaderRow != null && grdData.HeaderRow.Cells.Count > 0)
                {
                    grdData.HeaderRow.Cells[c - 1].Visible = true;
                }
                foreach (GridViewRow row in grdData.Rows)
                {
                    row.Cells[c - 1].Visible = true;

                }
            }

        }
    }
}
