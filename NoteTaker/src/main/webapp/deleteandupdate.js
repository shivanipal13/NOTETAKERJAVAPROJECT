/**
 * 
 */
// main.js

function deleteNoteConfirmation(noteId) {
    var confirmation = confirm("Are you sure you want to delete this note?");
    if (confirmation) {
        deleteNoteAjaxRequest(noteId);
    }
}


function deleteNoteAjaxRequest(noteId) {
    try {
        var xhr = new XMLHttpRequest();
        xhr.open("DELETE", "DeleteServlet1?note_id=" + noteId, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    alert(xhr.responseText); // Display delete message
                    location.reload(); // Reload the page after successful deletion
                } else {
                    alert("Error deleting note.");
                }
            }
        };
        xhr.send();
    } catch (error) {
        console.error("An error occurred while making the Ajax request:", error);
    }
}









function updateNoteConfirmation(noteId) {
    var confirmation = confirm("Are you sure you want to update this note?");
    if (confirmation) {
        updateSucessMessage(noteId);
    }
}



