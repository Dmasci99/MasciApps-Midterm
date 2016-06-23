$(document).ready(function () {

    console.log("app started");

    $(".fa-trash-o").click(function () {
        return confirm("Are you sure you want to delete this record?");
    });
});