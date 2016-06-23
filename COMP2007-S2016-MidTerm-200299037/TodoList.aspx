<%@ Page Title="Todo List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TodoList.aspx.cs" Inherits="COMP2007_S2016_MidTerm_200299037.TodoList" %>
<%-- 
/**
* Author : Daniel Masci - 200299037
* Class : Enterprise Computing
* Semester : 4
* Professor : Tom Tsiliopolous
* Purpose : Midterm
* Website Name : MasciApps-Midterm.azurewebsites.net/TodoList.aspx
*
* Version: 1.0.2
* Date Modified: 2016-06-23
* 
* The Following page is the Content for the "TodoList" page.
* Lists all the Todo's and their fields.
* Allows users to Edit or Delete.
* 
*/ 
--%>

<asp:Content ID="TodoListPageContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <div class="todo-page" id="todolist">
        <div class="container">
            <div runat="server" id="ErrorLabel" class="error"></div>

            <div class="button">
                <a href="/TodoDetails.aspx"><i class="fa fa-plus-circle"></i> Add Todo</a>
            </div>
            <asp:GridView runat="server" ID="TodoGridView" DataKeyNames="TodoID" AutoGenerateColumns="false"
                AllowSorting="true" OnSorting="TodoGridView_Sorting"
                OnRowDataBound="TodoGridView_RowDataBound" OnRowDeleting="TodoGridView_RowDeleting">      
                <Columns>
                    <asp:TemplateField runat="server" HeaderText="<i class='fa fa-check'></i>" SortExpression="Completed">
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="CompletedCheckBox" AutoPostBack="true" OnCheckedChanged="CompletedCheckBox_CheckedChanged"
                                Checked='<%# DataBinder.Eval(Container.DataItem, "Completed") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField runat="server" DataField="TodoName" HeaderText="Name" SortExpression="TodoName" />
                    <asp:BoundField runat="server" DataField="TodoNotes" HeaderText="Notes" SortExpression="TodoNotes" />
                    <asp:HyperLinkField runat="server" Text="<i class='fa fa-pencil'></i>" HeaderText="<i class='fa fa-pencil'></i>" 
                        DataNavigateUrlFields="TodoID" DataNavigateUrlFormatString="TodoDetails.aspx?TodoID={0}"
                        NavigateUrl="~/TodoDetails.aspx" />               
                    <asp:CommandField runat="server" DeleteText="<i class='fa fa-trash-o deleteTodo'></i>" HeaderText="<i class='fa fa-trash-o'></i>" 
                        ShowDeleteButton="true" ButtonType="Link" />
                </Columns>      
            </asp:GridView>
        </div>    
    </div>    

</asp:Content>
