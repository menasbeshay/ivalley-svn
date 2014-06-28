using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.Data;
using System.Net;
using System.Configuration;
using System.Net.Mail;

namespace E3zemni_WebGUI.ar
{
    public partial class customize : System.Web.UI.Page
    {
        public MailMessage OrderMail
        {
            get
            {
                return (Session["Order_Mail"] != null) ? (MailMessage)Session["Order_Mail_Body"] : null;
            }

            set
            {
                Session["Order_Mail"] = value;
            }
        }
        public int CardID
        {
            get
            {
                if (Request.QueryString["cid"] != null)
                {
                    try
                    {
                        return int.Parse(Request.QueryString["cid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        return 0;
                    }

                }
                else
                {
                    return 0;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCardInfo();
                uipanelError.Visible = false;
            }
        }

        private void LoadCardInfo()
        {
            CardLayouts layout = new CardLayouts();
            layout.GetCardLayoutByCardID(CardID);
            for (int i = 0; i < layout.RowCount; i++)
            {
                uiRadioButtonListLayouts.Items.Add(new ListItem(String.Format("<img src='{0}' style='width:100px' />", ".." + layout.LayoutImage), ".." + layout.LayoutImage + "#" + ".." + layout.LayeoutBackImage));
                layout.MoveNext();
            }

            if (uiRadioButtonListLayouts.Items.Count > 0)
                uiRadioButtonListLayouts.Items[0].Selected = true;

            CardColor colors = new CardColor();
            colors.GetCardColorsByCardID(CardID);
            uiRepeaterColors.DataSource = colors.DefaultView;
            uiRepeaterColors.DataBind();

            Dimension dims = new Dimension();
            dims.GetAllDims();
            uiRepeaterSizes.DataSource = dims.DefaultView;
            uiRepeaterSizes.DataBind();

            CardText texts = new CardText();
            texts.GetCardTxtByCardID(CardID);
            uiDataListCardText.DataSource = texts.DefaultView;
            uiDataListCardText.DataBind();


            CardImages images = new CardImages();
            images.GetCardImageByCardID(CardID);
            uiDataListImages.DataSource = images.DefaultView;
            uiDataListImages.DataBind();
           

            Cards card = new Cards();
            card.LoadByPrimaryKey(CardID);

            uiImageMain.ImageUrl = "../" + card.MainPhoto;
        }

        protected void uiButtonApply_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage msg = new MailMessage();
                msg.IsBodyHtml = true;

                System.Drawing.Graphics myGraphic = null;
                string[] images = uiRadioButtonListLayouts.SelectedValue.Split('#');

                System.Drawing.Image imgSelectedLayout;
                imgSelectedLayout = System.Drawing.Image.FromFile(Server.MapPath("~/" + images[0]));

                // add layout as attach
                msg.Attachments.Add(new Attachment(Server.MapPath("~/" + images[0])));

                System.Drawing.Color backcolor = System.Drawing.ColorTranslator.FromHtml(uiHiddenFieldColor.Value);
                System.Drawing.Brush b = new System.Drawing.SolidBrush(backcolor);

                // add background color
                msg.Body += "<br /> =========================================================== <br />";
                msg.Body += " ========================= Background color ================== <br />";

                msg.Body += "Background Color : " + uiHiddenFieldColor.Value + "<br />";

                System.Drawing.Bitmap backgroundcolor = new System.Drawing.Bitmap(imgSelectedLayout.Width, imgSelectedLayout.Height);
                System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(backgroundcolor);
                g.FillRectangle(b, 0, 0, imgSelectedLayout.Width, imgSelectedLayout.Height);
                g.Save();
                string backpath = Guid.NewGuid().ToString();
                backgroundcolor.Save(Server.MapPath("~/images/UserOrders/" + backpath + "_1.jpeg"));


                System.Drawing.Image GeneratedImg;// =new Image.FromFile(ImageBack);
                GeneratedImg = System.Drawing.Image.FromFile(Server.MapPath("~/images/UserOrders/" + backpath + "_1.jpeg"));
                myGraphic = System.Drawing.Graphics.FromImage(GeneratedImg);
                myGraphic.SmoothingMode = SmoothingMode.HighQuality;
                // draw background 
                myGraphic.DrawImageUnscaled(GeneratedImg, 0, 0);

                msg.Body += "<br /> =========================================================== <br />";
                msg.Body += " ========================= Images Info ================== <br />";

                //draw user uploaded images
                foreach (DataListItem dli in uiDataListImages.Items)
                {
                    if (dli.ItemType == ListItemType.Item || dli.ItemType == ListItemType.AlternatingItem)
                    {
                        FileUpload imgfile = (FileUpload)dli.FindControl("uiFileUploadImg");
                        HiddenField hfPath = (HiddenField)dli.FindControl("uiHiddenFieldPath");
                        HiddenField hf = (HiddenField)dli.FindControl("uiHiddenFieldImgID");

                        HiddenField contrast = (HiddenField)dli.FindControl("uiHiddenFieldContrast");
                        HiddenField brightness = (HiddenField)dli.FindControl("uiHiddenFieldBrightness");
                        HiddenField rotate = (HiddenField)dli.FindControl("uiHiddenFieldRotate");

                        DropDownList style = (DropDownList)dli.FindControl("uiDropDownListStyle");
                        System.Web.UI.WebControls.Image current = (System.Web.UI.WebControls.Image)dli.FindControl("uiImageCurrent");
                        CardImages img = new CardImages();
                        img.LoadByPrimaryKey(Convert.ToInt32(hf.Value));
                        string path = hfPath.Value;
                        if (imgfile.HasFile)
                        {
                            path = "images/UserOrders/cardImages/" + Guid.NewGuid().ToString() + imgfile.FileName;
                            imgfile.SaveAs(Server.MapPath("~/" + path));
                            hfPath.Value = path;
                            current.ImageUrl = path;
                            current.Visible = true;
                        }

                        if (!string.IsNullOrEmpty(path))
                        {
                            System.Drawing.Image currentCardImage;
                            WebClient webclient = new WebClient();
                            System.IO.Stream s = webclient.OpenRead(ConfigurationManager.AppSettings["appHome"] + "ImageOnDemand.ashx?url=" + path + "&brightness=" + brightness.Value + "&contrast=" + contrast.Value + "&" + style.SelectedValue);
                            currentCardImage = System.Drawing.Image.FromStream(s);

                            if (float.Parse(rotate.Value) > 0)
                            {
                                myGraphic.TranslateTransform((float)img.ImgWidth / 2, (float)img.ImgHieght / 2);
                                myGraphic.RotateTransform(float.Parse(rotate.Value));
                                myGraphic.DrawImageUnscaled(currentCardImage, img.PosX, img.PosY, img.ImgWidth, img.ImgHieght);
                                myGraphic.RotateTransform(-float.Parse(rotate.Value));
                                myGraphic.TranslateTransform(-(float)img.ImgWidth / 2, -(float)img.ImgHieght / 2);
                            }
                            else
                            {
                                myGraphic.DrawImageUnscaled(currentCardImage, img.PosX, img.PosY, img.ImgWidth, img.ImgHieght);
                            }

                            // add image uploaded by user as attachment 
                            msg.Attachments.Add(new Attachment(Server.MapPath("~/" + path)));
                            msg.Body += "Image " + (dli.ItemIndex + 1).ToString() + " : <br />";
                            msg.Body += "contrust :  " + contrast.Value + "<br />";
                            msg.Body += "brightness :  " + brightness.Value + " <br />";
                            msg.Body += "rotaion : " + rotate.Value + " <br />";
                            msg.Body += "style : " + style.SelectedValue.Substring(0, style.SelectedValue.IndexOf("=")) + " <br />";

                        }

                    }
                }

                // draw layout 
                myGraphic.DrawImageUnscaled(imgSelectedLayout, 0, 0, imgSelectedLayout.Width, imgSelectedLayout.Height);
                myGraphic.Save();

                // draw strings 
                myGraphic.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAliasGridFit;
                msg.Body += "<br /> =========================================================== <br />";
                msg.Body += " ========================= Text Info ================== <br />";


                foreach (DataListItem dli in uiDataListCardText.Items)
                {
                    if (dli.ItemType == ListItemType.Item || dli.ItemType == ListItemType.AlternatingItem)
                    {
                        HiddenField hf = (HiddenField)dli.FindControl("uiHiddenFieldTextID");
                        HiddenField hfc = (HiddenField)dli.FindControl("uiHiddenFieldMyColor");
                        DropDownList ddlfont = (DropDownList)dli.FindControl("uiDropDownListFonts");
                        DropDownList ddlfontsize = (DropDownList)dli.FindControl("uiDropDownListFontSize");
                        CardText text = new CardText();
                        TextBox tb = (TextBox)dli.FindControl("uiTextBoxText");
                        text.LoadByPrimaryKey(Convert.ToInt32(hf.Value));

                        System.Drawing.Color fontcolor = System.Drawing.ColorTranslator.FromHtml(hfc.Value);
                        System.Drawing.Brush fontbrush = new System.Drawing.SolidBrush(fontcolor);

                        myGraphic.DrawString(tb.Text, new Font(ddlfont.SelectedItem.Text, Convert.ToInt32(ddlfontsize.SelectedItem.Text), FontStyle.Italic), fontbrush, new RectangleF(text.PosX, text.PosY, text.Width, text.Height));

                        msg.Body += text.TextLabel + " : " + tb.Text + "<br />";
                        msg.Body += "font :  " + ddlfont.SelectedItem.Text + "<br />";
                        msg.Body += "font size :  " + ddlfontsize.SelectedItem.Text + " <br />";
                        msg.Body += "color : " + hfc.Value + " <br />";
                    }
                }

                myGraphic.Save();

                string newpath = Guid.NewGuid().ToString();

                // save generated img
                GeneratedImg.Save(Server.MapPath("~/images/UserOrders/" + newpath + "_2.jpeg"), System.Drawing.Imaging.ImageFormat.Jpeg);
                uiImageMain.ImageUrl = "~/images/UserOrders/" + newpath + "_2.jpeg";

                // add final image as attachment 
                msg.Attachments.Add(new Attachment(Server.MapPath("~/images/UserOrders/" + newpath + "_2.jpeg")));

                myGraphic.Dispose();

                UserPayement temp = new UserPayement();
                temp.AddNew();
                temp.CardID = CardID;
                temp.CardDesign = "images/UserOrders/" + newpath + "_2.jpeg";
                temp.CardCount = 1;
                Session["UserPayment"] = temp;
                uipanelError.Visible = false;

                OrderMail = msg;

            }
            catch (Exception ex)
            {
                uipanelError.Visible = true;
            }
        }

        protected void uiRadioButtonListLayouts_SelectedIndexChanged(object sender, EventArgs e)
        {
            string[] images = uiRadioButtonListLayouts.SelectedValue.Split('#');
            uiImageMain.ImageUrl = images[0];
            ImageBack.ImageUrl = images[1];
        }

        protected void uiRepeaterColors_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Literal l = (Literal)e.Item.FindControl("uiLiteralLabel");
                DataRowView row = (DataRowView)e.Item.DataItem;
                E3zmni.BLL.Color c = new E3zmni.BLL.Color();
                c.LoadByPrimaryKey(Convert.ToInt32(row["ColorID"].ToString()));
                l.Text = "<input type='radio' name='color' value='#" + c.ColorCode + "' id='color_" + c.ColorID + "' class='def-color'/><label for='color_" + c.ColorID + "' style='background: #" + c.ColorCode + "'></label>";
            }
        }

        protected void uiRepeaterSizes_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                Literal label = (Literal)e.Item.FindControl("uiLiteralLabel");
                label.Text = "<label for='size_" + row["DimensionID"].ToString() + "' >" + row["DisplayName"].ToString() + "</label>";
            }
        }

        protected void uiDataListCardText_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                TextBox textbox = (TextBox)e.Item.FindControl("uiTextBoxText");
                DataRowView row = (DataRowView)e.Item.DataItem;
                if (row["IsMultiLine"] != null)
                {
                    if ((bool)row["IsMultiLine"] == true)
                        textbox.TextMode = TextBoxMode.MultiLine;
                }
            }

        }
    }
}