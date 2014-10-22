using ITravel.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITravel
{
    public partial class creditcards : BasePage
    {
        #region Properties
        public CreditCard CurrentCard
        {
            get
            {
                if (Session["CurrentCard"] != null)
                {
                    return (CreditCard)Session["CurrentCard"];
                }
                else
                    return null;
            }
            set
            {
                Session["CurrentCard"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = GetLocalResourceObject("PageTitle").ToString();
                
                LoadAllCards();
                uiPanelAll.Visible = true;
                uiPanelEdit.Visible = false;

            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
            CurrentCard = null;
        }

        protected void uiGridViewCards_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCards.PageIndex = e.NewPageIndex;
            LoadAllCards();
        }

        protected void uiGridViewCards_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditR")
            {
                CreditCard card = new CreditCard();
                card.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentCard = card;
                uiTextBoxName.Text = card.Name;
                uiTextBoxCardNumber.Text = card.CardNumber;
                uiTextBoxExpiry.Text = card.ExpiryMonthYear;
                uiTextBoxCCV.Text = card.CVV;                
                uiPanelAll.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteR")
            {
                CreditCard card = new CreditCard();
                card.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                card.MarkAsDeleted();
                card.Save();
                LoadAllCards();
            }
        }

        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            CreditCard card = new CreditCard();
            if (CurrentCard == null)
                card.AddNew();
            else
                card = CurrentCard;
            card.Name = uiTextBoxName.Text;
            card.CardNumber = uiTextBoxCardNumber.Text;
            card.CVV = uiTextBoxCCV.Text;
            card.ExpiryMonthYear = uiTextBoxExpiry.Text;
            
            card.Save();
            LoadAllCards();
            uiPanelAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
            CurrentCard = null;
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
            CurrentCard = null;
        }

        #endregion

        #region Methods
        private void LoadAllCards()
        {
            CreditCard Cards = new CreditCard();
            Cards.LoadAll();
            uiGridViewCards.DataSource = Cards.DefaultView;
            uiGridViewCards.DataBind();

        }


        private void ClearFields()
        {
            uiTextBoxCardNumber.Text = uiTextBoxName.Text = uiTextBoxExpiry.Text = uiTextBoxCCV.Text = "";
        }

        #endregion
    }
}