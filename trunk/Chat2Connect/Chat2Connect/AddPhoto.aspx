<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPhoto.aspx.cs" Inherits="Chat2Connect.AddPhoto" %>

<!DOCTYPE html>

<html style="width:800px;">
<head runat="server">
    <title></title>
     <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/base.css" rel="stylesheet" />    
    <link href="../css/skeleton_subject.css" rel="stylesheet" />    
    <link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />      
    <link href="../css/main.css" rel="stylesheet" />
    <script type="text/javascript">
        function close() {
            window.parent.closeDone();
        }

    </script>
</head>
<body style="min-width:800px !important;">
    <form id="form1" runat="server">
    <div style="width:750px;margin:0 auto;">
        <div class="form-horizontal blockBox">
            <div class="row">
                       
                        <i class="icon-2x icon-picture" style="float:left;margin-left:10px;"></i>
                        <h3 id="myModalLabel1">
                            إضافة صورة</h3>
                    </div>
                                <div class="form-group">
                                    
                                    <div class="col-sm-4 pull-right">                                        
                                          <asp:Image runat="server" ImageUrl="~/images/noimage.jpg" style="width:100px;" CssClass="img-thumbnail" ID="uiImageMain"/>
                                    </div>
                                    <div class="col-sm-8 pull-right" style="padding-top:70px;">
                                        <asp:FileUpload ID="uiFileUploadImage" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>الوصف </label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="uiTextBoxDesc" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label> </label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn btn-warning" style="text-decoration:none;" OnClick="uiLinkButtonAdd_Click">إضافة</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-default" OnClientClick="window.parent.closeDone();return false;">إغلاق</asp:LinkButton>                                        
                                    </div>
                                </div>
                            </div>

                                
        


    </div>
    </form>
</body>
</html>
