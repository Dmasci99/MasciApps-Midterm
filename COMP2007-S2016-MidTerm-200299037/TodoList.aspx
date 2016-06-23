<%@ Page Title="Todo List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TodoList.aspx.cs" Inherits="COMP2007_S2016_MidTerm_200299037.TodoList" %>

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
                                Checked='<%# DataBinder.Eval(Container.DataItem, "Completed") %>' />
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
