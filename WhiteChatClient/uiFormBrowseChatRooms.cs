using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using WhiteChat.BLL;
namespace WhiteChatClient
{
    public partial class uiFormBrowseChatRooms : Form
    {
        public uiFormBrowseChatRooms()
        {
            InitializeComponent();
            LoadCategoriesAndSubCategories();
        }

        private void LoadCategoriesAndSubCategories()
        {
            Category cats = new Category();
            cats.LoadAll();
            for (int i = 0; i < cats.RowCount; i++)
            {
                TreeNode node = new TreeNode();
                node.Text = cats.Name;
                node.Tag = cats.CategoryID;
                SubCategory subs = new SubCategory();
                subs.GetSubCategoryByCategoryID(cats.CategoryID);

                if (subs.RowCount > 0)
                {
                    for (int j = 0; j < subs.RowCount; j++)
                    {
                        TreeNode subnode = new TreeNode();
                        subnode.Text = subs.Name;
                        subnode.Tag = subs.SubCategoryID;
                        node.Nodes.Add(subnode);
                        subs.MoveNext();
                    }
                }


                uitreeViewCats.Nodes.Add(node);
                cats.MoveNext();
            }


        }

        private void uitreeViewCats_AfterSelect(object sender, TreeViewEventArgs e)
        {

            ChatRoom rooms = new ChatRoom();
            uitreeViewRooms.Nodes.Clear();
            if (e.Node.Level == 0)
            {
                rooms.GetChatRoomsByCategoryID(Convert.ToInt32(e.Node.Tag));
                if (rooms.RowCount > 0)
                {
                    for (int j = 0; j < rooms.RowCount; j++)
                    {
                        TreeNode subnode = new TreeNode();
                        subnode.Text = rooms.Name + " (" + rooms.GetColumn("MemberCount").ToString() + ")";
                        subnode.Tag = rooms.ChatRoomID;
                        uitreeViewRooms.Nodes.Add(subnode);
                        rooms.MoveNext();
                    }
                }
            }
            else if (e.Node.Level == 1)
            {
                rooms.GetChatRoomsBySubCategoryID(Convert.ToInt32(e.Node.Tag));
                if (rooms.RowCount > 0)
                {
                    for (int j = 0; j < rooms.RowCount; j++)
                    {
                        TreeNode subnode = new TreeNode();
                        subnode.Text = rooms.Name + " (" + rooms.GetColumn("MemberCount").ToString() + ")";
                        subnode.Tag = rooms.ChatRoomID;
                        uitreeViewRooms.Nodes.Add(subnode);
                        rooms.MoveNext();
                    }
                }
            }
        }

        private void uibuttonCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void uibuttonJoin_Click(object sender, EventArgs e)
        {
            if (uitreeViewRooms.SelectedNode == null)
            {
                MessageBox.Show(this, "Please , select a room to join.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                int cat = 0, subcat = 0, chatroom = 0;
                chatroom = (int)uitreeViewRooms.SelectedNode.Tag;
                if (uitreeViewCats.SelectedNode.Level == 0)
                    cat = (int)uitreeViewCats.SelectedNode.Tag;

                if (uitreeViewCats.SelectedNode.Level == 1)
                {
                    subcat = (int)uitreeViewCats.SelectedNode.Tag;
                    cat = (int)uitreeViewCats.SelectedNode.Parent.Tag;
                }

                if (Convert.ToInt32(uitreeViewRooms.SelectedNode.Text.Substring(uitreeViewRooms.SelectedNode.Text.IndexOf("(") + 1, uitreeViewRooms.SelectedNode.Text.IndexOf(")") - (uitreeViewRooms.SelectedNode.Text.IndexOf("(") + 1)).Trim()) < 50)
                {
                    uiFormChatRoom chatRooms = new uiFormChatRoom();
                    System.Threading.Thread.Sleep(3000);
                    chatRooms.Text = uitreeViewRooms.SelectedNode.Text.Substring(0, uitreeViewRooms.SelectedNode.Text.IndexOf("("));
                    chatRooms.Init(cat, subcat, chatroom);
                    chatRooms.Show();
                    chatRooms.BringToFront();
                    chatRooms.Focus();
                    this.Close();
                }
                else
                {
                    MessageBox.Show(this, "Sorry , Maximum room members is 50 members. Please choose another room.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}
