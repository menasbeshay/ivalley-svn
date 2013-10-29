using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
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
                /*
                ChatRoom rooms = new ChatRoom();
                rooms.GetChatRoomsByCategoryID(cats.CategoryID);
                if (rooms.RowCount > 0)
                {
                    for (int j = 0; j < rooms.RowCount; j++)
                    {
                        TreeNode subnode = new TreeNode();
                        subnode.Text = rooms.Name;
                        subnode.Tag = rooms.ChatRoomID;
                        node.Nodes.Add(subnode);
                        rooms.MoveNext();
                    }
                }
                */

                uitreeViewCats.Nodes.Add(node);
                cats.MoveNext();
            }


        }

    }
}
