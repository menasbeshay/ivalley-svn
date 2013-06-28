<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Training.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Flights_GUI.Training.Courses" %>

<%@ MasterType VirtualPath="~/MasterPages/E_Training.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-reorder"></i>Add / Edit Courses</h4>
                    <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                        class="icon-remove"></a></span>
                </div>
                <div class="widget-body">
                <div class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label">
                            Course name</label>
                        <div class="controls">
                            <input type="text" placeholder="name" class="input-large" />
                            
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Course code</label>
                        <div class="controls">
                            <input type="text" placeholder="code" class="input-large" />
                            
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Description</label>
                        <div class="controls">
                            <textarea class="input-large" rows="3" cols="50"></textarea>
                            
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Alert date period (days)</label>
                        <div class="controls">
                            <input type="text" placeholder=" period (days)" class="input-large" />
                            
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Expiry date period (days)</label>
                        <div class="controls">
                            <input type="text" placeholder=" period (days)" class="input-large" />
                            
                        </div>
                    </div>
                
                    <div class="form-actions">
                        <button type="submit" class="btn blue">
                            <i class="icon-ok"></i>Save</button>
                        <button type="button" class="btn">
                            <i class=" icon-remove"></i>Cancel</button>
                    </div>
                </div>
                </div>
                </div>

        </div>
        </div>


    <div class="row-fluid">
        <div class="span12">
            <!-- BEGIN BORDERED TABLE widget-->
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-reorder"></i>Courses</h4>
                    <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                        class="icon-remove"></a></span>
                </div>
                <div class="widget-body">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                               
                                <th>
                                    Course
                                </th>
                                <th>
                                    Code
                                </th>
                                
                                <th>
                                    Alert Date Period (days)
                                </th>
                                <th>
                                    Expiry Date Period (days)
                                </th>
                                <th>
                                    Actions
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                
                                <td>
                                    Risk Management
                                </td>
                                <td>
                                    Risk Management
                                </td>
                                <td class="hidden-phone">
                                    -
                                </td>
                                <td>
                                    No expiry
                                </td>
                                <td>
                                    
                                        <button type="submit" class="btn blue">
                                            <i class="icon-edit"></i> Edit</button>
                                        <button type="button" class="btn">
                                            <i class=" icon-remove"></i> Delete</button>
                                    
                                </td>
                            </tr>
                            <tr>
                                
                                <td>
                                    Safty Management System
                                </td>
                                <td>
                                    SMS
                                </td>
                                <td class="hidden-phone">
                                    30
                                </td>
                                <td>
                                    365
                                </td>
                                <td>
                                    
                                        <button type="submit" class="btn blue">
                                            <i class="icon-edit"></i> Edit</button>
                                        <button type="button" class="btn">
                                            <i class=" icon-remove"></i> Delete</button>
                                    
                                </td>
                            </tr>
                            <tr>
                                
                                <td>
                                    Crew Resonse Management
                                </td>
                                <td>
                                    CRM
                                </td>
                                <td class="hidden-phone">
                                    30
                                </td>
                                <td>
                                    730
                                </td>
                                <td>
                                    
                                        <button type="submit" class="btn blue">
                                            <i class="icon-edit"></i> Edit</button>
                                        <button type="button" class="btn">
                                            <i class=" icon-remove"></i> Delete</button>
                                    
                                </td>
                            </tr>
                            <tr>
                                
                                <td>
                                    Area Check - C
                                </td>
                                <td>
                                    Area Check - C
                                </td>
                                <td class="hidden-phone">
                                    60
                                </td>
                                <td>
                                   365
                                </td>
                                <td>
                                    
                                        <button type="submit" class="btn blue">
                                            <i class="icon-edit"></i> Edit</button>
                                        <button type="button" class="btn">
                                            <i class=" icon-remove"></i> Delete</button>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- END BORDERED TABLE widget-->
        </div>
    </div>

</asp:Content>
