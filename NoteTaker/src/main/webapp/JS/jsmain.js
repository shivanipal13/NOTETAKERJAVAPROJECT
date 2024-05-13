/**
 * 
 */

 function updateSucessMessage(noteId) {
    try {
        var xhr = new XMLHttpRequest();
        xhr.open("Post", "UpdateServlet?note_id=" + noteId, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState ==4) {
                if (xhr.status == 200) {
                    alert(xhr.responseText);
                    location.reload();
                } else {
                    alert("Error updating note.");
                }
            }
        };
        xhr.send();
    } catch (error) {
        console.error("An error occurred while making the Ajax request:", error);
    }
}