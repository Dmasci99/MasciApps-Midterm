using COMP2007_S2016_MidTerm_200299037.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP2007_S2016_MidTerm_200299037
{
    public partial class TodoDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTodo();
            }
        }

        /**
         * <summary>
         * This method populates the fields with an existing Todo.
         * </summary>
         * @method GetTodo
         * @returns {void}
         */ 
        protected void GetTodo()
        {
            int todoID = Convert.ToInt32(Request.QueryString["todoID"]);
            using (TodoConnection db = new TodoConnection())
            {
                Todo currentTodo = (from todo in db.Todos
                                   where todo.TodoID == todoID
                                   select todo).FirstOrDefault();
                if (currentTodo != null)
                {
                    NameTextBox.Text = currentTodo.TodoName;
                    NotesTextBox.Text = currentTodo.TodoNotes;
                    CompletedCheckBox.Checked = Convert.ToBoolean(currentTodo.Completed);
                }
                else
                    ErrorLabel.InnerText += "<br/>Problem retrieving Todo Data";
            }
        }

        /**
         * <summary>
         * This method handles the process of Saving a New or Existing Todo.
         * </summary>
         * @method TodoSaveButton_Click
         * @param {object} sender
         * @param {EventArgs} e
         * @returns {void}
         */ 
        protected void TodoSaveButton_Click(object sender, EventArgs e)
        {
            using (TodoConnection db = new TodoConnection())
            {
                Todo newTodo = new Todo();
                int todoID = -1;
                if (Request.QueryString.Count > 0)
                { //If Editing an existing Todo
                    todoID = Convert.ToInt32(Request.QueryString["todoID"]);
                    newTodo = (from todo in db.Todos
                               where todo.TodoID == todoID
                               select todo).FirstOrDefault();
                    if (newTodo == null)
                        ErrorLabel.InnerText += "<br/>Problem retrieving existing Todo";
                }
                //Prepare Todo with Values
                newTodo.TodoName = NameTextBox.Text;
                newTodo.TodoNotes = NotesTextBox.Text;
                newTodo.Completed = CompletedCheckBox.Checked;
                    
                if (todoID == -1) //Add New
                    db.Todos.Add(newTodo);

                db.SaveChanges(); //Saves db - updates/inserts
                Response.Redirect("~/TodoList.aspx");
            }
                
        }

        /**
         * <summary>
         * This method handles the process of Cancelling the adding/editing of a Todo.
         * </summary>
         * @method TodoCancelButton_Click
         * @param {object} sender
         * @param {EventArgs} e
         * @returns {void}
         */
        protected void TodoCancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/TodoList.aspx");
        }
    }
}