using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using COMP2007_S2016_MidTerm_200299037.Models;
using System.Linq.Dynamic;

namespace COMP2007_S2016_MidTerm_200299037
{
    public partial class TodoList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["SortColumn"] = "TodoID";
                Session["SortDirection"] = "ASC";
                this.GetTodos();
            }            
        }
        /**
         * <summary>
         * This method retrieves all the Todos from the db using EF.
         * </summary>
         * @method GetTodos
         * @returns {void} 
         */ 
        protected void GetTodos()
        {
            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            using (TodoConnection db = new TodoConnection())
            {
                var todos = (from allTodos in db.Todos
                             select allTodos);
                if (todos != null)
                {
                    TodoGridView.DataSource = todos.AsQueryable().OrderBy(sortString).ToList();
                    TodoGridView.DataBind();
                }
                else
                    ErrorLabel.InnerText += "<br/>Problem retrieving Todo Data";
            }
        }

        /**
         * <summary>
         * This Method determines the SortDirection of the clicked column.
         * </summary>
         * @method TodoGridView_RowDataBound
         * @param {object} sender
         * @param {GridViewRowEventArgs} e
         * @returns {void}
         */
        protected void TodoGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                { //If Header Row is clicked
                    LinkButton linkButton = new LinkButton();
                    for (int x = 0; x < TodoGridView.Columns.Count; x++)
                    {
                        if (TodoGridView.Columns[x].SortExpression == Session["SortColumn"].ToString())
                        { //Target specific Column
                            //Assign appropriate font-awesome icon
                            linkButton.Text = Session["SortDirection"].ToString() == "ASC" ?
                                " <i class='fa fa-caret-down'></i>" : " <i class='fa fa-caret-up'></i>";
                            //Update Header LinkButton
                            e.Row.Cells[x].Controls.Add(linkButton);
                        }
                    }
                }
                else if (e.Row.RowType == Check)
            }
        }

        /**
         * <summary>
         * This method sets the Session Variables: SortDirection and SortColumn.
         * </summary>
         * @method TodoGridView_Sorting
         * @param {object} sender
         * @param {GridViewSortEventArgs} e
         * @returns {void}
         */
        protected void TodoGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            Session["SortColumn"] = e.SortExpression; //Set SortColumn
            this.GetTodos(); //Refresh GridView
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC"; //Toggle SortDirection
        }

        /**
         * <summary>
         * This method handles the process of deleting a Todo.
         * </summary>
         * @method TodoGridView_RowDeleting
         * @param {object} sender
         * @param {GridViewDeleteEventArgs} e
         * @returns {void} 
         */
        protected void TodoGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int todoID = Convert.ToInt32(TodoGridView.DataKeys[e.RowIndex].Values["TodoID"]);
            using (TodoConnection db = new TodoConnection())
            {
                var todoToDelete = (from todo in db.Todos
                                    where todo.TodoID == todoID
                                    select todo).FirstOrDefault();
                if (todoToDelete != null)
                {
                    db.Todos.Remove(todoToDelete); //Remove Tood from db
                    db.SaveChanges(); //Save changes made to db
                }
                else
                    ErrorLabel.InnerText += "<br/>Failed to Delete Todo";
                this.GetTodos(); //Refresh GridView
            }
        }

        /**
         * <summary>
         * This method handles the process of changing the "Completed" value of a Tood.
         * </summary>
         * @method CompletedCheckBox_CheckedChange
         * @param {object} sender
         * @param {EventArgs} e
         * @returns {void}
         */ 
        protected void CompletedCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            using (TodoConnection db = new TodoConnection())
            {

            }
        }
    }
}