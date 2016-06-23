<%@ Page Title="Todo Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TodoDetails.aspx.cs" Inherits="COMP2007_S2016_MidTerm_200299037.TodoDetails" %>

<asp:Content ID="TodoDetailsPageContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <div class="todo-page" id="tododetails">
        <div class="todo-container">
            <div runat="server" id="ErrorLabel" class="error"></div>

            <div class="input-container">
                <asp:TextBox runat="server" ID="NameTextBox" Placeholder="Todo Name" required="true"></asp:TextBox>
            </div>
            <div class="input-container">
                <asp:TextBox runat="server" ID="NotesTextBox" Placeholder="Todo Notes" required="true"></asp:TextBox>
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

</asp:Content>
