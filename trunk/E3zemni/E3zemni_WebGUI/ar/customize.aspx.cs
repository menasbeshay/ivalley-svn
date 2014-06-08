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

namespace E3zemni_WebGUI.ar
{
    public partial class customize : System.Web.UI.Page
    {
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
                uiRadioButtonListLayouts.Items.Add(new ListItem(String.Format("<img src='{0}' style='width:100px' />", "../" + layout.LayoutImage), "../" + layout.LayoutImage + "#" + "../" + layout.LayeoutBackImage));
                layout.MoveNext();
            }

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

            Cards card = new Cards();
            card.LoadByPrimaryKey(CardID);

            uiImageMain.ImageUrl = "../" + card.MainPhoto;
        }

        protected void uiButtonApply_Click(object sender, EventArgs e)
        {
            try
            {
                System.Drawing.Graphics myGraphic = null;

                System.Drawing.Image imgF;// =new Image.FromFile(ImageBack);
                string[] images = uiRadioButtonListLayouts.SelectedValue.Split('#');                

                imgF = System.Drawing.Image.FromFile(Server.MapPath("~/" + images[0]));

                System.Drawing.Color backcolor = System.Drawing.ColorTranslator.FromHtml(uiHiddenFieldColor.Value);
                System.Drawing.Brush b = new System.Drawing.SolidBrush(backcolor);

                System.Drawing.Bitmap backimg = new System.Drawing.Bitmap(imgF.Width, imgF.Height);
                System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(backimg);
                g.FillRectangle(b, 0, 0, imgF.Width, imgF.Height);
                g.Save();
                string backpath = Guid.NewGuid().ToString();
                backimg.Save(Server.MapPath("~/images/UserOrders/" + backpath + "_1.jpeg"));


                System.Drawing.Image imgB;// =new Image.FromFile(ImageBack);
                imgB = System.Drawing.Image.FromFile(Server.MapPath("~/images/UserOrders/" + backpath + "_1.jpeg"));
                myGraphic = System.Drawing.Graphics.FromImage(imgB);
                myGraphic.SmoothingMode = SmoothingMode.HighQuality;
                myGraphic.DrawImageUnscaled(imgB, 0, 0);
                myGraphic.DrawImageUnscaled(imgF, 0, 0);
                myGraphic.Save();

                myGraphic.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAliasGridFit;

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
                    }
                }

                myGraphic.Save();

                string newpath = Guid.NewGuid().ToString();

                imgB.Save(Server.MapPath("~/images/UserOrders/" + newpath + "_2.jpeg"), System.Drawing.Imaging.ImageFormat.Jpeg);
                uiImageMain.ImageUrl = "~/images/UserOrders/" + newpath + "_2.jpeg";

                myGraphic.Dispose();

                UserPayement temp = new UserPayement();
                temp.AddNew();
                temp.CardID = CardID;
                temp.CardDesign = "images/UserOrders/" + newpath + "_2.jpeg";
                temp.CardCount = 1;
                Session["UserPayment"] = temp;

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