<%@ Page Title="Todo Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TodoDetails.aspx.cs" Inherits="COMP2007_S2016_MidTerm_200299037.TodoDetails" %>
<%-- 
/**
* Author : Daniel Masci - 200299037
* Class : Enterprise Computing
* Semester : 4
* Professor : Tom Tsiliopolous
* Purpose : Midterm
* Website Name : MasciApps-Midterm.azurewebsites.net/TodoDetails.aspx
*
* Version: 1.0.2
* Date Modified: 2016-06-23
* 
* The Following page is the Content for the "TodoDetails" page.
* Allows users to Edit an existing Todo or Add a new Todo.
*/ 
--%>


<asp:Content ID="TodoDetailsPageContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <div class="todo-page" id="tododetails">
        <div class="container">
            <div class="form">
                <div runat="server" id="ErrorLabel" class="error"></div>
                <h2 runat="server" id="Title">Add Todo</h2>
                <div class="input-container">
                    <asp:Label runat="server" ID="NameLabel" Text="Todo Name"></asp:Label>
                    <asp:TextBox runat="server" ID="NameTextBox" Placeholder="Todo Name" required="true"></asp:TextBox>
                </div>
                <div class="input-container">
                    <asp:Label runat="server" ID="NotesLabel" Text="Todo Notes"></asp:Label>
                    <asp:TextBox runat="server" ID="NotesTextBox" TextMode="MultiLine" Placeholder="Todo Notes" required="true"></asp:TextBox>
                </div>
                <div class="input-container">
                    <asp:CheckBox runat="server" ID="CompletedCheckBox" Checked="false" Text=" Todo Completed?"/>
                </div>
                <div class="submit">
                    <asp:Button runat="server" CssClass="cancel" ID="TodoCancelButton" Text="Cancel" UseSubmitBehaviour="false"
                        CausesValidation="false" OnClick="TodoCancelButton_Click" />
                    <asp:Button runat="server" CssClass="save" ID="TodoSaveButton" Text="Save" UseSubmitBehaviour="true"
                        CausesValidation="true" OnClick="TodoSaveButton_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
